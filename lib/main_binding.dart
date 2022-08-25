import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:simplibuy/core/network/network_info.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkInfoImpl(InternetConnectionChecker()));
  }
}
