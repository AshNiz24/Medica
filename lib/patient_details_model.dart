import 'package:flutter/cupertino.dart';

class Patient {
  String name;
  String age;
  String temp;
  String gender;
  List<String> symptoms;
  List<String> healthHis;
  List<FileImage> imgs;
  void display() {
    print('Name: $name');
    print('Age: $age');
    print('Temperature: $temp');
    print('Gender: $gender');
    print('Symptoms: $symptoms');
    print('Health History: $healthHis');
  }

  void sendData() {}
}
