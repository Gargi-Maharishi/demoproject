import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}


class _CameraState extends State<Camera> {
  File? image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image Picker Example"),
        ),
        body: Center(
          child: Column(
            children: [
              image != null ?
              Image.file(image!, height: 200,) : SizedBox.shrink(),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () {
                    File? image;
                    Future pickImage() async {
                      try {
                        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
                        if(image == null) return;
                        final imageTemp = File(image.path);
                        setState(() => this.image = imageTemp);
                      } on PlatformException catch(e) {
                        print('Failed to pick image: $e');
                      }
                    }

                  }
              ),
              MaterialButton(
                  color: Colors.blue,
                  child: const Text(
                      "Pick Image from Camera",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.bold
                      )
                  ),
                  onPressed: () async {
                       try {
                      var ximage = await ImagePicker().pickImage(source: ImageSource.camera);
                      if(ximage == null) return;
                      print("===================================");
                      print(ximage.path);
                      final imageTemp = File(ximage.path);
                      setState(() => this.image = imageTemp);
                    } on PlatformException catch(e) {
                      print('Failed to pick image: $e');
                    }

                  }
              ),
            ],
          ),
        )
    );
  }
  }






