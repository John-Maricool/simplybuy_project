import 'package:flutter/material.dart';
import 'package:simplibuy/authentication/presentation/screen_bindings/login_screen_binding.dart';
import 'package:simplibuy/authentication/presentation/screen_bindings/signup_screen_binding.dart';
import 'package:simplibuy/authentication/presentation/screens/login/login_screen.dart';
import 'package:simplibuy/authentication/presentation/screens/signup/signup_screen.dart';
import 'package:simplibuy/authentication/presentation/screens/user_type_intro/user_type.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/main_binding.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      getPages: [
        GetPage(
            name: LOGIN_ROUTE,
            page: () => LoginForm(),
            binding: LoginScreenBinding()),
        GetPage(
            name: SIGNUP_ROUTE,
            page: () => SignUpForm(),
            binding: SignupScreenBinding()),
      ],
      initialBinding: MainBinding(),
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: whiteColor),
      home: const UserType(),
    );
  }
}
