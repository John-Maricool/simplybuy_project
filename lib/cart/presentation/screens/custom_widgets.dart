import 'package:flutter/material.dart';
import 'package:simplibuy/core/constant.dart';

import '../../../buyer_home/domain/entities/strore_details.dart';

Widget itemCounterIcon(IconData icon, VoidCallback onPressed) {
  return IconButton(
    icon: Icon(
      icon,
      color: blackColor,
    ),
    focusColor: blueColor,
    splashColor: blueColor,
    highlightColor: blueColor,
    hoverColor: blueColor,
    iconSize: 15,
    color: lightBlueColor,
    onPressed: onPressed,
  );
}

Widget itemCounter(
    {int number = 2,
    required VoidCallback onAdded,
    required VoidCallback onSubtracted}) {
  return Flexible(
      child: Row(children: [
    itemCounterIcon(Icons.add_outlined, onAdded),
    Text(number.toString(),
        style: TextStyle(color: blackColor, fontSize: smallTextFontSize)),
    itemCounterIcon(Icons.remove, onSubtracted)
  ]));
}

Widget deleteTextButton(VoidCallback onDelete) {
  return TextButton.icon(
      onPressed: onDelete,
      icon: const Icon(
        Icons.delete,
        size: 20.0,
        color: blackColor,
      ),
      label: const Text('Delete',
          style: TextStyle(color: blackColor, fontSize: smallTextFontSize)));
}

Widget cartListSingleItem(StoreDetails? details) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset("assets/images/cart_test.png"),
      Flexible(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Mami\'s kitchen',
            maxLines: 1,
            style: const TextStyle(color: blackColor, fontSize: 15)),
        const Padding(padding: EdgeInsets.only(top: 5)),
        Text('Fried Rice with Chicken',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontSize: smallTextFontSize)),
        const Padding(padding: EdgeInsets.only(top: 5)),
        Text('N3,000',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                const TextStyle(color: blackColor, fontSize: smallTextFontSize))
      ]))
    ],
  );
}

Widget calculationInfo(String title, String amount,
    {FontWeight weight = FontWeight.normal}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
            color: blackColor, fontSize: smallTextFontSize, fontWeight: weight),
      ),
      Text(
        amount,
        style: TextStyle(
            color: blackColor, fontSize: smallTextFontSize, fontWeight: weight),
      )
    ],
  );
}
