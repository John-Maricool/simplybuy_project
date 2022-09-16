import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/buyer_home/domain/entities/strore_details.dart';

import '../../../core/reusable_widgets/reusable_widgets.dart';

PreferredSizeWidget homeAppBar(
    {required String text, required VoidCallback onPressed}) {
  return AppBar(
      elevation: 2,
      iconTheme: const IconThemeData(color: blackColor),
      title: Text(
        text,
        style: const TextStyle(color: blackColor, fontSize: smallTextFontSize),
      ),
      backgroundColor: whiteColor,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: onPressed,
                child: Ink(
                    decoration: const ShapeDecoration(shadows: [
                      BoxShadow(color: Color.fromARGB(255, 129, 127, 127))
                    ], color: Colors.white, shape: CircleBorder()),
                    child: IconButton(
                        color: blackColor,
                        highlightColor: whiteColor,
                        focusColor: whiteColor,
                        onPressed: onPressed,
                        icon: const Icon(Icons.notifications)))))
      ]);
}

Widget customButtonWithIcon(
    {required String text,
    required IconData iconData,
    required VoidCallback onPressed,
    BorderSide? side}) {
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
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          primary: Colors.white,
          side: side,
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

Widget searchInputBlue(BuildContext context) {
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
        textAlign: TextAlign.left,
      ));
}

Widget searchInputGrey(BuildContext context) {
  return SizedBox(
      child: TextField(
    decoration: InputDecoration(
      filled: true,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide:
            BorderSide(width: 0, color: Color.fromRGBO(236, 240, 243, 1)),
      ),
      fillColor: const Color.fromRGBO(236, 240, 243, 1),
      prefixIcon: const Icon(
        Icons.search,
        color: blackColor,
      ),
      hintText: "Search for a store",
      hintStyle: TextStyle(color: Colors.grey[800]),
    ),
    textAlign: TextAlign.left,
  ));
}

Widget storesListSingleItem({required StoreDetails details}) {
  return Card(
    margin: const EdgeInsets.all(5),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))),
    elevation: 5,
    color: Colors.white,
    child: Row(
      children: [
        Image.asset("assets/images/shoprite_small.png"),
        Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.bottomRight,
            child: RatingBar.builder(
                initialRating: 3,
                itemSize: 11,
                minRating: 1,
                onRatingUpdate: (rating) {},
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber)),
          ),
          Text(details.name,
              maxLines: 1,
              style: const TextStyle(
                  color: blackColor, fontSize: smallTextFontSize)),
          Text(details.location,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: blackColor, fontSize: 15)),
          Text(details.address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: blackColor, fontSize: 15))
        ]))
      ],
    ),
  );
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

Widget noInternet(VoidCallback startShoppingClicked) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/no_network.png'),
      const Padding(padding: EdgeInsets.only(top: 10)),
      const Text(
        'Oops!',
        style: TextStyle(
            color: blackColor,
            fontSize: smallTextFontSize,
            fontWeight: FontWeight.bold),
      ),
      const Padding(padding: EdgeInsets.only(top: 10)),
      const Text(
        'Please check your Internet connection and try again',
        style: TextStyle(color: blackColor, fontSize: 15),
      ),
      const Padding(padding: EdgeInsets.only(top: 30)),
      defaultButtons(
          pressed: startShoppingClicked,
          text: 'Try Again',
          size: const Size(120, 50))
    ],
  );
}
