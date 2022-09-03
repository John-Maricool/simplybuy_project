import 'package:flutter/material.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/buyer_home/domain/entities/strore_details.dart';

Widget customButtonWithIcon(
    {required String text,
    required IconData iconData,
    required VoidCallback onPressed}) {
  return Container(
      height: 60,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(35))),
      padding: const EdgeInsets.all(2),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: blackColor,
        ), //icon data for elevated button
        label: Text(
          text,
          style:
              const TextStyle(color: blackColor, fontSize: smallTextFontSize),
        ), //label text
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18))),
          elevation: 3,
        ),
      ));
}

Widget filterOption(VoidCallback onPressed) {
  return Ink(
      decoration: const ShapeDecoration(
          color: blueColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
      child: IconButton(
          iconSize: 25,
          color: whiteColor,
          onPressed: onPressed,
          icon: const Icon(Icons.filter_list)));
}

Widget searchInput(BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: blueColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 3, color: blueColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(width: 3, color: blueColor),
          ),
          hintText: "Where do you want to shop?",
          hintStyle: TextStyle(color: Colors.grey[800]),
        ),
        textAlign: TextAlign.center,
      ));
}

Widget storesGridSingleItem({required StoreDetails details}) {
  return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      elevation: 5,
      color: Colors.white,
      child: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/shoprirte.png", width: 130),
          Text(
            details.name,
            style:
                const TextStyle(fontSize: smallTextFontSize, color: blackColor),
          ),
          Text(
            details.location,
            style: const TextStyle(fontSize: 15, color: blackColor),
          ),
          const Padding(padding: EdgeInsets.only(top: 5))
        ],
      )));
}
