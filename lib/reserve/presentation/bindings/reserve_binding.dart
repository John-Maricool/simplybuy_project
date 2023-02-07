import 'package:get/get.dart';
import 'package:simplibuy/reserve/presentation/controllers/reserve_controller.dart';

class ReserveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReserveController());
  }
}
