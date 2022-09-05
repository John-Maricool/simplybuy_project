import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/presentation/controller/stores_and_malls_controller.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/buyer_home/presentation/screens/custom_widgets.dart';
import 'package:simplibuy/core/constants/route_constants.dart';

import '../../../core/reusable_widgets/reusable_widgets.dart';
import '../../../core/state/state.dart';

// ignore: must_be_immutable
class BuyerScreen extends StatelessWidget {
  BuyerScreen({Key? key}) : super(key: key);

  StoresAndMallsController controller = Get.find<StoresAndMallsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              _createSearchView(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return customButtonWithIcon(
                        text: "Stores",
                        iconData: Icons.storefront,
                        onPressed: () {
                          controller.getStores();
                        },
                        side: controller.isStore
                            ? const BorderSide(color: blueColor, width: 2)
                            : null);
                  }),
                  const Padding(padding: EdgeInsets.only(left: 6.0)),
                  Obx(() {
                    return customButtonWithIcon(
                        text: "Malls",
                        iconData: Icons.local_mall,
                        onPressed: () {
                          controller.getMalls();
                        },
                        side: controller.isStore
                            ? null
                            : const BorderSide(color: blueColor, width: 2));
                  })
                ],
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: RichText(
                      text: TextSpan(
                          text: "View all",
                          style: const TextStyle(
                              color: blackColor, fontSize: smallerTextFontSize),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(STORES_LIST_ROUTE);
                            }))),
              Expanded(
                child: _itemsList(context),
              )
              //])
            ])));
  }

  Widget _itemsList(BuildContext context) {
    return Obx(() {
      if (controller.state is LoadingState) {
        return defaultLoading(context);
      }
      if (controller.state is ErrorState) {
        return const Text("Error");
      }
      return GridView.count(
          crossAxisCount: 2,
          physics: const ScrollPhysics(),
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 6.0,
          children: List.generate(
              controller.details.length,
              (index) => Center(
                    child: storesGridSingleItem(
                        details: controller.details[index]),
                  )));
    });
  }

  Widget _createSearchView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: search(context),
    );
  }

  Widget search(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [searchInputBlue(context), filterOption(() {})],
    );
  }
}
