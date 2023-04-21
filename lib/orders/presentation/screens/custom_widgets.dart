import 'package:flutter/material.dart';
import 'package:simplibuy/core/constant.dart';
import 'package:simplibuy/core/reusable_widgets/reusable_widgets.dart';
import 'package:simplibuy/orders/data/models/accepted_orders.dart';
import 'package:simplibuy/orders/data/models/incoming_orders.dart';

Widget singleIncomingOrder(
    BuildContext context, IncomingOrder order, VoidCallback onOrderClicked) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: whiteColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 3.0,
          offset: const Offset(0, 2),
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: FadeInImage.assetNetwork(
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    placeholder: 'assets/gifs/simpliby_loading.gif',
                    imageErrorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.account_circle,
                        size: 35,
                      );
                    },
                    image: order.image)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  order.name,
                  style: const TextStyle(
                      color: blackColor,
                      fontSize: smallTextFontSize,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Item ID: ${order.itemId}",
                  style: const TextStyle(
                      color: blackColor,
                      fontSize: smallTextFontSize,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "Time: ${order.time}",
                  style: const TextStyle(
                      color: blackColor,
                      fontSize: smallTextFontSize,
                      fontWeight: FontWeight.normal),
                )
              ],
            )
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        defaultButtons(
            pressed: onOrderClicked,
            text: "View Details",
            size: const Size(230, 40))
      ],
    ),
  );
}

Widget singleAcceptedOrder(
    BuildContext context, AcceptedOrders order, VoidCallback onOrderClicked) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: whiteColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 3.0,
          offset: const Offset(0, 2),
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: FadeInImage.assetNetwork(
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    placeholder: 'assets/gifs/simpliby_loading.gif',
                    imageErrorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.account_circle,
                        size: 45,
                      );
                    },
                    image: order.image)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  order.name,
                  style: const TextStyle(
                      color: blackColor,
                      fontSize: smallTextFontSize,
                      fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.only(top: 6)),
                Text(
                  "Ticket ID: ${order.ticketId}",
                  style: const TextStyle(
                      color: blackColor,
                      fontSize: smallTextFontSize,
                      fontWeight: FontWeight.normal),
                ),
                const Padding(padding: EdgeInsets.only(top: 6)),
                Text(
                  "Status: ${order.status}",
                  style: const TextStyle(
                      color: blackColor,
                      fontSize: smallTextFontSize,
                      fontWeight: FontWeight.normal),
                )
              ],
            )
          ],
        ),
        const Padding(padding: EdgeInsets.only(top: 10)),
        defaultButtons(
            pressed: onOrderClicked, text: "Cancel", size: const Size(100, 30))
      ],
    ),
  );
}

Widget emptyOrder() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/no_network.png'),
      const Padding(padding: EdgeInsets.only(top: 10)),
      const Text(
        'You do not have ny order, your first order will appear here.',
        style: TextStyle(color: blackColor, fontSize: 15),
      ),
    ],
  );
}
