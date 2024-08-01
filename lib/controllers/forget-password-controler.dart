// ignore_for_file: file_names, unused_field, body_might_complete_normally_nullable, unused_local_variable, unused_import, non_constant_identifier_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:vijayho/models/user-models.dart';
import 'package:vijayho/screens/auth-ui/Sign-in-screen.dart';
import 'package:vijayho/utils/app-constant.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> ForgetPasswordMethod(
    String userEmail,
  ) async {
    try {
      EasyLoading.show(status: "Please Wait...");

      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        "Request send Sucessfully",
        "Password reset link sent to $userEmail",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appScendryColor,
        colorText: AppConstant.appTextColor,
      );
      Get.offAll(() => SignInScreen());

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appScendryColor,
        colorText: AppConstant.appTextColor,
      );
    }
  }
}
