// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vijayho/screens/auth-ui/Sign-in-screen.dart';
import 'package:vijayho/screens/auth-ui/Sign-up-screen.dart';
import 'package:vijayho/screens/auth-ui/splash-screen.dart';

import 'firebase_options.dart';
import 'screens/user-panel/main-screen.dart';
import 'dart:async';


Future<void> main() 
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
// This Widget is the root of your Application 
@override
Widget build(BuildContext context){
  return GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true, 
    ),
    home: const SignUpScreen(),
  );
}
}