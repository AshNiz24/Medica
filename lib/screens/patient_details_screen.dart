import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/components/addpicture.dart';
import 'package:medico/components/input_text.dart';
import 'package:medico/patient_details_model.dart';

Patient patient = Patient();

class PatientDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF3EFFB7),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      blurRadius: 3,
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Info',
                      style:
                          TextStyle(fontSize: 25, color: Colors.grey.shade800),
                    ),
                    InputTextField(
                      patient: patient,
                      label: 'Name',
                    ),
                    InputTextField(
                      patient: patient,
                      label: 'Age',
                    ),
                    InputTextField(
                      label: 'Gender',
                      patient: patient,
                    ),
                    InputTextField(
                      label: 'Temp(⁰C/⁰F)',
                      patient: patient,
                    ),
                    InputTextField(
                      label: 'Symptoms',
                      patient: patient,
                    ),
                    InputTextField(
                      label: 'Health History',
                      patient: patient,
                    ),
                    Text('Add pictures:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AddPictureBox(
                          plus: Icons.camera_alt_outlined,
                        ),
                        AddPictureBox(
                          plus: Icons.camera_alt_outlined,
                        ),
                        AddPictureBox(
                          plus: Icons.camera_alt_outlined,
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        ///60% of device screen width  is covered
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                          ///button styling with colour, border etc
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(12),
                            primary: Color(0xFF0A36CD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          //TODO: Add functionality to the button
                          onPressed: () {
                            patient.display();
                          },
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
