import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/authentication/presentation/screens/business_details/custom_widgets.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/core/reusable_widgets/custom_dialog.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';

class AddNewProductScreen extends StatelessWidget {
  AddNewProductScreen({Key? key}) : super(key: key);
  final padding = const Padding(padding: EdgeInsets.only(top: 10));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          text: "Upload product",
          onPressed: () {
            Get.back();
          }),
      body: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              children: [
                businessCategory(
                    title: "What do you want to sell?",
                    onChanged: (value) {},
                    hintText: "eg. XYZ biscuit",
                    errorText: null),
                padding,
                businessCategory(
                    title: "Product description",
                    onChanged: (value) {},
                    hintText: "eg. 80kg made with milk and ice",
                    errorText: null),
                padding,
                businessCategory(
                    title: "Item location (Optional)",
                    onChanged: (value) {},
                    hintText: "eg. Line A1 track B22",
                    errorText: null),
                padding,
                businessCategory(
                    title: "Currency",
                    onChanged: (value) {},
                    hintText: "NGN (Naira)",
                    errorText: null),
                padding,
                businessCategory(
                    title: "Item Price",
                    onChanged: (value) {},
                    hintText: "eg. 500",
                    errorText: null),
                padding,
                businessCategory(
                    title: "Reservation price per product ",
                    onChanged: (value) {},
                    hintText: "eg. 20",
                    errorText: null),
                padding,
                businessCategory(
                    title: "Product category",
                    onChanged: (value) {},
                    hintText: "Cosmetics",
                    errorText: null),
                padding,
                browseFileUpload("Upload Image of item"),
                padding,
                browseFileUpload("Upload Image of rack (optional)"),
                padding,
                defaultButtons(
                    pressed: () {
                      showCongratulationsDialog(context);
                    },
                    text: "Submit")
              ],
            ),
          )),
    );
  }

  Widget browseFileUpload(String title) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(fontSize: 14),
      ),
      const Padding(padding: EdgeInsets.only(top: 10)),
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 140, // Set the width of the container
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: blueColor, // set border color here
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Browse file",
                        style: TextStyle(
                            color: blueColor,
                            fontSize: smallTextFontSize,
                            fontWeight: FontWeight.normal)),
                    Icon(
                      Icons.download_sharp,
                      size: 29,
                    ),
                  ],
                )),
            defaultButtons(
                pressed: () {}, text: "Upload", size: const Size(100, 40))
          ])
    ]);
  }

  void showCongratulationsDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color.fromARGB(255, 168, 164, 164).withOpacity(0.7),
      builder: (BuildContext context) {
        return CustomDialog(
          callback: () {
            Get.toNamed(SELLER_PRODUCT_CATEGORIES);
          },
          icon: Icons.check_circle_outline_rounded,
          buttonText: "View product",
          textDetail: "Your product has been added",
          iconColor: blueColor,
        );
      },
    );
  }
}
