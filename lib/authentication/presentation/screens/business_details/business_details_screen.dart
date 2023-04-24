import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/authentication/presentation/screens/business_details/custom_widgets.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/core/reusable_widgets/custom_dialog.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';

class BusinessDetailsScreen extends StatelessWidget {
  const BusinessDetailsScreen({Key? key}) : super(key: key);

  final padding = const Padding(padding: EdgeInsets.only(top: 10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 20),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header(),
          padding,
          const Text("We want to verify that you own a store",
              style: TextStyle(
                  color: blueColor,
                  fontSize: smallTextFontSize,
                  fontWeight: FontWeight.w400)),
          padding,
          textFieldWithHeader(
              errorText: null,
              hintText: "eg. Simbi's enterprice",
              title: "Business Name",
              onChanged: (value) {}),
          padding,
          textFieldWithHeader(
              errorText: null,
              hintText: "eg. Enugu, Nigeria",
              title: "Business Location",
              onChanged: (value) {}),
          padding,
          textFieldWithHeader(
              errorText: null,
              hintText: "eg. We specialize in selling beauty soaps",
              title: "Brief description about your business",
              onChanged: (value) {},
              lines: 6),
          padding,
          textFieldWithHeader(
            errorText: null,
            hintText: "eg. Plot 13 New Heaven, Enugu",
            title: "Store Address",
            onChanged: (value) {},
          ),
          padding,
          textFieldWithHeader(
            errorText: null,
            hintText: "eg. Enugu State",
            title: "Store City",
            onChanged: (value) {},
          ),
          padding,
          country(context, "Country"),
          padding,
          imageUpload(context, "Upload Images of your store"),
          padding,
          imageUpload(context, "Upload your logo (whatever you're known for)"),
          padding,
          defaultButtons(
              pressed: () {
                showCongratulationsDialog(context);
              },
              text: "Submit")
        ],
      )),
    ));
  }

  void showCongratulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color.fromARGB(255, 168, 164, 164).withOpacity(0.7),
      builder: (BuildContext context) {
        return CustomDialog(
          callback: () {
            Get.toNamed(PLAN_CHOICE_SCREEN);
          },
          icon: Icons.check_circle_outline_rounded,
          buttonText: "Start Seling",
          textDetail: "Congratulations, you have successfully been verified",
          iconColor: blueColor,
        );
      },
    );
  }
}
