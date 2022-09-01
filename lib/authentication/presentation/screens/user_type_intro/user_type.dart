import 'package:flutter/material.dart';
import 'package:simplibuy/authentication/presentation/screens/login/login_screen.dart';
import 'package:simplibuy/authentication/presentation/screens/signup/signup_screen.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:get/get.dart';

class UserType extends StatelessWidget {
  const UserType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageFromAssetsFolder(
              width: 320.0,
              height: 150.0,
              path: 'assets/images/simpliby_logo.png'),
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          intro(),
          const Padding(
            padding: EdgeInsets.only(top: defaultPadding),
          ),
          signUpAs(),
          const Padding(
            padding: EdgeInsets.only(top: 12.0),
          ),
          retailerOption(),
          const Padding(
            padding: EdgeInsets.only(top: defaultPadding),
          ),
          buyerOption()
        ],
      ),
    ));
  }

  Widget intro() {
    return const Align(
        alignment: Alignment.center,
        child: Text(
          "Now we have made your shopping experience simpler and faster",
          style: TextStyle(color: blackColor, fontSize: smallTextFontSize),
          textAlign: TextAlign.center,
        ));
  }

  Widget signUpAs() {
    return const Align(
        alignment: Alignment.center,
        child: Text("Sign up as a",
            style: TextStyle(color: blackColor, fontSize: smallTextFontSize)));
  }

  Widget retailerOption() {
    return defaultButtons(
        pressed: () {
          Get.toNamed(LOGIN_ROUTE);
        },
        text: "Retailer");
  }

  Widget buyerOption() {
    return defaultButtons(
        pressed: () {
          Get.toNamed(SIGNUP_ROUTE);
        },
        text: "Buyer");
  }
}
