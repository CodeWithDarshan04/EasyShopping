// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_label

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vijayho/screens/auth-ui/Sign-up-screen.dart';
import 'package:vijayho/utils/app-constant.dart';

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appScendryColor,
          centerTitle: true,
          title: Text(
            "Sign In",
            style: TextStyle(
              color: AppConstant.appTextColor,
              
            ),
          ),
        ),
        body:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              isKeyboardVisible
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        Lottie.asset(
                            'assets/images/Animation - 1720982107183.json'),
                      ],
                    ),
              SizedBox(height: Get.height / 35),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: AppConstant.appScendryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: AppConstant.appScendryColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility_off),
                      contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget Password? ",
                  style: TextStyle(
                    color: AppConstant.appScendryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 35),
              Material(
                child: Container(
                  width: Get.width / 2,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: AppConstant.appScendryColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextButton(
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                        color: AppConstant.appTextColor,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(height: Get.height / 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have Account? ",
                    style: TextStyle(
                      color: AppConstant.appScendryColor,
                      fontSize: 18.0,
                    ),
                  ),
                  
                  GestureDetector(
                    onTap: () => Get.offAll(() => SignUpScreen()),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppConstant.appScendryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
