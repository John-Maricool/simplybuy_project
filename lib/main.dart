import 'package:flutter/material.dart';
import 'package:simplibuy/core/constant.dart';
import 'authentication/presentation/screens/user_type_intro/user_type.dart';
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
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: whiteColor),
      home: const UserType(),
    );
  }
}
