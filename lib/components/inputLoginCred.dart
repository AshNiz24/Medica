import 'package:flutter/material.dart';
import 'package:medico/DocModel.dart';

class InputTextFieldDoc extends StatefulWidget {
  final String label;
  final DoctorDetails doctor;
  InputTextFieldDoc({this.label, this.doctor});
  @override
  _InputTextFieldDocState createState() => _InputTextFieldDocState();
}

class _InputTextFieldDocState extends State<InputTextFieldDoc> {
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
            obscureText: widget.label == 'Password' ? true : false,
            textAlignVertical: TextAlignVertical.bottom,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14,
            ),
            decoration: InputDecoration.collapsed(
              hintText: 'Enter ${widget.label.toLowerCase()}',
            ),
            onChanged: (String val) {
              if (widget.label == 'Name') widget.doctor.name = val;
              if (widget.label == 'Field of Expertise')
                widget.doctor.expertise = val;
              if (widget.label == 'Phone Num') widget.doctor.phn = val;
              if (widget.label == 'E-mail') widget.doctor.mail = val;
              if (widget.label == 'Password') widget.doctor.pswd = val;
            },
          ),
        ),
      ],
    );
  }
}
