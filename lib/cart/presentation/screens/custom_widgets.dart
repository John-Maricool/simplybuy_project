import 'package:flutter/material.dart';
import 'package:simplibuy/cart/domain/entities/item_cart_detail.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';

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
    {required int number,
    required VoidCallback onAdded,
    required VoidCallback onSubtracted}) {
  return Row(children: [
    itemCounterIcon(Icons.add_outlined, onAdded),
    Text(number.toString(),
        style: const TextStyle(color: blackColor, fontSize: smallTextFontSize)),
    itemCounterIcon(Icons.remove, onSubtracted)
  ]);
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

Widget cartListSingleItem(ItemCartDetails details) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset("assets/images/cart_test.png"),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(details.storeName,
            maxLines: 1,
            style: const TextStyle(color: blackColor, fontSize: 15)),
        const Padding(padding: EdgeInsets.only(top: 5)),
        Text(details.itemName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: blackColor,
                fontSize: smallTextFontSize)),
        const Padding(padding: EdgeInsets.only(top: 5)),
        Text(details.itemPrice.toString(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style:
                const TextStyle(color: blackColor, fontSize: smallTextFontSize))
      ])
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

Widget noDataInCart(VoidCallback startShoppingClicked) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/no_cart_items.png'),
      const Padding(padding: EdgeInsets.only(top: 10)),
      const Text(
        'Your Cart is Empty',
        style: TextStyle(
            color: blackColor,
            fontSize: smallTextFontSize,
            fontWeight: FontWeight.bold),
      ),
      const Padding(padding: EdgeInsets.only(top: 10)),
      const Text(
        'Looks like you have not added anything to your cart.',
        style: TextStyle(color: blackColor, fontSize: 15),
      ),
      const Padding(padding: EdgeInsets.only(top: 30)),
      defaultButtons(pressed: startShoppingClicked, text: 'Start Shopping')
    ],
  );
}
