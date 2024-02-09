import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

File ?imageFile;
File ?imageFile2;
ValueNotifier<bool> pickedImage= ValueNotifier(false);