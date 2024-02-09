import 'dart:io';

import 'package:flutter/material.dart';

class ImageFullscreen extends StatefulWidget {

  final  imageFileInstance;
  ImageFullscreen(this.imageFileInstance);

  @override
  State<ImageFullscreen> createState() => _ImageFullscreenState();
}

class _ImageFullscreenState extends State<ImageFullscreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("IMAGE FULLSCREEN", style: TextStyle(fontWeight: FontWeight.bold), textScaler: TextScaler.noScaling,),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),

        body: Container(
          // height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: FileImage(
                  File(widget.imageFileInstance!.path),
                ),
              )
          ),
        ),
      ),
    );
  }
}
