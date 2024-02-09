import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:label_scanner_mvp/variables.dart';


class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text("Label Scan",  style: TextStyle(fontWeight: FontWeight.bold), textScaler: TextScaler.noScaling,),
          backgroundColor: Colors.indigo,
          shadowColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: CameraCamera(
            // mode: CameraMode.ratio1s1,
            mode: CameraMode.ratio16s9,
            onFile: (file) {

              imageFile= file;
              pickedImage.value= true;

              showDialog(
                  context: context,
                  builder:
                      (BuildContext context) => Material(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors:[Colors.blueAccent.shade700, Colors.indigo.shade900])
                                  ),
                                )
                            ),
                        
                            Positioned(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            "Captured Label",
                                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                                            textScaler: TextScaler.noScaling,
                                        ),
                                      ),
                                    ),
                        
                        
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        color: Colors.blueAccent,
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: AspectRatio(
                                            aspectRatio: 1.0,
                                            child: Container(
                                              // height: 500,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    // fit: BoxFit.contain,
                                                    image: FileImage(
                                                      File(imageFile!.path),
                                                    ),
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                        
                        
                        
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 45.0),
                                            child: Card(
                                              color: Colors.red,
                                              child: IconButton(
                                                  onPressed: (){
                                                    imageFile= null;
                                                    pickedImage.value= false;

                                                    Navigator.of(context).pop();
                                                  },
                                                  iconSize: 30.0,
                                                  color: Colors.white,
                                                  icon: Icon(
                                                      Icons.close
                                                  )
                                              ),
                                            ),
                                          ),
                        
                        
                                          Card(
                                            color: Colors.green,
                                            child: IconButton(
                                                onPressed: (){
                                                  Navigator.of(context).pop();Navigator.of(context).pop();
                                                },
                                                iconSize: 30.0,
                                                color: Colors.white,
                                                icon: Icon(
                                                    Icons.done_all
                                                )
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        
                          ],
                        ),
                      )
              );

            }
        ),
      ),
    );
  }
}
