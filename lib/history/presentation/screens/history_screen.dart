import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/presentation/screens/custom_widgets.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/history/domain/entities/history_data.dart';
import 'package:simplibuy/history/presentation/screens/custom_widgets.dart';

import '../../../buyer_home/presentation/controller/buyer_home_navigation_controller.dart';
import '../../../core/error_types/error_types.dart';
import '../../../core/state/state.dart';
import '../controller/history_data_controller.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

  final HistoryDataController _controller = Get.find<HistoryDataController>();

  BuyerHomeNavigationController navController =
      Get.find<BuyerHomeNavigationController>();

  @override
  Widget build(BuildContext context) {
    _controller.start();
    return Scaffold(
      appBar: customAppBar(
          text: 'History', onPressed: () => navController.changePage(0)),
      body: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Obx(() {
            if (_controller.state == ErrorState(errorType: EmptyListError())) {
              return emptyHistory(context);
            }
            if (_controller.state == ErrorState(errorType: InternetError())) {
              return noInternetConnection(context);
            }
            if (_controller.state is FinishedState) {
              return ListView.builder(
                  itemCount: _controller.data.length,
                  itemBuilder: (context, index) {
                    return singleHistoryItem(context, _controller.data[index]);
                  });
            }
            if (_controller.state == ErrorState(errorType: ServerError())) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                duration: Duration(milliseconds: 1000),
                content: Text('Error with Server'),
              ));
              return defaultLoading(context);
            }
            return defaultLoading(context);
          })),
    );
  }
}
