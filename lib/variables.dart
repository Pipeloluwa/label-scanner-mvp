import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

const String urlRoot= "http://192.168.61.110:8000";
const String urlLogin=  urlRoot + "/login";

File ?imageFile;
File ?imageFile2;
ValueNotifier<bool> pickedImage= ValueNotifier(false);