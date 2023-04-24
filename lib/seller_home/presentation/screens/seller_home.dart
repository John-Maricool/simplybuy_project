import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/presentation/screens/buyer_home_drawers.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/seller_home/presentation/controllers/seller_home_nav_controller.dart';
import 'package:simplibuy/seller_home/presentation/screens/seller_home_screen.dart';
import 'package:simplibuy/seller_payments/presentation/screens/seller_payments_screen.dart';
import 'package:simplibuy/seller_profile/presentation/screens/seller_profile_screen.dart';
import 'package:simplibuy/settings/presentation/screens/settings_screen.dart';

// ignore: must_be_immutable
class SellerHomeDrawers extends StatelessWidget {
  SellerHomeDrawers({Key? key}) : super(key: key);

  SellerHomeNavigationController controller =
      Get.find<SellerHomeNavigationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomNavDrawer(),
        body: Obx(() {
          if (controller.currentPage == 0) {
            return SellerHomeScreen();
          } else if (controller.currentPage == 1) {
            return SellerPaymentsScreen();
          } else if (controller.currentPage == 2) {
            return SettingsScreen();
          }
          return SellerProfileScreen();
        }));
  }

  Widget bottomNavDrawer() {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: controller.currentPage,
        items: [
          bottomNavItem(Icons.home, 'Home'),
          bottomNavItem(Icons.shopping_cart, 'Payment'),
          bottomNavItem(Icons.settings, 'Settings'),
          bottomNavItem(Icons.chat, 'Chats'),
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
}
