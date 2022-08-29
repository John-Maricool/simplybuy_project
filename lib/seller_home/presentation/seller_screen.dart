import 'package:flutter/material.dart';
import 'package:simplibuy/seller_home/presentation/custom_widgets.dart';

class SellerScreen extends StatelessWidget {
  const SellerScreen({Key? key}) : super(key: key);

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
          ],
        )
      ],
    ));
  }

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
