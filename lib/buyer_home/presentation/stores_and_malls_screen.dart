import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';

class StoresAndMallsScreen extends StatelessWidget {
  const StoresAndMallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
      text: "All Stores",
      onPressed: () => Get.back(),
    ));
  }
}
