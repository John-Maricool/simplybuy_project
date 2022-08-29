import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/core/constant.dart';

class VerifyNumber extends StatelessWidget {
  const VerifyNumber({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            text: "Verification",
            onPressed: () {
              Get.back();
            }),
        body: Container(
          margin: const EdgeInsets.all(defaultPadding),
          // child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                notice(),
                const Padding(
                  padding: EdgeInsets.only(top: 40.0),
                ),
                inputPin((data) {}, context),
                const Padding(
                  padding: EdgeInsets.only(top: defaultPadding),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: defaultPadding),
                ),
                continueButton(),
              ],
            ),
          ),
        ));
  }

  Widget notice() {
    return const Align(
        alignment: Alignment.bottomLeft,
        child: Text("We sent a code to your phone Number",
            textAlign: TextAlign.center,
            style: TextStyle(color: blackColor, fontSize: smallTextFontSize)));
  }

  Widget inputPin(ValueChanged output, BuildContext context) {
    return Column(
      children: [
        Text("Enter your OTP code here",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: blackColor, fontSize: smallTextFontSize)),
        Padding(padding: EdgeInsets.only(top: 10.0)),
        PinCodeTextField(
          appContext: context,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 60,
            errorBorderColor: Colors.red,
            fieldWidth: 50,
            disabledColor: lightBlueColor,
            inactiveColor: lightBlueColor,
            activeFillColor: lightBlueColor,
          ),
          cursorColor: Colors.black,
          length: 4,
          keyboardType: TextInputType.number,
          textStyle: const TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          onChanged: output,
        )
      ],
    );
  }

  Widget continueButton() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return defaultButtons(pressed: () {}, text: "Continue");
      },
    );
  }
}
