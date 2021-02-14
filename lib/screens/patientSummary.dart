import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseUser loggedInUser;
final _cloud = Firestore.instance;

class PatientStream extends StatefulWidget {
  @override
  _PatientStreamState createState() => _PatientStreamState();
}

class _PatientStreamState extends State<PatientSummary> {
  String name;
  String age;
  String temp;
  String gender;
  List symptoms;
  List history;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _cloud.collection('patient').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          final patients = snapshot.data.documents;
          List<PatientButton> patientButton = [];
          for (var i in patients) {
            name = i.data['Name'];
            age = i.data['Age'];
            gender = i.data['Gender'];
            symptoms = i.data['Symptoms'];
            history = i.data['Health History'];
            temp = i.data['Temperature'];
            patientButton.add(PatientButton(
              name: name,
              age: age,
              symptom: symptoms,
              history: history,
              temp: temp,
              gender: gender,
            ));
          }
          return Expanded(
              child: ListView(
            children: patientButton,
          ));
        } else
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
      },
    );
  }
}

class PatientSummary extends StatefulWidget {
  @override
  _PatientSummaryState createState() => _PatientSummaryState();
}

class _PatientSummaryState extends State<PatientSummary> {
  final _auth = FirebaseAuth.instance;
  void getUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  final Firestore dbRef = Firestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF58BD2),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PatientStream(),
        ],
      ),
    );
  }
}

class PatientButton extends StatelessWidget {
  final String name;
  final String age;
  final String gender;
  final String temp;
  final List symptom;
  final List history;
  PatientButton(
      {this.name,
      this.age,
      this.temp,
      this.history,
      this.gender,
      this.symptom});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        color: Colors.deepPurpleAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              age,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class PatientInfo extends StatelessWidget {
  final String name;
  final String age;
  final String temp;
  final String gender;
  final List symptoms;
  final List history;
  PatientInfo(
      {this.name,
      this.age,
      this.temp,
      this.history,
      this.gender,
      this.symptoms});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF58BD2),
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
                //height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Patient Info',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Name:'),
                        Text(name),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Age:'),
                        Text(age),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Gender:'),
                        Text(gender),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Temperature:'),
                        Text(temp),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Symptom'),
                        symptoms.length > 0
                            ? Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Text(symptoms[index]);
                                  },
                                  itemCount: symptoms.length,
                                ),
                              )
                            : Text('Nil'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Health History'),
                        history.length > 0
                            ? Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Text(history[index]);
                                  },
                                  itemCount: history.length,
                                ),
                              )
                            : Text('Nil'),
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
                            primary: Colors.deepPurpleAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          //TODO: Add functionality to the button
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Back',
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
