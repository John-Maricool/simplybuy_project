import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/authentication/presentation/screen_model_controllers/login_screen_binding.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/core/constant.dart';
import '../login/login_page.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  imageFromAssetsFolder(
                      width: 120.0,
                      height: 50.0,
                      path: 'assets/images/simplibuy_logo_small.png'),
                  const Padding(
                    padding: EdgeInsets.only(top: defaultPadding),
                  ),
                  signUp(),
                  const Padding(
                    padding: EdgeInsets.only(top: defaultPadding),
                  ),
                  nameField(),
                  const Padding(
                    padding: EdgeInsets.only(top: defaultPadding),
                  ),
                  emailField(),
                  const Padding(
                    padding: EdgeInsets.only(top: defaultPadding),
                  ),
                  passwordField("Password"),
                  const Padding(
                    padding: EdgeInsets.only(top: defaultPadding),
                  ),
                  passwordField("Confirm Password"),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                  ),
                  notice(),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                  ),
                  submitButton(),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      clickableSmallButton(
                          onPressed: () {}, path: 'assets/images/google.png'),
                      clickableSmallButton(
                          onPressed: () {}, path: 'assets/images/fb.png')
                    ],
                  ),
                  ordinaryAndClickableText(
                      text: "Already have an account?",
                      clickableText: " Sign in",
                      onClicked: () {
                        Get.to(LoginPage(), binding: LoginScreenBinding());
                      })
                ],
              ),
            )));
  }

  Widget signUp() {
    return const Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Sign Up",
          style: TextStyle(
              color: blackColor,
              fontSize: largeTextFontSize,
              fontWeight: largeTextFontWeight),
        ));
  }

  Widget emailField() {
    return Column(children: [
      const Align(
        alignment: Alignment.bottomLeft,
        child: Text("Email",
            style: TextStyle(color: blackColor, fontSize: smallerTextFontSize)),
      ),
      StreamBuilder(builder: (context, snapshot) {
        return TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: customInputDecoration(hint: 'example@email.com'));
      })
    ]);
  }

  Widget nameField() {
    return Column(children: [
      const Align(
        alignment: Alignment.bottomLeft,
        child: Text("Name",
            style: TextStyle(color: blackColor, fontSize: smallerTextFontSize)),
      ),
      StreamBuilder(builder: (context, snapshot) {
        return TextFormField(
            keyboardType: TextInputType.name,
            decoration: customInputDecoration(hint: 'John Doe'));
      })
    ]);
  }

  Widget notice() {
    return const Text("By signing in, you accept our policy and terms",
        style: TextStyle(color: blackColor, fontSize: smallerTextFontSize));
  }

  Widget passwordField(String text) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(text,
              style: const TextStyle(
                  color: blackColor, fontSize: smallerTextFontSize)),
        ),
        StreamBuilder(
          builder: (context, snapshot) {
            return TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: customInputDecoration(hint: "khbh%klna"));
          },
        )
      ],
    );
  }

  Widget submitButton() {
    return StreamBuilder(
      builder: (context, snapshot) {
        return authButtons(pressed: () {}, text: "Create Account");
      },
    );
  }
}
