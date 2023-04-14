import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          text: "Back",
          onPressed: () {
            Get.back();
          }),
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [orderButtons(context), itemsList()],
        ),
      ),
    );
  }

  Widget orderButtons(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.78,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Text(
                  "Incoming Orders",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: blackColor.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Container(
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Text(
                  "Accepted Orders",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: blackColor.withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ]));
  }

  Widget itemsList() {
    return Container();
  }
}
