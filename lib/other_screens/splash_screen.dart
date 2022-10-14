import 'package:flutter/material.dart';
import 'package:simplibuy/authentication/presentation/screens/user_type_intro/user_type.dart';
import 'dart:async';

import '../core/reusable_widgets/reusable_widgets.dart';

class SplashScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => UserType())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: imageFromAssetsFolder(
                width: 320.0,
                height: 150.0,
                path: 'assets/images/simpliby_logo.png')));
  }
}
