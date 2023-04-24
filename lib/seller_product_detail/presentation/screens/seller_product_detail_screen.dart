import 'package:flutter/material.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/store_and_product/presentation/screens/custom_widgets.dart';

class SellerProductDetailScreen extends StatelessWidget {
  const SellerProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: _body(context)),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        imageSlidersProduct(context, [
          "https://lremflickr.com/g/320/240/paris,girl/all",
          "https://lremflickr.com/g/320/240/paris,girl/all",
          "https://lremflickr.com/g/320/240/paris,girl/all",
          "https://lremflickr.com/g/320/240/paris,girl/all"
        ]),
        Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.only(top: 30)),
              const Text("Food Chicken",
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 23,
                      fontWeight: FontWeight.bold)),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  Text(
                    'Available',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Radio(
                    value: 2,
                    groupValue: 2,
                    onChanged: (value) {},
                  ),
                  Text(
                    'Out of stock',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              TextField(
                  onChanged: (business) {},
                  keyboardType: TextInputType.name,
                  maxLines: 4,
                  maxLength: 4,
                  decoration:
                      customInputDecoration(hint: null, errorText: null)),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Edit Price:",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                            width: 120.0,
                            height: 60.0,
                            child: TextField(
                                onChanged: (business) {},
                                keyboardType: TextInputType.name,
                                maxLines: 1,
                                decoration: customInputDecoration(
                                    hint: null, errorText: null)))
                      ]),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Reservation Price:",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                            width: 120.0,
                            height: 60.0,
                            child: TextField(
                                onChanged: (business) {},
                                keyboardType: TextInputType.name,
                                maxLines: 1,
                                decoration: customInputDecoration(
                                    hint: null, errorText: null)))
                      ]),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              defaultButtons(pressed: () {}, text: "Update")
            ],
          ),
        ),
      ],
    );
  }
}
