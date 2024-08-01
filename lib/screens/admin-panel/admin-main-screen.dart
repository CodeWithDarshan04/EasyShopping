// ignore_for_file: prefer_const_constructors, implementation_imports, file_names

import 'package:flutter/material.dart';

class AdminMainScreemn extends StatefulWidget {
  const AdminMainScreemn({super.key});

  @override
  State<AdminMainScreemn> createState() => _AdminMainScreemnState();
}

class _AdminMainScreemnState extends State<AdminMainScreemn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Admin Panel"),
    ),);
  }
}