///Importing required packages and classes
///Picture Input Box

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fdottedline/fdottedline.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class AddPictureBox extends StatefulWidget {
  final IconData plus;
  AddPictureBox({this.plus});

  @override
  _AddPictureBoxState createState() => _AddPictureBoxState();
}

class _AddPictureBoxState extends State<AddPictureBox> {
  File image;
  String imgPath;
  @override
  Widget build(BuildContext context) {
    if (widget.plus == Icons.camera_alt_outlined && image == null)

      ///Container without Image
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: FDottedLine(
          color: Color(0xFF102DE8),
          width: 300,
          height: 250,
          dottedLength: 2,
          space: 1,
          //TODO: add functionality to upload image
          child: GestureDetector(
            onTap: () {
              cameraConnect();
            },
            child: Container(
              height: 60,
              width: 80,
              child: Center(
                child: Icon(
                  widget.plus,
                  color: Color(0xFF0A36CD),
                  size: 20,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFF9FDFF),
              ),
            ),
          ),
        ),
      );
    else

      ///Container with image
      return Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 3.0, right: 6.5),
            height: 60,
            width: 80,
            child: Image.file(
              image,
              fit: BoxFit.cover,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF2680EB),
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            top: 0.0,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  image = null;
                });
              },
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 8,
                  child: Center(
                    child: Icon(
                      Icons.close,
                      size: 12,
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          )
        ],
      );
  }

  ///Function to capture image to display
  cameraConnect() async {
    ///an image is clicked using camera
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      image = File(pickedFile.path);
      setState(() {});
    }
  }
}
