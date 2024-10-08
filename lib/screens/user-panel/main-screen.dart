// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, file_names, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, duplicate_import, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vijayho/screens/user-panel/all-categories-screen.dart';
import 'package:vijayho/screens/user-panel/all-flash-sale-product.dart';
import 'package:vijayho/screens/user-panel/cart-screen.dart';
import 'package:vijayho/widgets/custom-drawer-widget.dart';
import '../../utils/app-constant.dart';
import '../../widgets/all-products-widget.dart';
import '../../widgets/banner-widget.dart';
import '../../widgets/category-widget.dart';
import '../../widgets/flash-sale-widget.dart';
import '../../widgets/heading-wedget.dart';
import 'all-products-screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(()=> CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
              ),
            ),
          )
        ],
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 90.0,
              ),
              //banners
              BannerWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttonText: "See More >",
              ),

              CategoriesWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Flash Sale",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllFlashSaleProductScreen()),
                buttonText: "See More >",
              ),
              FlashSaleWidget(),
              //heading
              HeadingWidget(
                headingTitle: "All Products",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllProductsScreen()),
                buttonText: "See More >",
              ),
              AllProductsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
