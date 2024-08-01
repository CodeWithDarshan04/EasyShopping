// ignore_for_file: prefer_const_constructors, unnecessary_import, implementation_imports, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_label, non_constant_identifier_names, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_null_comparison, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vijayho/controllers/googlr-sign-in-controller.dart';
import 'package:vijayho/controllers/sign-in-controller.dart';
import 'package:vijayho/screens/admin-panel/admin-main-screen.dart';
import 'package:vijayho/screens/auth-ui/Sign-up-screen.dart';
import 'package:vijayho/screens/auth-ui/forget-password-screen.dart';
import 'package:vijayho/screens/user-panel/main-screen.dart';
import 'package:vijayho/utils/app-constant.dart';

import '../../controllers/get-user-data-controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

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
        body: SingleChildScrollView(
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
                    controller: userEmail,
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
                  child: Obx(
                    () => TextFormField(
                      controller: userPassword,
                      obscureText: signInController.isPasswordVisible.value,
                      cursorColor: AppConstant.appScendryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            signInController.isPasswordVisible.toggle();
                          },
                          child: signInController.isPasswordVisible.value
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ForgetPasswordScreen());
                  },
                  child: Text(
                    "Forget Password? ",
                    style: TextStyle(
                      color: AppConstant.appScendryColor,
                      fontWeight: FontWeight.bold,
                    ),
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
                    onPressed: () async {
                      String email = userEmail.text.trim();
                      String password = userPassword.text.trim();

                      if (email.isEmpty || password.isEmpty) {
                        Get.snackbar(
                          "Error",
                          "Please enter all details",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appScendryColor,
                          colorText: AppConstant.appTextColor,
                        );
                      } else {
                        // UserCredential  UserCredential = await signInController.signInMethod(email, password,)
                        UserCredential? userCredential =
                            await signInController.signInMethod(
                          email,
                          password,
                        );
                        var userData = await getUserDataController
                            .getUserData(userCredential!.user!.uid);
                        if (userCredential != null) {
                          if (userCredential.user!.emailVerified) {
                            if (userData[0]['isAdmin'] == true) {
                              Get.snackbar(
                                "Success Admin Login",
                                "Login Successfully!",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendryColor,
                                colorText: AppConstant.appTextColor,
                              );
                              Get.offAll(() => AdminMainScreemn());
                            } else {
                              Get.offAll(() => MainScreen());
                              Get.snackbar(
                                "Success User Login",
                                "Login Successfully!",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appScendryColor,
                                colorText: AppConstant.appTextColor,
                              );
                            }
                          } else {
                            Get.snackbar(
                              "Error",
                              "Please verify your email before login",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appScendryColor,
                              colorText: AppConstant.appTextColor,
                            );
                          }
                        } else {
                          Get.snackbar(
                            "Error",
                            "Please try again",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appScendryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        }
                      }
                    },
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
