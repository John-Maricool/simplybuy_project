import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';

class SellerPaymentsScreen extends StatelessWidget {
  const SellerPaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          text: "",
          onPressed: () {
            Get.back();
          },
          actions: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              IconButton(
                  onPressed: () {
                    Get.toNamed(ADD_BANK_SCREEN);
                  },
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: blackColor,
                  )),
              const Text(
                "Add Bank",
                style:
                    TextStyle(color: blackColor, fontSize: smallTextFontSize),
              ),
              const Padding(padding: EdgeInsets.only(left: 10))
            ])
          ]),
      body: Container(
        padding: const EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
          bottom: defaultPadding,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          showTotalAmoundSold(context),
          const Padding(padding: EdgeInsets.only(top: 10)),
          defaultButtons(
              pressed: () {
                Get.toNamed(WITHDRAWAL_SCREEN);
              },
              text: "Withdraw",
              size: const Size(120, 40)),
          const Padding(padding: EdgeInsets.only(top: 5)),
          orderButtons(context),
          const Padding(padding: EdgeInsets.only(top: 10)),
          transactionButton(),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (value, index) {
                    return singleTransaction(context);
                  },
                  separatorBuilder: (context, index) {
                    return const Padding(padding: EdgeInsets.only(top: 5));
                  },
                  itemCount: 10))
        ]),
      ),
    );
  }

  Widget transactionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Text(
          "Transactions",
          style: TextStyle(fontSize: smallTextFontSize),
        ),
        Text(
          "View all",
          style: TextStyle(fontSize: smallerTextFontSize),
        )
      ],
    );
  }

  Widget showTotalAmoundSold(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.22,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            blueColor,
            Color.fromARGB(255, 3, 89, 160),
            Color.fromARGB(255, 14, 141, 245),
            Color.fromARGB(255, 116, 182, 236)
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Total amount sold",
                  style: TextStyle(
                      color: whiteColor, fontSize: smallerTextFontSize),
                ),
                Text(
                  "This month ",
                  style: TextStyle(
                      color: whiteColor, fontSize: smallerTextFontSize),
                )
              ]),
          const Padding(padding: EdgeInsets.only(top: 10)),
          const Text(
            "\$30,000",
            style: TextStyle(
                color: whiteColor, fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const Padding(padding: EdgeInsets.only(top: 30)),
          const Text(
            "Roban stores",
            style: TextStyle(color: whiteColor, fontSize: smallerTextFontSize),
          )
        ],
      ),
    );
  }

  Widget orderButtons(BuildContext context) {
    return Container(
        width: 290,
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
                width: 130,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Paid Orders",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              const Padding(padding: EdgeInsets.only(left: 6)),
              Container(
                width: 130,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: GestureDetector(
                    onTap: () {
                      //  controller.getAcceptedOrders();
                    },
                    child: Text(
                      "Unpaid Orders",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: blackColor.withOpacity(0.8),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              )
            ]));
  }

  Widget singleTransaction(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(7))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Oni Mikel",
                  style: TextStyle(fontSize: smallTextFontSize),
                ),
                Text(
                  "FCMB",
                  style: TextStyle(fontSize: smallTextFontSize),
                ),
                Text(
                  "20th May, 2022",
                  style: TextStyle(fontSize: smallerTextFontSize),
                ),
              ],
            ),
            const Text(
              "N500",
              style: TextStyle(color: Colors.green, fontSize: 20),
            )
          ]),
    );
  }
}
