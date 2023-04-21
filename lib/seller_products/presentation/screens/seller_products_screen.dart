import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';

class SellerProductsScreens extends StatelessWidget {
  SellerProductsScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          text: "Products",
          onPressed: () {
            Get.back();
          },
          actions: [
            PopupMenuButton<String>(
                icon: const Icon(Icons.add_box_outlined, color: blackColor),
                itemBuilder: (BuildContext context) {
                  return actions;
                })
          ]),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Food",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 29,
                      fontWeight: FontWeight.bold),
                )),
            const Padding(padding: EdgeInsets.only(top: defaultPadding)),
            Flexible(
                child: GridView.count(
                    crossAxisCount: 2,
                    physics: const ScrollPhysics(),
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 6.0,
                    shrinkWrap: true,
                    children: List.generate(
                        20,
                        (index) =>
                            Center(child: showItemsGrid(context, () {})))))
          ],
        ),
      ),
    );
  }

  final actions = [
    const PopupMenuItem(
      value: 'Add',
      child: Text('Add new Product'),
    ),
    const PopupMenuItem(
      value: 'Delete',
      child: Text('Delete Categosry'),
    ),
  ];

  final delete_action = [
    const PopupMenuItem(
      value: 'Delete',
      child: Text('Delete Product'),
    ),
  ];

  Widget showItemsGrid(BuildContext context, VoidCallback onClick) {
    return GestureDetector(
        onTap: () {
          onClick();
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: FadeInImage.assetNetwork(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 90,
                          fit: BoxFit.fill,
                          placeholder: 'assets/images/buy.png',
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/buy.png',
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: 90,
                            );
                          },
                          image: "")),
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        constraints: const BoxConstraints(
                          maxWidth: 80,
                        ),
                        child: const Text(
                          'Fried rice and Chicken',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        )),
                    GestureDetector(
                      child: PopupMenuButton(
                          padding: const EdgeInsets.all(1),
                          itemBuilder: (BuildContext context) {
                            return delete_action;
                          }),
                    )
                  ],
                ))
              ]),
        ));
  }
}
