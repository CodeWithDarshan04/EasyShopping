// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vijayho/utils/app-constant.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppConstant.appScendryColor,
        title: Text("Welcomme to my page",
        style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Lottie.asset('assets/images/Animation - 1720982107183.json'),
              ),
              Container(
              margin: EdgeInsets.only(top: 20.0),  
              child: Text('Happy Shopping....', 
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                ),
              ),
              ),
              SizedBox(
                height: Get.height / 25,
              ),

              Material(
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 12,
                  decoration: BoxDecoration(
                   color:AppConstant.appScendryColor,
                   borderRadius: BorderRadius.circular(20.0),
                  ),
                child: TextButton.icon(
                  icon: Image.asset('assets/images/Google.png'),
                  label: Text("Sign in with google", 
                  style: TextStyle(
                    color: AppConstant.appTextColor,
                    fontSize: 18.0,),
                  ),
                  onPressed: (){},
                  ),
              ),
              ),
              SizedBox(
                height: Get.height / 50,
              ),
              Material(
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 12,
                  decoration: BoxDecoration(
                   color:AppConstant.appScendryColor,
                   borderRadius: BorderRadius.circular(20.0),
                  ),
                child: TextButton.icon(
                  icon: Icon(
                    Icons.email, color: AppConstant.appTextColor,
                  ),
                  label: Text("Sign in with Email", 
                  style: TextStyle(
                  color: AppConstant.appTextColor,
                  fontSize: 18.0,
                    ),
                  ),
                  onPressed: (){},
                  ),
              ),
              ),
              
              
              
        ],
        ),
        ),
    );
  }
}