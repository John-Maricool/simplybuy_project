import 'package:flutter/material.dart';
import 'package:simplibuy/authentication/presentation/screen_bindings/login_screen_binding.dart';
import 'package:simplibuy/authentication/presentation/screen_bindings/signup_screen_binding.dart';
import 'package:simplibuy/authentication/presentation/screens/login/login_screen.dart';
import 'package:simplibuy/authentication/presentation/screens/signup/signup_screen.dart';
import 'package:simplibuy/authentication/presentation/screens/user_type_intro/user_type.dart';
import 'package:simplibuy/buyer_home/presentation/bindings/buyer_home_bottom_nav_screens_bindings.dart';
import 'package:simplibuy/buyer_home/presentation/screens/stores_and_malls_screen.dart';
import 'package:simplibuy/cart/presentation/screens/cart_list_screen.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/history/presentation/screens/history_screen.dart';
import 'package:simplibuy/main_binding.dart';
import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/presentation/screens/buyer_home_drawers.dart';
import 'package:simplibuy/other_screens/splash_screen.dart';
import 'package:simplibuy/profile/presentation/binding/profile_screen_binding.dart';
import 'package:simplibuy/profile/presentation/screens/profile_screen.dart';
import 'package:simplibuy/store_and_product/presentation/binding/product_binding.dart';
import 'package:simplibuy/store_and_product/presentation/binding/products_list_binding.dart';
import 'package:simplibuy/store_and_product/presentation/binding/store_info_binding.dart';
import 'package:simplibuy/store_and_product/presentation/screens/product_screen.dart';
import 'package:simplibuy/store_and_product/presentation/screens/product_via_category.dart';
import 'package:simplibuy/store_and_product/presentation/screens/store_info_screen.dart';

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
      home: SplashScreen(),
    );
  }

  final pages = [
    GetPage(
        name: LOGIN_ROUTE,
        page: () => LoginForm(),
        binding: LoginScreenBinding()),
    GetPage(
        name: SINGLE_STORE_ROUTE,
        page: () => StoreInfoScreen(),
        arguments: "id",
        binding: StoreInfoBinding()),
    GetPage(
        name: SIGNUP_ROUTE,
        page: () => SignUpForm(),
        binding: SignupScreenBinding()),
    GetPage(
        name: PROFILE_SCREEN,
        page: () => ProfileScreen(),
        binding: ProfileScreenBinding()),
    GetPage(
      name: BUYER_HOME_PAGE_ROUTE,
      binding: BuyerHomeBottomNavScreensBindings(),
      page: () => BuyerBottomNavScreen(),
    ),
    GetPage(
      name: STORES_LIST_ROUTE,
      page: () => StoresAndMallsScreen(),
      binding: BuyerHomeBottomNavScreensBindings(),
    ),
    GetPage(
      name: CART_LIST_SCREEN,
      page: () => CartList(),
      binding: BuyerHomeBottomNavScreensBindings(),
    ),
    GetPage(
        name: PRODUCTS_LIST_SCREEN,
        page: () => ProductsListScreen(),
        binding: ProductListBinding()),
    GetPage(
        name: PRODUCT_SCREEN,
        page: () => ProductScreen(),
        binding: ProductBinding()),
    GetPage(name: HISTORY_SCREEN, page: () => HistoryScreen())
  ];
}
