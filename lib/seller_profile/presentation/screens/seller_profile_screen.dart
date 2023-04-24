import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/constants/route_constants.dart';
import 'package:simplibuy/core/constants/string_constants.dart';
import 'package:simplibuy/store_and_product/presentation/screens/custom_widgets.dart';

class SellerProfileScreen extends StatelessWidget {
  const SellerProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 243, 243),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
              height: 320,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  imageSliders(context, []),
                  Positioned(
                      top: 40,
                      right: 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: otherOptions(),
                      )),
                  Positioned(
                    bottom: -10,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: storeLogo(context),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: editProfileButton(),
                    ),
                  )
                ],
              )),
          const Padding(
              padding: EdgeInsets.only(left: defaultPadding),
              child: Text(
                "SHOPRITE",
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: smallTextFontSize),
              )),
          Padding(
              padding: const EdgeInsets.only(
                  left: defaultPadding, right: defaultPadding),
              child: storeDescription(desc: "The best store in the world")),
          Padding(
              padding: const EdgeInsets.only(
                  left: defaultPadding, right: defaultPadding),
              child: storeContactDetails(
                  email: "ebukaikenwa@gmail.com", phoneNumber: "09027901278")),
          Padding(
              padding: const EdgeInsets.only(left: defaultPadding),
              child: Row(children: const [
                Icon(
                  Icons.location_on,
                  color: blackColor,
                  size: 13,
                ),
                Text(
                  "Olorunsogo Street",
                  style: TextStyle(
                    color: blackColor,
                    fontSize: 15,
                  ),
                )
              ])),
          const Padding(padding: EdgeInsets.only(top: 10)),
          Align(
            alignment: Alignment.center,
            child: storeFollowers(
                followers: 1000,
                color: whiteColor,
                decoration: const BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.all(Radius.circular(30)))),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          createPromoPost(),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int pos) {
                        return const Padding(padding: EdgeInsets.only(top: 10));
                      },
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int position) {
                        return singlePromo(context);
                      })))
        ]));
  }

  Widget editProfileButton() {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: blueColor, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(30))),
        child: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: smallTextFontSize, color: blackColor),
        ),
      ),
      onTap: () {
        Get.toNamed(SELLER_EDIT_PROFILE_SCREEN);
      },
    );
  }

  Widget storeLogo(BuildContext context) {
    return ClipOval(
        child: FadeInImage.assetNetwork(
            image: "",
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            placeholder: defaultStoreImage,
            imageErrorBuilder: (context, error, stackTrace) {
              return ClipOval(
                  child: Image.asset(
                defaultStoreImage,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ));
            }));
  }

  Widget createPromoPost() {
    return Align(
        alignment: Alignment.center,
        child: GestureDetector(
          child: Container(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(color: blueColor, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            child: const Text(
              "Create Promo post",
              style: TextStyle(fontSize: smallTextFontSize, color: blackColor),
            ),
          ),
          onTap: () {
            Get.toNamed(CREATE_PROMO_POST_SCREEN);
          },
        ));
  }

  Widget otherOptions() {
    final actions = [
      const PopupMenuItem(
        value: 'Edit',
        child: Text('Edit Profile'),
      ),
      const PopupMenuItem(
        value: 'Share',
        child: Text('Share'),
      ),
      const PopupMenuItem(
        value: 'logout',
        child: Text('Log out'),
      ),
    ];
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert, color: blackColor),
      itemBuilder: (BuildContext context) {
        return actions;
      },
      onSelected: (value) {
        if (value == "Edit") {
          Get.toNamed(SELLER_EDIT_PROFILE_SCREEN);
        }
      },
    );
  }

  Widget singlePromo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(
                  20), // adjust this value as per your needs
              child: FadeInImage.assetNetwork(
                  image: "",
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  fit: BoxFit.cover,
                  placeholder: defaultStoreImage,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(defaultProductImage,
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            fit: BoxFit.cover));
                  })),
          const Padding(padding: EdgeInsets.only(top: 10)),
          const Text("Discount for all accessories",
              style: TextStyle(
                  fontSize: smallTextFontSize, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
