import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/cart/domain/entities/item_cart_detail.dart';
import 'package:simplibuy/cart/presentation/controllers/cart_list_controller.dart';
import 'package:simplibuy/cart/presentation/screens/custom_widgets.dart';
import 'package:simplibuy/core/error_types/error_types.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/core/state/state.dart';
import '../../../core/constant.dart';
import '../../../core/local_db/cart_dao.dart';

// ignore: must_be_immutable
class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  CartListController controller = Get.find<CartListController>();
  // CartDao dao = Get.find<CartDao>();

  @override
  Widget build(BuildContext context) {
    //addToCart();
    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          title: const Text(
            "Cart",
            style: TextStyle(color: blackColor, fontSize: 18.0),
          ),
          backgroundColor: whiteColor,
        ),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Obx(() {
              if (controller.state == LoadingState()) {
                return defaultLoading(context);
              }
              if (controller.state == ErrorState(errorType: EmptyListError())) {
                return noDataInCart(controller.startShopping());
              }
              return ListView(children: [
                cartList(context),
                const Padding(padding: EdgeInsets.only(top: 10)),
                calculations(context),
                const Padding(padding: EdgeInsets.only(top: 10)),
                defaultButtons(pressed: () {}, text: 'Reserve Item'),
                const Padding(padding: EdgeInsets.only(top: 10)),
                defaultButtons(pressed: () {}, text: 'I want this delivered')
              ]);
            })));
  }

  Widget cartList(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.56,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: controller.cartItems.length,
            itemBuilder: (context, position) {
              return singleCartItem(controller.cartItems[position], () {
                controller.deleteCartItem(position);
              }, () {
                controller.updateNumberOfItemsHigher(position);
              }, () {
                controller.updateNumberOfItemsLower(position);
              });
            }));
  }

  Widget calculations(BuildContext context) {
    return SizedBox(
        height: 120,
        child: Card(
            margin: const EdgeInsets.all(8),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            elevation: 2,
            color: const Color.fromRGBO(237, 232, 255, 1.0),
            child: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    calculationInfo(
                        'Subtotal', '₦${controller.totalPriceInCart}'),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    calculationInfo(
                        'Reserve Charges', '₦${controller.charges}'),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    const Divider(
                      color: Colors.black,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    calculationInfo('Total', '₦${controller.totalPrice}',
                        weight: FontWeight.bold)
                  ],
                ))));
  }

  Widget singleCartItem(ItemCartDetails details, VoidCallback ondelete,
      VoidCallback onadd, VoidCallback onreduce) {
    return Card(
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        elevation: 2,
        color: const Color.fromRGBO(237, 232, 255, 1.0),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 10)),
            cartListSingleItem(details),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                deleteTextButton(ondelete),
                Align(
                  alignment: Alignment.centerRight,
                  child: itemCounter(
                      number: details.itemPieces,
                      onAdded: onadd,
                      onSubtracted: onreduce),
                )
              ],
            )
          ],
        ));
  }

  addToCart() async {
    List<ItemCartDetails> items = [
      ItemCartDetails(
          storeName: "Mummy Kitchen 1",
          storeId: 2,
          itemName: "Bag of Rice and Beans",
          itemPieces: 2,
          itemPrice: 2333),
      ItemCartDetails(
          storeName: "Mummy Kitchen 2",
          storeId: 2,
          itemName: "Bag of Rice and Beans",
          itemPieces: 2,
          itemPrice: 2333),
      ItemCartDetails(
          storeName: "Mummy Kitchen 3",
          storeId: 2,
          itemName: "Bag of Rice and Beans",
          itemPieces: 2,
          itemPrice: 2333),
      ItemCartDetails(
          storeName: "Mummy Kitchen 4",
          storeId: 2,
          itemName: "Bag of Rice and Beans",
          itemPieces: 2,
          itemPrice: 2333),
      ItemCartDetails(
          storeName: "Mummy Kitchen 5",
          storeId: 2,
          itemName: "Bag of Rice and Beans",
          itemPieces: 2,
          itemPrice: 2333),
      ItemCartDetails(
          storeName: "Mummy Kitchen 6",
          storeId: 2,
          itemName: "Bag of Rice and Beans",
          itemPieces: 2,
          itemPrice: 2333),
      ItemCartDetails(
          storeName: "Mummy Kitchen 7",
          storeId: 2,
          itemName: "Bag of Rice and Beans",
          itemPieces: 2,
          itemPrice: 2333),
      ItemCartDetails(
          storeName: "Mummy Kitchen 8",
          storeId: 2,
          itemName: "Bag of Rice and Beans",
          itemPieces: 2,
          itemPrice: 2333),
    ];
    //  items.forEach((item) => dao.addToCart(item));
  }
}
