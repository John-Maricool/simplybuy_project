import 'package:flutter/material.dart';
import 'package:simplibuy/core/constant.dart';

Widget singleHistoryItem(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: Colors.grey,
          width: 3,
        )),
    width: MediaQuery.of(context).size.width,
    height: 300,
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: lightBlueColor),
          child: Image.asset(
            'assets/images/simpliby_logo.png',
            width: 50,
            height: 50,
          ),
        ),
        _historyDetails()
      ],
    ),
  );
}

Widget _historyDetails() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Purchase ID: NAJN23343NJ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontSize: smallTextFontSize),
          ),
          Text(
            'Just now',
            style: TextStyle(color: blackColor, fontSize: smallerTextFontSize),
          ),
        ],
      ),
      Text(
        'Status: Paid',
        style: TextStyle(color: blackColor, fontSize: smallTextFontSize),
      ),
      Text(
        'Total Amount: 400',
        style: TextStyle(color: blackColor, fontSize: smallTextFontSize),
      ),
    ],
  );
}
