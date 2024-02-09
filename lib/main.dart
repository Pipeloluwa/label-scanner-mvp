import 'package:flutter/material.dart';
import 'package:label_scanner_mvp/pages/login_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(
      title: 'Label Scanner App',
      debugShowCheckedModeBanner: false,
      // color: Colors.white,
      theme: ThemeData(
        useMaterial3: true,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const LoginScreen()
    );
  }
}
