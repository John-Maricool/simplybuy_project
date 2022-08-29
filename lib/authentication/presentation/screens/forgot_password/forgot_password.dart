import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/core/constant.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
            text: "Forgot Password",
            onPressed: () {
              Get.back();
            }),
        body: Container(
          margin: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              heading(),
              const Padding(
                padding: EdgeInsets.only(top: defaultPadding),
              ),
              emailField(),
              const Padding(
                padding: EdgeInsets.only(top: 100.0),
              ),
              submitButton()
            ],
          ),
        ));
  }

  Widget heading() {
    return const Text("Enter the Email Address associated with the account",
        style: TextStyle(color: blackColor, fontSize: smallTextFontSize));
  }

  Widget emailField() {
    return Column(children: [
      const Align(
        alignment: Alignment.bottomLeft,
        child: Text("Email Address",
            style: TextStyle(color: blackColor, fontSize: smallerTextFontSize)),
      ),
      StreamBuilder(builder: (context, snapshot) {
        return TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: customInputDecoration(hint: 'example@email.com'));
      })
    ]);
  }

  Widget submitButton() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return defaultButtons(pressed: () {}, text: "Send code");
      },
    );
  }
}
