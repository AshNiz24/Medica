import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medico/DocModel.dart';
import 'package:medico/components/inputLoginCred.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:medico/docPatList.dart';

DoctorDetails doctorDetails = DoctorDetails();

class DoctorDetailsScreen extends StatefulWidget {
  @override
  _DoctorDetailsScreenState createState() => _DoctorDetailsScreenState();
}

class _DoctorDetailsScreenState extends State<DoctorDetailsScreen> {
  final dataBaseRef = Firestore.instance;
  final auth = FirebaseAuth.instance;
  bool setSpinner = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF58BD2),
        body: ModalProgressHUD(
          inAsyncCall: setSpinner,
          child: Padding(
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
                        'Doctor Info',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      InputTextFieldDoc(
                        doctor: doctorDetails,
                        label: 'Name',
                      ),
                      InputTextFieldDoc(
                        doctor: doctorDetails,
                        label: 'Field of Expertise',
                      ),
                      InputTextFieldDoc(
                        label: 'Mail',
                        doctor: doctorDetails,
                      ),
                      InputTextFieldDoc(
                        label: 'Password',
                        doctor: doctorDetails,
                      ),
                      InputTextFieldDoc(
                        label: 'Phone Num',
                        doctor: doctorDetails,
                      ),
                      Center(
                        child: Container(
                          ///60% of device screen width  is covered
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ElevatedButton(
                            ///button styling with colour, border etc
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all(12),
                              primary: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            //TODO: Add functionality to the button
                            onPressed: () async {
                              DocumentReference ref =
                                  await dataBaseRef.collection('doctor').add({
                                'Name': doctorDetails.name,
                                'Field of Expertise': doctorDetails.expertise,
                                'E-mail': doctorDetails.mail,
                                'Phone Number': doctorDetails.phn
                              });
                              print(ref.documentID);
                              doctorList.add(ref.documentID);
                              setState(() {
                                setSpinner = true;
                              });
                              try {
                                final newUser =
                                    await auth.createUserWithEmailAndPassword(
                                        email: doctorDetails.mail,
                                        password: doctorDetails.pswd);

                                if (newUser != null) {
                                  Navigator.pop(context);
                                }
                                setState(() {
                                  setSpinner = false;
                                });
                              } catch (e) {}
                            },
                            child: Text(
                              'REGISTER',
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
      ),
    );
  }
}
