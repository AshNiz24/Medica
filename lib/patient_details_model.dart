import 'package:image_picker/image_picker.dart';

class Patient {
  String name;
  String age;
  String temp;
  String gender;
  List<String> symptoms;
  List<String> healthHis;
  List<PickedFile> imgs;
  void display() {
    print('Name: $name');
    print('Age: $age');
    print('Temperature: $temp');
    print('Gender: $gender');
    print('Symptoms: $symptoms');
    print('Health History: $healthHis');
  }
}
