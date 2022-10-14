import 'package:flutter/material.dart';
import 'package:simplibuy/core/constant.dart';

Widget noInternetConnection(BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 35,
      child: Card(
        color: Colors.red,
        child: Row(children: [
          Image.asset('assets/images/no_nwk_auth.png'),
          Padding(padding: EdgeInsets.only(left: 4)),
          const Text(
            'No internet connection, please try again',
            style: TextStyle(color: whiteColor, fontSize: smallerTextFontSize),
          )
        ]),
      ));
}
