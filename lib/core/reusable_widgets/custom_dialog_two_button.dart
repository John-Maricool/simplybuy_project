import 'package:flutter/material.dart';
import 'package:simplibuy/core/reusable_widgets/custom_dialog.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';

import '../constant.dart';

// ignore: must_be_immutable
class CustomDialogTwoButton extends CustomDialog {
  VoidCallback callback1;
  VoidCallback callback2;
  IconData dialogIcon = Icons.check_circle_outline_rounded;
  Color iconCol = blueColor;
  String textDetails;
  String buttonText2;
  String buttonText1;

  CustomDialogTwoButton(
      {Key? key,
      required this.callback1,
      required this.callback2,
      required this.dialogIcon,
      required this.buttonText1,
      required this.buttonText2,
      required this.textDetails,
      required this.iconCol})
      : super(
            key: key,
            callback: callback1,
            iconColor: iconCol,
            textDetail: textDetails,
            buttonText: buttonText1,
            icon: dialogIcon);

  @override
  Widget setButtons() {
    return Container(
        padding: const EdgeInsets.all(15.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          defaultButtons(
              pressed: callback1, text: buttonText1, size: const Size(60, 30)),
          defaultButtons(
              pressed: callback2, text: buttonText2, size: const Size(60, 30)),
        ]));
  }
}
