// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, unnecessary_import, implementation_imports, duplicate_ignore, file_names

import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vijayho/utils/app-constant.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: Text('Cart Screen'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: ListView.builder(
            itemCount: 20,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                color: AppConstant.appTextColor,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppConstant.appMainColor,
                    child: Text("N"),
                  ),
                  title: Text("New Dress for women"),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("2200"),
                      SizedBox(
                        width: Get.width / 20.0,
                      ),
                      CircleAvatar(
                        radius: 14.0,
                        backgroundColor: AppConstant.appMainColor,
                        child: Text("-"),
                      ),
                      SizedBox(
                        width: Get.width / 20.0,
                      ),
                      CircleAvatar(
                        radius: 14.0,
                        backgroundColor: AppConstant.appMainColor,
                        child: Text("+"),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Total",
            ),
            Text(
              "INR: 12,00",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Container(
                  width: Get.width / 2.0,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: AppConstant.appScendryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        color: AppConstant.appTextColor,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
