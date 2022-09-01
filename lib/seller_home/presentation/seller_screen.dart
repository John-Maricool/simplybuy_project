import 'package:flutter/material.dart';
import 'package:simplibuy/seller_home/domain/entities/strore_details.dart';
import 'package:simplibuy/seller_home/presentation/custom_widgets.dart';

class SellerScreen extends StatelessWidget {
  SellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _createSearchView(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButtonWithIcon(
                text: "Stores", iconData: Icons.storefront, onPressed: () {}),
            const Padding(padding: EdgeInsets.only(left: 6.0)),
            customButtonWithIcon(
                text: "Malls", iconData: Icons.local_mall, onPressed: () {}),
            //_itemsList()
          ],
        )
      ],
    ));
  }

  Widget _itemsList() {
    return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 9.0,
        children: List.generate(
            4,
            (index) => Center(
                  child: storesListSingleItem(details: stores[index]),
                )));
  }

  List<StoreDetails> stores = const <StoreDetails>[
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
    StoreDetails(name: 'Home', location: "Perfect"),
  ];

  Widget _createSearchView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
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
