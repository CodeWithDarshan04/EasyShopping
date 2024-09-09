// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, must_call_super, unused_import

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vijayho/controllers/get-user-data-controller.dart';
import 'package:vijayho/screens/admin-panel/admin-main-screen.dart';
import 'package:vijayho/screens/auth-ui/welcome-screen.dart';
import 'package:vijayho/screens/user-panel/main-screen.dart';
import 'package:vijayho/utils/app-constant.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
@override
void initState(){
  super.initState();
  Timer(Duration(seconds: 5), () {
    loggin(context);
  });
}
 Future<void> loggin (BuildContext context) async{
  if(user != null){
    final GetUserDataController getUserDataController = 
    Get.put(GetUserDataController());
    var userData = await getUserDataController.getUserData(user!.uid);
    if(userData[0]['isAdmin'] == true){
      Get.offAll(()=> AdminMainScreen());
    }else{
      Get.offAll(()=> MainScreen());
    }
  }
  else{
    Get.to(()=> WelcomeScreen());
  }
 }
 
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppConstant.appMainColor,
      appBar: AppBar(
        backgroundColor: AppConstant.appScendryColor,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset(
                    'assets/images/Animation - 1720982107183.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(
                    color: AppConstant.appTextColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
