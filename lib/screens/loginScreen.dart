import 'package:flutter/material.dart';
import 'package:medico/DocModel.dart';
import 'package:medico/components/inputLoginCred.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

DoctorDetails doctorDetails = DoctorDetails();

class _LoginState extends State<Login> {
  final auth = FirebaseAuth.instance;
  final dataBaseRef = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  InputTextFieldDoc(
                    label: 'E-mail',
                    doctor: doctorDetails,
                  ),
                  InputTextFieldDoc(
                    label: 'Password',
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
                          try {
                            final user = await auth.signInWithEmailAndPassword(
                              email: doctorDetails.mail,
                              password: doctorDetails.pswd,
                            );
                            if (user != null) {
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Text(
                          'LOGIN',
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
    );
  }
}
