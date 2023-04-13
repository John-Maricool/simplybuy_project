import 'package:flutter/material.dart';
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
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          imageFromAssetsFolder(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.83,
              path: 'assets/on_boarding/on_boarding.png',
              padding: 0),
          Positioned(
              bottom: 80,
              child: Column(children: [
                imageFromAssetsFolder(
                    width: 120.0,
                    height: 50.0,
                    path: 'assets/images/simplibuy_logo_small.png'),
                Container(
                    width: 380,
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.topCenter,
                    child: const Text(
                        "Reserve, pay and pickup your item from your favorite store",
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: smallTextFontSize))),
                const Text("Sign up",
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: smallTextFontSize)),
              ])),
          Positioned(
            bottom: -100,
            left: 25,
            child: start(context, () {
              Get.toNamed(LOGIN_ROUTE);
            }, "assets/on_boarding/on_buying.png", "Start Buying"),
          ),
          Positioned(
            bottom: -100,
            right: 25,
            child: start(context, () {
              Get.toNamed(LOGIN_ROUTE);
            }, "assets/on_boarding/on_selling.png", "Start Selling"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: defaultPadding),
          ),
        ],
      ),
    );
  }

  Widget start(
      BuildContext context, VoidCallback onPressed, String file, String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 175,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(255, 219, 216, 216),
          blurRadius: 10.0,
          spreadRadius: 5.0,
          offset: Offset(0.0, 5.0),
        ),
      ], borderRadius: BorderRadius.circular(15.0), color: whiteColor),
      child: GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: imageFromAssetsFolder(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 145,
                    padding: 0,
                    path: file),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget retailerOption() {
    return defaultButtons(
        pressed: () {
          Get.toNamed(LOGIN_ROUTE);
        },
        text: "Retailer");
  }

  Widget optionCard(String imgUrl, String text) {
    return defaultButtons(
        pressed: () {
          Get.toNamed(SIGNUP_ROUTE);
        },
        text: "Buyer");
  }
}
