// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/presentation/screens/buyer_screen.dart';
import 'package:simplibuy/cart/presentation/screens/cart_list_screen.dart';
import 'package:simplibuy/core/constant.dart';
import '../controller/buyer_home_navigation_controller.dart';

class BuyerBottomNavScreen extends StatelessWidget {
  BuyerBottomNavScreen({Key? key}) : super(key: key);

  BuyerHomeNavigationController controller =
      Get.find<BuyerHomeNavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavDrawer(),
        body: Obx(() {
          if (controller.currentPage == 0) return BuyerHomeScreen();
          return CartList();
        }));
  }

  Widget bottomNavDrawer() {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: controller.currentPage,
        items: [
          bottomNavItem(Icons.home, 'Home'),
          bottomNavItem(Icons.shopping_cart, 'Cart'),
          bottomNavItem(Icons.shopping_bag, 'History'),
          bottomNavItem(Icons.person, 'Profile'),
        ],
        unselectedItemColor: Colors.grey,
        backgroundColor: whiteColor,
        selectedItemColor: blueColor,
        onTap: (value) {
          controller.changePage(value);
        },
        type: BottomNavigationBarType.fixed,
      );
    });
  }

  BottomNavigationBarItem bottomNavItem(IconData data, String label) {
    return BottomNavigationBarItem(
      icon: Icon(data),
      label: label,
    );
  }
}
