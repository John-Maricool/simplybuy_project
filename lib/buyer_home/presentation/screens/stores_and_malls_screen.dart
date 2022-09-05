import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/presentation/screens/custom_widgets.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import '../controller/stores_and_malls_controller.dart';

// ignore: must_be_immutable
class StoresAndMallsScreen extends StatelessWidget {
  StoresAndMallsScreen({Key? key}) : super(key: key);

  StoresAndMallsController controller = Get.find<StoresAndMallsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          text: "All Stores",
          onPressed: () => Get.back(),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              searchInputGrey(context),
              const Padding(padding: EdgeInsets.only(top: defaultPadding)),
              Expanded(child: storesList())
            ],
          ),
        ));
  }

  Widget storesList() {
    return ListView.builder(
        itemCount: controller.details.length,
        itemBuilder: (context, position) {
          return storesListSingleItem(details: controller.details[position]);
        });
  }
}
