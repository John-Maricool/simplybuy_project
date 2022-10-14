import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/history/presentation/screens/custom_widgets.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: 'History', onPressed: () => Get.back()),
      body: Container(
        padding: const EdgeInsets.all(defaultPadding),
        child: ListView.builder(
            itemCount: 9,
            itemBuilder: (context, index) {
              return singleHistoryItem(context);
            }),
      ),
    );
  }
}
