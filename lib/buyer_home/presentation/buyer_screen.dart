import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/buyer_home/domain/entities/strore_details.dart';
import 'package:simplibuy/buyer_home/presentation/custom_widgets.dart';
import 'package:simplibuy/core/constants/route_constants.dart';

// ignore: must_be_immutable
class BuyerScreen extends StatelessWidget {
  BuyerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                _createSearchView(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customButtonWithIcon(
                        text: "Stores",
                        iconData: Icons.storefront,
                        onPressed: () {}),
                    const Padding(padding: EdgeInsets.only(left: 6.0)),
                    customButtonWithIcon(
                        text: "Malls",
                        iconData: Icons.local_mall,
                        onPressed: () {}),
                  ],
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: RichText(
                        text: TextSpan(
                            text: "View all",
                            style: const TextStyle(
                                color: blackColor,
                                fontSize: smallerTextFontSize),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(STORES_LIST_ROUTE);
                              }))),
                Expanded(
                  child: _itemsList(),
                )
              ],
            )));
  }

  Widget _itemsList() {
    return GridView.count(
        crossAxisCount: 2,
        physics: const ScrollPhysics(),
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 6.0,
        children: List.generate(
            8,
            (index) => Center(
                  child: storesGridSingleItem(details: stores[index]),
                )));
  }

  List<StoreDetails> stores = const <StoreDetails>[
    StoreDetails(name: 'Shoprite Mall', location: "New Haven, Enugu"),
    StoreDetails(name: 'Roban Stores', location: "Old Haven, Enugu"),
    StoreDetails(name: 'Spar mall', location: "New Haven, Enugu"),
    StoreDetails(name: 'Shoprite Mall', location: "New Haven, Enugu"),
    StoreDetails(name: 'Shoprite Mall', location: "New Haven, Enugu"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
  ];

  Widget _createSearchView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: search(context),
    );
  }

  Widget search(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [searchInput(context), filterOption(() {})],
    );
  }
}
