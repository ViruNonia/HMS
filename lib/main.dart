// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hospital_management_system/screens/dashboard_screen.dart';
import 'package:hospital_management_system/theme/theme.dart';
import 'package:hospital_management_system/screens/welcome_screen.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDylxcG0KH726-e30VMM_N8KlWjUymTSqg",
          appId: "1:179770215696:android:e808e65583dd0430ef6995",
          messagingSenderId: "",
          projectId: "hospitalms-14851"))
      : Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lifeline.',
      theme: lightMode,
      home: WelcomeScreen(),
    );
  }
}
