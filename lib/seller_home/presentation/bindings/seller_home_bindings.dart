import 'package:get/get.dart';
import 'package:simplibuy/seller_home/presentation/controllers/seller_home_nav_controller.dart';

class SellerHomeBindings implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<SellerHomeNavigationController>(
        () => SellerHomeNavigationController());
  }
}
