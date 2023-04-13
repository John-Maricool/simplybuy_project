import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:simplibuy/core/constant.dart';

Widget defaultButtons(
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

Widget defaultLoading(BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Image.asset(
          "assets/gifs/simpliby_loading.gif",
          height: 100.0,
          width: 100.0,
        ),
      ));
}

InputDecoration customInputDecoration(
    {String? hint, String? label, String? errorText, Widget? icon}) {
  return InputDecoration(
      hintText: hint,
      errorText: errorText,
      labelText: label,
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: blueColor),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: lightBlueColor),
      ),
      suffixIcon: icon,
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: errorColor),
      ));
}

Widget clickableSmallButton(
    {required VoidCallback onPressed,
    required String path,
    double height = 30.0,
    double width = 30.0}) {
  return Container(
      padding: const EdgeInsets.all(15.0),
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
    {required double width,
    required double height,
    required String path,
    double padding = 15}) {
  return Container(
    padding: EdgeInsets.all(padding),
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
    {required String text,
    required VoidCallback onPressed,
    List<Widget>? actions}) {
  return AppBar(
    elevation: 0.0,
    title: Text(
      text,
      style: const TextStyle(color: blackColor, fontSize: 18.0),
    ),
    backgroundColor: whiteColor,
    actions: actions,
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

Widget bottmNavItemWithIcon(
    {required IconData data,
    required String text,
    required VoidCallback onClick}) {
  return Column(
    children: [
      Icon(data, color: blueColor, size: 17),
      const Padding(padding: EdgeInsets.only(left: 5.0)),
      RichText(
          text: TextSpan(
              text: text,
              style: const TextStyle(
                  color: blueColor,
                  fontSize: smallerTextFontSize,
                  fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()..onTap = onClick))
    ],
  );
}

Widget noInternetConnection(BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 35,
      child: Card(
        color: Colors.red,
        child: Row(children: [
          Image.asset('assets/images/no_nwk_auth.png'),
          const Padding(padding: EdgeInsets.only(left: 4)),
          const Text(
            'No internet connection, please try again',
            style: TextStyle(color: whiteColor, fontSize: smallerTextFontSize),
          )
        ]),
      ));
}
