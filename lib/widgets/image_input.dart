import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget{
  @override
  State<ImageInput> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput>{
  File? _selectedImge;
  takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = 
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

      if (pickedImage == null) {
        return;
      }

      setState(() {
        _selectedImge = File(pickedImage.path);
      });
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white)
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: _selectedImge != null
        ? GestureDetector(
          onTap: takePicture,
          child: Image.file(
            _selectedImge!,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        )
      : TextButton.icon(
          icon: const Icon(Icons.camera),
          label: const Text('Take Picture'),
          onPressed: takePicture,
      )
      
    );
  }
}