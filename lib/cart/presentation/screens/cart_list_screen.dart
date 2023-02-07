import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/cart/domain/entities/item_cart_detail.dart';
import 'package:simplibuy/cart/presentation/controllers/cart_list_controller.dart';
import 'package:simplibuy/cart/presentation/screens/custom_widgets.dart';
import 'package:simplibuy/core/error_types/error_types.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/core/state/state.dart';
import '../../../buyer_home/presentation/controller/buyer_home_navigation_controller.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/local_db/cart_dao.dart';

// ignore: must_be_immutable
class CartList extends StatelessWidget {
  CartList({Key? key}) : super(key: key);

  BuyerHomeNavigationController navController =
      Get.find<BuyerHomeNavigationController>();

  CartListController controller = Get.find<CartListController>();

  @override
  Widget build(BuildContext context) {
    controller.getAllItemsInCart();
    return Scaffold(
        appBar: customAppBar(
            text: "Cart",
            onPressed: () {
              navController.changePage(0);
            }),
        body: Container(
            padding: const EdgeInsets.all(10),
            child: Obx(() {
              if (controller.state is LoadingState) {
                return defaultLoading(context);
              }
              if (controller.state == ErrorState(errorType: EmptyListError())) {
                return noDataInCart(() => controller.startShopping());
              } else {
                return ListView(children: [
                  cartList(context),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Obx(() {
                    return controller.cartItems.isEmpty
                        ? Container()
                        : calculations(context);
                  }),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Obx(() {
                    return controller.cartItems.isEmpty
                        ? Container()
                        : defaultButtons(
                            pressed: () {
                              Get.toNamed(RESERVE_SCREEN);
                            },
                            text: 'Reserve Item');
                  }),
                ]);
              }
            })));
  }

  Widget cartList(BuildContext context) {
    return Obx(() => SizedBox(
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
            })));
  }

  Widget calculations(BuildContext context) {
    return Obx(() => SizedBox(
        height: 120,
        child: Card(
            margin: const EdgeInsets.all(8),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            elevation: 2,
            color: Colors.white,
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
                )))));
  }

  Widget singleCartItem(ItemCartDetails details, VoidCallback ondelete,
      VoidCallback onadd, VoidCallback onreduce) {
    return Card(
        margin: const EdgeInsets.all(5),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        elevation: 2,
        color: Colors.white,
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
}
