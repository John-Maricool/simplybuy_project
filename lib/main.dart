import 'package:flutter/material.dart';
import 'package:simplibuy/authentication/presentation/screen_bindings/login_screen_binding.dart';
import 'package:simplibuy/authentication/presentation/screen_bindings/signup_screen_binding.dart';
import 'package:simplibuy/authentication/presentation/screens/login/login_screen.dart';
import 'package:simplibuy/authentication/presentation/screens/signup/signup_screen.dart';
import 'package:simplibuy/authentication/presentation/screens/user_type_intro/user_type.dart';
import 'package:simplibuy/buyer_home/presentation/bindings/stores_and_malls_binding.dart';
import 'package:simplibuy/buyer_home/presentation/screens/stores_and_malls_screen.dart';
import 'package:simplibuy/cart/presentation/screens/cart_list_screen.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/main_binding.dart';
import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/presentation/screens/buyer_home_drawers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: pages,
      initialBinding: MainBinding(),
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: whiteColor),
      home: const UserType(),
    );
  }

  final pages = [
    GetPage(
        name: LOGIN_ROUTE,
        page: () => LoginForm(),
        binding: LoginScreenBinding()),
    GetPage(
        name: SIGNUP_ROUTE,
        page: () => SignUpForm(),
        binding: SignupScreenBinding()),
    GetPage(
      name: BUYER_HOME_PAGE_ROUTE,
      binding: StoresAndMallsBinding(),
      page: () => BuyerHome(),
    ),
    GetPage(
      name: STORES_LIST_ROUTE,
      binding: StoresAndMallsBinding(),
      page: () => StoresAndMallsScreen(),
    ),
    GetPage(
      name: CART_LIST_SCREEN,
      page: () => CartList(),
    ),
  ];
}
