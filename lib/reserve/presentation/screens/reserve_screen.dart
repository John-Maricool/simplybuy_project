import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/reserve/presentation/controllers/reserve_controller.dart';

import '../../../core/constants/route_constants.dart';

// ignore: must_be_immutable
class ReserveScreen extends StatelessWidget {
  ReserveScreen({Key? key}) : super(key: key);

  ReserveController controller = Get.find<ReserveController>();
  final padding = const Padding(padding: EdgeInsets.only(top: 10));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          text: "Reserve",
          onPressed: () {
            Get.back();
          }),
      body: Container(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(children: [
          const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "When do you intend to pick this up?",
                textAlign: TextAlign.left,
                style: TextStyle(color: blackColor, fontSize: 20),
              )),
          padding,
          InkWell(
            child: Obx(() {
              return Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: lightBlueColor, // border color
                      width: 2.0, // border width
                    ),
                  ),
                  child: Text(
                    controller.date,
                    style: const TextStyle(color: blackColor, fontSize: 25),
                  ));
            }),
            onTap: () {
              controller.selectDate(context);
            },
          ),
          padding,
          const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Select time:",
                textAlign: TextAlign.left,
                style: TextStyle(color: blackColor, fontSize: 20),
              )),
          padding,
          InkWell(
            child: Obx(() {
              return Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: lightBlueColor,
                      width: 2.0,
                    ),
                  ),
                  child: Text(
                    controller.time,
                    style: const TextStyle(color: blackColor, fontSize: 25),
                  ));
            }),
            onTap: () {
              controller.selectTime(context);
            },
          ),
          padding,
          padding,
          defaultButtons(
              pressed: () {
                Get.toNamed(RESERVE_SCREEN_COMPL);
              },
              text: "Reserve Item")
        ]),
      ),
    );
  }
}
