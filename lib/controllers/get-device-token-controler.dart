// ignore_for_file: unnecessary_overrides, unused_import, unused_local_variable, file_names, avoid_print

import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../utils/app-constant.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;

  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      if(token !=  null ){
        deviceToken = token;
        print("Token: = $deviceToken");
        update();
      }
    } catch (e) {
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
