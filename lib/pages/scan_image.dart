import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:label_scanner_mvp/camera_image/camera_view.dart";
import "package:label_scanner_mvp/camera_image/image_fullscreen.dart";
import "package:label_scanner_mvp/pages/image_result_page.dart";
import "package:label_scanner_mvp/pages/login_screen.dart";
// import 'package:flutter_camera_overlay/model.dart';
// import 'package:cuervo_document_scanner/cuervo_document_scanner.dart';
// import 'package:cunning_document_scanner/cunning_document_scanner.dart';
// import 'package:mask_for_camera_view/mask_for_camera_view.dart';


import 'package:camera/camera.dart';
// import 'package:photo_manager/photo_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import "package:label_scanner_mvp/variables.dart";
// import "package:label_scanner_mvp/whatsapp_camera_image/camera_view.dart";




class ScanImage extends StatefulWidget {
  const ScanImage({super.key});

  @override
  State<ScanImage> createState() => _ScanImageState();
}



// void requestPermission () async {
//   // final PermissionState ps = await PhotoManager.requestPermissionExtend(); // the method can use optional param `permission`.
//   // if (ps.isAuth) {
//   //   // Granted
//   //   Fluttertoast.showToast(msg: "Hey");
//   // } else if (ps.hasAccess) {
//   //   // Access will continue, but the amount visible depends on the user's selection.
//   //   Fluttertoast.showToast(msg: "Well");
//   // } else {
//   //   // Limited(iOS) or Rejected, use `==` for more precise judgements.
//   //   // You can call `PhotoManager.openSetting()` to open settings for further steps.
//   //   Fluttertoast.showToast(msg: "No");
//   // }
// }


class _ScanImageState extends State<ScanImage> {

  void log_out(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen())
    );
  }

  void pick_image () async {

    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CameraView())
    );
    // imageFile= await CameraView();
    // Fluttertoast.showToast(msg: imageFile.toString());
  }

  void scan_image () async {
    if (imageFile == null){
      showDialog(
          context: context,
          builder: (BuildContext context){
              return AlertDialog(
                title: Text("No file has been picked"),
              );
          }
      );
      // showModalBottomSheet(
      //     context: context,
      //     builder: (BuildContext context){
      //       return AlertDialog(
      //         title: Text("No file has been picked"),
      //       );
      //
      //     }
      // );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppBar(
              title: Text("IMAGE", style: TextStyle(fontWeight: FontWeight.bold), textScaler: TextScaler.noScaling,),
              centerTitle: true,
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),

            drawerScrimColor: Colors.black.withOpacity(0.0),
            drawer: Drawer(
              backgroundColor: Colors.indigo.shade800,
              shadowColor: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 8.0, right: 8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: ListView(
                    children: [
                      InkWell(
                        onTap: (){log_out();},
                        radius: 50.0,
                        child: ListTile(
                          selectedColor: Colors.blueAccent,
                          leading: Icon(Icons.logout_rounded),
                          iconColor: Colors.white,
                          textColor: Colors.white,
                          title: Container(
                            child: Expanded(child: Text("Logout", textScaler: TextScaler.noScaling,))
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors:[Colors.blueAccent.shade700, Colors.indigo.shade900])
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Expanded(
                          child: Card(
                            color: Colors.white.withOpacity(0.5),
                            elevation: 4.0,
                            child: ValueListenableBuilder<bool>(
                                valueListenable: pickedImage,
                                builder: (context, value, Widget ? child) {
                                  return value
                                      ? InkWell(
                                        onTap: (){
                                          Navigator.of(context).push(
                                            MaterialPageRoute(builder: (BuildContext context) => ImageFullscreen(imageFile))
                                          );
                                        },
                                      radius: 500.0,

                                        child: AspectRatio(
                                          aspectRatio: 1.0,
                                          child: Container(
                                        // height: 100,
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
                                      )

                                      : AspectRatio(
                                    aspectRatio: 1.0,
                                    child: Container(
                                      // height: 300,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(22.0),
                                      ),
                                      child: Expanded(child: InkWell(
                                        onTap: (){pick_image();},
                                        radius: 500.0,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                   Icon(Icons.add_a_photo_outlined,
                                                        color: Colors.white,
                                                        size: 100.0,),

                                                  Text(
                                                    "Scan Label",
                                                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                                                    textScaler: TextScaler.noScaling,
                                                  )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                    ),
                                  );
                              }
                            ),
                          ),
                        ),
                      ),
                    ),




                    ValueListenableBuilder<bool>(
                        valueListenable: pickedImage,
                        builder: (context, value, Widget ? child) {
                        return !value
                            ? Container()


                            : Flexible(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Flexible(
                                       child: TextButton(
                                           style: ButtonStyle(
                                             backgroundColor: MaterialStatePropertyAll(Colors.white),
                                             foregroundColor: MaterialStatePropertyAll(Colors.red),
                                             elevation: MaterialStatePropertyAll(2.0)
                                           ),
                                           onPressed: (){
                                             imageFile= null;
                                             pickedImage.value= false;
                                           },
                                           child: Expanded(child: Row(
                                             mainAxisAlignment: MainAxisAlignment.center,
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                                                 child: Icon(Icons.close),
                                               ),
                                               Flexible(child: Text("REMOVE", textScaler: TextScaler.noScaling,)),
                                             ],
                                           ))
                                       ),
                                     ),
                                  ),
                                ),


                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Flexible(
                                      flex: 1,
                                      child: TextButton(
                                          style: ButtonStyle(
                                              backgroundColor: MaterialStatePropertyAll(Colors.white),
                                              foregroundColor: MaterialStatePropertyAll(Colors.green),
                                              elevation: MaterialStatePropertyAll(2.0)
                                          ),
                                          onPressed: (){
                                            Navigator.of(context).push(
                                              MaterialPageRoute(builder: (BuildContext context) =>ImageResult())
                                            );
                                            },
                                          child: Expanded(child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                                                child: Icon(Icons.document_scanner_outlined),
                                              ),
                                              Flexible(child: Text("SCAN", textScaler: TextScaler.noScaling,)),
                                            ],
                                          ))
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}
