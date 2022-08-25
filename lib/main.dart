import 'package:flutter/material.dart';
import 'package:simplibuy/authentication/presentation/screen_model_controllers/login_screen_rx.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/main_binding.dart';
import 'authentication/presentation/screens/user_type_intro/user_type.dart';
import 'package:get/get.dart';

void main() {
  LoginScreenRx controller = Get.put(LoginScreenRx());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: MainBinding(),
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: whiteColor),
      home: const UserType(),
    );
  }
}
