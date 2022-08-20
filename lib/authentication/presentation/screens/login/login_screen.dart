import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/authentication/presentation/screens/forgot_password/forgot_password.dart';
import 'package:simplibuy/authentication/presentation/screens/signup/signup_screen.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/core/constant.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            child: ordinaryAndClickableText(
                text: "New here?",
                clickableText: " Sign up",
                onClicked: () {
                  Get.to(const SignUpForm());
                }),
          ),
          elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.all(defaultPadding),
          // child: Center(
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
                signIn(),
                const Padding(
                  padding: EdgeInsets.only(top: defaultPadding),
                ),
                emailField(),
                const Padding(
                  padding: EdgeInsets.only(top: defaultPadding),
                ),
                passwordField(),
                const Padding(
                  padding: EdgeInsets.only(top: defaultPadding),
                ),
                forgotPassword(() {
                  Get.to(const ForgotPassword());
                }),
                const Padding(
                  padding: EdgeInsets.only(top: defaultPadding),
                ),
                submitButton(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    clickableSmallButton(
                        onPressed: () {}, path: 'assets/images/google.png'),
                    clickableSmallButton(
                        onPressed: () {}, path: 'assets/images/fb.png')
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget forgotPassword(VoidCallback onClick) {
    return Align(
        alignment: Alignment.bottomLeft,
        child: RichText(
            text: TextSpan(
                text: "Forgot Password?",
                style: const TextStyle(
                    color: blueColor,
                    fontSize: smallerTextFontSize,
                    fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()..onTap = onClick)));
  }

  Widget signIn() {
    return const Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Sign in",
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

  Widget passwordField() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text("Password",
              style:
                  TextStyle(color: blackColor, fontSize: smallerTextFontSize)),
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
        return authButtons(pressed: () {}, text: "Sign in");
      },
    );
  }
}
