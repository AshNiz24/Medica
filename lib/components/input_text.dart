import 'package:flutter/material.dart';
import 'package:medico/patient_details_model.dart';

class InputTextField extends StatefulWidget {
  final String label;
  final Patient patient;
  InputTextField({this.label, this.patient});
  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '${widget.label}:',
          style: TextStyle(fontSize: 12),
        ),
        SizedBox(
          width: 3,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 6.0),
          padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 6.0),
          width: MediaQuery.of(context).size.width * 0.55,
          constraints: BoxConstraints(maxHeight: 32, minHeight: 30),
          decoration: BoxDecoration(
              color: Color(0xFFEEF1F1),
              border: Border.all(
                color: Color(0xFFE6E6E6),
              ),
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle),
          child: TextField(
            //onChanged: (String k) {},
            textAlignVertical: TextAlignVertical.bottom,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration.collapsed(
              hintText: 'Enter ${widget.label.toLowerCase()}',
            ),
            onChanged: (String val) {
              if (widget.label == 'Name') widget.patient.name = val;
              if (widget.label == 'Age') widget.patient.age = val;
              if (widget.label == 'Temp(⁰C/⁰F)') widget.patient.temp = val;
              if (widget.label == 'Gender') widget.patient.gender = val;
              if (widget.label == 'Symptoms')
                widget.patient.symptoms = val.split(',');
              if (widget.label == 'Health History')
                widget.patient.healthHis = val.split(',');
            },
          ),
        ),
      ],
    );
  }
}
