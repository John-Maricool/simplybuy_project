// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/authentication/presentation/screen_model_controllers/signup_screen_controller.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/core/error_types/error_types.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/core/constant.dart';
import '../../../../core/state/state.dart';

class SignUpForm extends StatelessWidget {
  SignupScreenController controller = Get.find<SignupScreenController>();
  SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.all(defaultPadding),
            child: SingleChildScrollView(child: Obx(() {
              if (controller.state is LoadingState) {
                return defaultLoading(context);
              }
              return signUp(context);
            }))));
  }

  Widget signUp(BuildContext context) {
    return Column(
      children: [
        imageFromAssetsFolder(
            width: 120.0,
            height: 50.0,
            path: 'assets/images/simplibuy_logo_small.png'),
        showConnectionError(context),
        const Padding(
          padding: EdgeInsets.only(top: defaultPadding),
        ),
        signUpText(),
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
        passwordField(),
        const Padding(
          padding: EdgeInsets.only(top: defaultPadding),
        ),
        reenterPasswordField(),
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
        ordinaryAndClickableText(
            text: "Already have an account?",
            clickableText: " Sign in",
            onClicked: () {
              Get.toNamed(LOGIN_ROUTE);
            })
      ],
    );
  }

  Widget signUpText() {
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

  Widget showConnectionError(BuildContext context) {
    return Obx(() {
      if (controller.state == ErrorState(errorType: InternetError())) {
        return noInternetConnection(context);
      }
      return const Padding(
        padding: EdgeInsets.only(top: 15.0),
      );
    });
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
            onChanged: (value) {
              controller.addEmail(value);
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

  Widget nameField() {
    return Column(children: [
      const Align(
        alignment: Alignment.bottomLeft,
        child: Text("Name",
            style: TextStyle(color: blackColor, fontSize: smallerTextFontSize)),
      ),
      Obx(() {
        return TextField(
            onChanged: (value) {
              controller.addName(value);
            },
            keyboardType: TextInputType.name,
            decoration: customInputDecoration(
                hint: 'John Doe',
                errorText:
                    controller.nameError == "" ? null : controller.nameError));
      })
    ]);
  }

  Widget notice() {
    return const Text("By signing in, you accept our policy and terms",
        style: TextStyle(color: blackColor, fontSize: smallerTextFontSize));
  }

  Widget passwordField() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text('Enter Password',
              style: const TextStyle(
                  color: blackColor, fontSize: smallerTextFontSize)),
        ),
        Obx(
          () {
            return TextField(
                onChanged: (value) {
                  controller.addPassword(value);
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
                    hint: "123345",
                    errorText: controller.passwordError == ""
                        ? null
                        : controller.passwordError));
          },
        )
      ],
    );
  }

  Widget reenterPasswordField() {
    return Column(
      children: [
        const Align(
          alignment: Alignment.bottomLeft,
          child: Text('Confirm Password',
              style:
                  TextStyle(color: blackColor, fontSize: smallerTextFontSize)),
        ),
        Obx(
          () {
            return TextField(
                obscureText: controller.isVisible,
                onChanged: (value) {
                  controller.addSecondPassword(value);
                },
                keyboardType: TextInputType.visiblePassword,
                decoration: customInputDecoration(
                    hint: "123345",
                    errorText: controller.secondpasswordError == ""
                        ? null
                        : controller.secondpasswordError));
          },
        )
      ],
    );
  }

  Widget submitButton() {
    return defaultButtons(
        pressed: controller.signupUser, text: "Create Account");
  }
}
