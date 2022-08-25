import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:simplibuy/core/constant.dart';

Widget authButtons(
    {required VoidCallback pressed,
    required String text,
    Size size = fullWidthButtonSize}) {
  return ElevatedButton(
      onPressed: pressed,
      style: ElevatedButton.styleFrom(
          primary: blueColor, minimumSize: size, shadowColor: blueColor),
      child: Text(
        text,
        style: const TextStyle(color: whiteColor, fontSize: smallTextFontSize),
      ));
}

InputDecoration customInputDecoration(
    {String? hint, String? label, String? errorText}) {
  return InputDecoration(
      hintText: hint,
      errorText: errorText,
      labelText: label,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: blackColor),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: lightBlueColor),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: errorColor),
      ));
}

Widget clickableSmallButton(
    {required VoidCallback onPressed,
    required String path,
    double height = 30.0,
    double width = 30.0}) {
  return Container(
      padding: EdgeInsets.all(15.0),
      child: InkWell(
        onTap: onPressed,
        child: Image.asset(
          path,
          height: height,
          width: width,
        ),
      ));
}

Widget imageFromAssetsFolder(
    {required double width, required double height, required String path}) {
  return Container(
    padding: const EdgeInsets.all(15.0),
    child: Image.asset(
      path,
      height: height,
      width: width,
    ),
  );
}

Widget ordinaryAndClickableText(
    {required String text,
    required String clickableText,
    required VoidCallback onClicked}) {
  return RichText(
    text: TextSpan(
      style: const TextStyle(color: blackColor, fontSize: smallerTextFontSize),
      children: <TextSpan>[
        TextSpan(text: text),
        TextSpan(
            text: clickableText,
            style: const TextStyle(
                color: blueColor,
                fontSize: smallerTextFontSize,
                fontWeight: FontWeight.bold),
            recognizer: TapGestureRecognizer()..onTap = onClicked),
      ],
    ),
  );
}

PreferredSizeWidget customAppBar(
    {required String text, required VoidCallback onPressed}) {
  return AppBar(
    elevation: 0.0,
    title: Text(
      text,
      style: const TextStyle(color: blackColor, fontSize: 18.0),
    ),
    backgroundColor: whiteColor,
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: blackColor,
        size: 17.0,
      ),
    ),
  );
}
