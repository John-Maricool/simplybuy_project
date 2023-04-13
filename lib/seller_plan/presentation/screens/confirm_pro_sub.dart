import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';

class ConfirmProSubScreen extends StatelessWidget {
  final String args = Get.arguments as String;
  ConfirmProSubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: imageFromAssetsFolder(
                    width: 120.0,
                    height: 50.0,
                    path: 'assets/images/simplibuy_logo_small.png')),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Text(
                "You are subscribing for the Basic mothly plan. You will charged NGN $args monthly and you can cancel at anytime,",
                style: const TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18)),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("Total",
                  style: TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 18)),
              Text("NGN $args",
                  style: const TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 18))
            ]),
            const Divider(
              color: blackColor,
              thickness: 2,
            ),
            const Padding(padding: EdgeInsets.only(top: 60)),
            defaultButtons(
                pressed: () {
                  Get.toNamed(PAY_SUB_SCREEN, arguments: args);
                },
                text: "Pay now"),
            const Padding(padding: EdgeInsets.only(top: 40)),
            const Text(
                "By purchasing this plan, you agree that you are purchasing a subscription that is charged on a recurring monthly basis",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 15)),
            const Padding(padding: EdgeInsets.only(top: 20)),
            const Text("You also agree to our Terms and privacy policy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
