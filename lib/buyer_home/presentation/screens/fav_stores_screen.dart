import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/presentation/controller/fav_screen_controller.dart';
import 'package:simplibuy/buyer_home/presentation/screens/custom_widgets.dart';
import 'package:simplibuy/core/error_types/error_types.dart';
import 'package:simplibuy/core/state/state.dart';

import '../../../core/constant.dart';
import '../../../core/constants/route_constants.dart';
import '../../../core/reusable_widgets/reusable_widgets.dart';
import '../controller/buyer_home_navigation_controller.dart';

// ignore: must_be_immutable
class FavStoresScreen extends StatelessWidget {
  FavStoresScreen({Key? key}) : super(key: key);

  FavScreenController controller = Get.find<FavScreenController>();

  BuyerHomeNavigationController navController =
      Get.find<BuyerHomeNavigationController>();

  @override
  Widget build(BuildContext context) {
    controller.getFavorites();
    return Scaffold(
        appBar: customAppBar(
          text: "My Favorites",
          onPressed: () => navController.changePage(0),
        ),
        body: Obx((() {
          if (controller.state == ErrorState(errorType: EmptyListError())) {
            return showEmptyFavorites(context);
          }
          return Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: defaultPadding)),
                Expanded(child: favList())
              ],
            ),
          );
        })));
  }

  Widget favList() {
    return ListView.builder(
        itemCount: controller.details.length,
        itemBuilder: (context, position) {
          /* var item = controller.details[position].id;*/
          return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                controller.removeFromFav(position);
                ScaffoldMessenger.of(context).showSnackBar(snackRemoved);
              },
              background: Container(color: Colors.red),
              child: storesListSingleItem(
                  onFavClicked: null,
                  details: controller.details[position],
                  onClick: () => Get.toNamed(SINGLE_STORE_ROUTE,
                      arguments: controller.details[position].id)));
        });
  }
}
