import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:simplibuy/buyer_home/presentation/screens/buyer_screen.dart';
import 'package:simplibuy/core/constant.dart';

// ignore: must_be_immutable
class BuyerHome extends StatelessWidget {
  const BuyerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _homeAppBar(text: "Good morning", onPressed: () {}),
        bottomNavigationBar: bottomNavDrawer(),
        drawer: navDrawer(),
        body: BuyerScreen());
  }

  Widget bottomNavDrawer() {
    return BottomNavigationBar(
      items: [
        bottomNavItem(Icons.home, 'Home'),
        bottomNavItem(Icons.shopping_cart, 'Cart'),
        bottomNavItem(Icons.shopping_bag, 'History'),
        bottomNavItem(Icons.person, 'Profile'),
      ],
      unselectedItemColor: Colors.grey,
      backgroundColor: whiteColor,
      selectedItemColor: blueColor,
      onTap: (int) {},
      type: BottomNavigationBarType.fixed,
    );
  }

  PreferredSizeWidget _homeAppBar(
      {required String text, required VoidCallback onPressed}) {
    return AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: blackColor),
        title: Text(
          text,
          style:
              const TextStyle(color: blackColor, fontSize: smallTextFontSize),
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

  Widget navDrawer() {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(bottom: defaultPadding),
        color: lightBlueColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: ListView(padding: EdgeInsets.zero, children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: whiteColor,
                ),
                child: _drawerUserImageAndName(
                    url:
                        "https://firebasestorage.googleapis.com/v0/b/fir-chatapp-f1bff.appspot.com/o/images%2FZhMQ0oPjDWTqSIGItRqm9wQkU452?alt=media&token=b203a1c0-1e97-4b59-835c-f9c1baa7c771",
                    username: "Ikenwa Ebuka"),
              ),
              _titleAndIcon(
                  data: Icons.person, text: "My Account", onClick: () {}),
              _titleAndIcon(
                  data: Icons.history, text: "History", onClick: () {}),
              _titleAndIcon(
                  data: Icons.shopping_cart, text: "Cart", onClick: () {}),
              _titleAndIcon(
                  data: Icons.star_rate_sharp, text: "Rate", onClick: () {}),
              _titleAndIcon(data: Icons.report, text: "Report", onClick: () {}),
            ])),
            _logOut()
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavItem(IconData data, String label) {
    return BottomNavigationBarItem(
      icon: Icon(data),
      label: label,
    );
  }

  Widget _drawerUserImageAndName(
      {required String url, required String username}) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            decoration: const BoxDecoration(color: whiteColor),
            height: 260,
            width: 140,
            child: Align(
              alignment: Alignment.center,
              child: Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image(
                    width: 80,
                    height: 80,
                    image: NetworkImage(url),
                  ),
                ),
                Text(
                  username,
                  style: const TextStyle(
                      color: blackColor, fontSize: smallTextFontSize),
                  textAlign: TextAlign.center,
                )
              ]),
            )));
  }

  Widget _titleAndIcon(
      {required IconData data,
      required String text,
      required VoidCallback onClick}) {
    return ListTile(
      leading: Icon(data, color: blueColor),
      title: Text(
        text,
        style: const TextStyle(
            color: blackColor,
            fontSize: smallTextFontSize,
            fontWeight: FontWeight.bold),
      ),
      onTap: onClick,
    );
  }

  Widget _logOut() {
    return Container(
        width: 140,
        decoration: const BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        padding: const EdgeInsets.all(20.0),
        child: Row(children: [
          const Icon(Icons.logout, color: blackColor),
          const Padding(padding: EdgeInsets.only(left: 5.0)),
          RichText(
              text: TextSpan(
                  text: "LogOut",
                  style: const TextStyle(
                      color: blueColor,
                      fontSize: smallTextFontSize,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()..onTap = () {}))
        ]));
  }
}
