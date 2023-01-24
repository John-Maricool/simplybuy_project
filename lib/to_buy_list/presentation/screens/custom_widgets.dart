import 'package:flutter/material.dart';
import 'package:simplibuy/core/constant.dart';

Widget singleTextFieldToBuy() {
  return const TextField(
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 3, color: blueColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 3, color: blueColor),
      ),
    ),
    textAlign: TextAlign.center,
  );
}
