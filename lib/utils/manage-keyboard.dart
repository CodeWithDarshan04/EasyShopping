// ignore_for_file: file_names

import 'package:flutter/material.dart';

class KeyboardUtil{
  static hideKeyboard(BuildContext context){
    FocusScopeNode currentFocus = FocusScope.of(context);
    if(!currentFocus.hasPrimaryFocus){
      currentFocus.unfocus();
    }
  }
}