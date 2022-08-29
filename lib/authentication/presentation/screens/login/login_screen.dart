import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/authentication/presentation/screens/forgot_password/forgot_password.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/core/constant.dart';
import '../../../../core/state/state.dart';
import '../../screen_model_controllers/login_screen_controller.dart';

// ignore: must_be_immutable
class LoginForm extends StatelessWidget {
  LoginScreenController controller = Get.find<LoginScreenController>();
  LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            child: ordinaryAndClickableText(
                text: "New here?",
                clickableText: " Sign up",
                onClicked: () {
                  Get.toNamed(SIGNUP_ROUTE);
                }),
          ),
        ),
        body: Container(
            margin: const EdgeInsets.all(defaultPadding),
            // child: Center(
            child: SingleChildScrollView(child: Obx(() {
              if (controller.state is LoadingState)
                return defaultLoading(context);
              if (controller.state is ErrorState) return const Text("Error");
              return login();
            }))));
  }

  Widget login() {
    return Column(
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
            clickableSmallButton(onPressed: () {}, path: 'assets/images/fb.png')
          ],
        ),
      ],
    );
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
      Obx(() {
        return TextField(
            onChanged: (email) {
              controller.addEmail(email);
            },
            keyboardType: TextInputType.emailAddress,
            decoration: customInputDecoration(
                hint: 'example@email.com',
                errorText: controller.emailError == ""
                    ? null
                    : controller.emailError));
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
        Obx(
          () {
            return TextFormField(
                onChanged: (pass) {
                  controller.addPassword(pass);
                },
                obscureText: controller.isVisible,
                keyboardType: TextInputType.visiblePassword,
                decoration: customInputDecoration(
                    icon: InkWell(
                      onTap: controller.changeVisibility,
                      child: Icon(
                        controller.isVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    hint: "1234450",
                    errorText: controller.passwordError == ""
                        ? null
                        : controller.passwordError));
          },
        )
      ],
    );
  }

  Widget submitButton() {
    return defaultButtons(pressed: controller.loginInUser, text: "Sign in");
  }
}
