import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simplibuy/core/constant.dart';

import '../core/constants/route_constants.dart';
import '../core/reusable_widgets/reusable_widgets.dart';

class UserFirstTime extends StatefulWidget {
  const UserFirstTime({Key? key}) : super(key: key);

  @override
  _SwipeableWidgetExampleState createState() => _SwipeableWidgetExampleState();
}

class _SwipeableWidgetExampleState extends State<UserFirstTime> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  num _pageOffset = 0;
  String initialText = "Next";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding:
                const EdgeInsets.only(right: 20, top: 40, bottom: 60, left: 20),
            color: whiteColor,
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        Get.offNamed(USER_TYPE);
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(
                            color: blueColor, fontSize: smallTextFontSize),
                        textAlign: TextAlign.end,
                      )),
                ),
                const Padding(padding: EdgeInsets.only(top: defaultPadding)),
                Expanded(
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                        if (_currentPage == 2) {
                          initialText = "Get Started";
                        } else {
                          initialText = "Next";
                        }
                      });
                    },
                    controller: _pageController
                      ..addListener(() {
                        setState(() {
                          _pageOffset = (_pageController.page ??
                                  _pageController.initialPage) -
                              _currentPage;
                        });
                      }),
                    children: <Widget>[
                      Column(children: [
                        imageFromAssetsFolder(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.5,
                            path:
                                'assets/on_boarding/discover_malls_around_you.png',
                            padding: 0),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        const Text(
                          "Discover malls around you",
                          style: TextStyle(color: blueColor, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 15)),
                        const Text(
                          "Login to discover various stores and malls near your vicinity and make your choice",
                          style: TextStyle(color: blackColor, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                      Column(children: [
                        imageFromAssetsFolder(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.5,
                            path:
                                'assets/on_boarding/view_items_and_shelve_details.png',
                            padding: 0),
                        const Text(
                          "View items and shelve details",
                          style: TextStyle(
                              color: blueColor,
                              overflow: TextOverflow.fade,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        const Text(
                          "Now you don't need stressing yourself searching for your favorite item in a mall when you can easily find it here",
                          style: TextStyle(color: blackColor, fontSize: 15),
                          textAlign: TextAlign.center,
                        )
                      ]),
                      Column(children: [
                        imageFromAssetsFolder(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.5,
                            path: 'assets/on_boarding/reserve_and_pay.png',
                            padding: 0),
                        const Text(
                          "Reserve and pay for your selected item",
                          style: TextStyle(
                              color: blueColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
                        const Text(
                          "Pay for the reserved item and go and pick them up at your convinent time",
                          style: TextStyle(color: blackColor, fontSize: 15),
                          textAlign: TextAlign.center,
                        )
                      ]),
                    ],
                  ),
                ),
                Container(
                    height: 40,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? blueColor
                                  : _pageOffset > index && _pageOffset < index
                                      ? blueColor
                                      : Colors.grey.withOpacity(0.7),
                            ),
                          );
                        }))),
                defaultButtons(
                    pressed: () {
                      if (_currentPage == 2) {
                        Get.offAllNamed(USER_TYPE);
                      } else {
                        if (_currentPage == 1) {
                          setState(() {
                            initialText = "Get Started";
                          });
                        }
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      }
                    },
                    text: initialText)
              ],
            )));
  }
}
