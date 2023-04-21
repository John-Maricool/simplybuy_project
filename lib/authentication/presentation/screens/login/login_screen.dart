import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/authentication/presentation/screens/custom_widgets.dart';
import 'package:simplibuy/authentication/presentation/screens/forgot_password/forgot_password.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/core/constant.dart';
import '../../../../core/error_types/error_types.dart';
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
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(defaultPadding),
            // child: Center(
            child: SingleChildScrollView(child: login(context))));
  }

  Widget login(BuildContext context) {
    return Column(
      children: [
        imageFromAssetsFolder(
            width: 120.0,
            height: 50.0,
            path: 'assets/images/simplibuy_logo_small.png'),
        showConnectionError(context),
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
        forgotPasswordAndVerifyEmail(() {
          Get.to(const ForgotPassword());
        }, () {
          controller.resendOtp();
        }),
        const Padding(
          padding: EdgeInsets.only(top: defaultPadding),
        ),
        submitButton(),
        const Padding(
          padding: EdgeInsets.only(top: defaultPadding),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ordinaryAndClickableText(
              text: "New here?",
              clickableText: " Sign up",
              onClicked: () {
                Get.delete<LoginScreenController>();
                Get.offNamed(SIGNUP_ROUTE);
              }),
        ),
        showLoadingOrServerError(context),
      ],
    );
  }

  Widget showLoadingOrServerError(BuildContext context) {
    return Obx(() {
      if (controller.state is LoadingState) {
        return defaultLoading(context);
      }
      if (controller.state == ErrorState(errorType: ServerError())) {
        final err = (controller.state as ErrorState).getErrorMessage();
        errorToast(err);
      }
      return Container();
    });
  }

  Widget forgotPasswordAndVerifyEmail(
      VoidCallback onClick, VoidCallback verifyClicked) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      RichText(
          text: TextSpan(
              text: "Forgot Password?",
              style: const TextStyle(
                  color: blueColor,
                  fontSize: smallerTextFontSize,
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()..onTap = onClick)),
      RichText(
          text: TextSpan(
              text: "Verify Email",
              style: const TextStyle(
                  color: blueColor,
                  fontSize: smallerTextFontSize,
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()..onTap = verifyClicked))
    ]);
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

  Widget submitButton() {
    return defaultButtons(pressed: controller.loginInUser, text: "Sign in");
  }
}
