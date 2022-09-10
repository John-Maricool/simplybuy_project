import 'package:flutter/material.dart';
import 'package:simplibuy/cart/presentation/screens/custom_widgets.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import '../../../core/constant.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: const Text(
            "Cart",
            style: TextStyle(color: blackColor, fontSize: 18.0),
          ),
          backgroundColor: whiteColor,
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Expanded(
                child: cartList(),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              calculations(),
              const Padding(padding: EdgeInsets.only(top: 10)),
              defaultButtons(pressed: () {}, text: 'Reserve Item'),
              const Padding(padding: EdgeInsets.only(top: 10)),
              defaultButtons(pressed: () {}, text: 'I want this delivered')
            ])));
  }

  Widget singleCartItem() {
    return Card(
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        elevation: 2,
        color: const Color.fromRGBO(237, 232, 255, 1.0),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            cartListSingleItem(null),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                deleteTextButton(() {}),
                Align(
                  alignment: Alignment.centerRight,
                  child: itemCounter(onAdded: () {}, onSubtracted: () {}),
                )
              ],
            )
          ],
        ));
  }

  Widget cartList() {
    return ListView.builder(
        itemCount: 4,
        itemBuilder: (context, position) {
          return singleCartItem();
        });
  }

  Widget calculations() {
    return Card(
        margin: const EdgeInsets.all(8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        elevation: 2,
        color: const Color.fromRGBO(237, 232, 255, 1.0),
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                calculationInfo('Subtotal', 'N393,000'),
                const Padding(padding: EdgeInsets.only(top: 10)),
                calculationInfo('Reserve Charges', 'N100'),
                const Padding(padding: EdgeInsets.only(top: 10)),
                const Divider(
                  color: Colors.black,
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                calculationInfo('Total', 'N393,100', weight: FontWeight.bold)
              ],
            )));
  }
}
