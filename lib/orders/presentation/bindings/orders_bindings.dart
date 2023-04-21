import 'package:get/instance_manager.dart';
import 'package:simplibuy/core/network/network_info.dart';
import 'package:simplibuy/orders/domain/repositories/orders_repository.dart';
import 'package:simplibuy/orders/domain/usecases/orders_usecase.dart';
import 'package:simplibuy/orders/presentation/controllers/orders_controllers.dart';

class OrdersBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersRepository>(
        () => OrdersRepositoryImpl(Get.find<NetworkInfoImpl>()));
    Get.lazyPut(() => OrdersUsecase(Get.find<OrdersRepository>()));
    Get.lazyPut(() => OrdersController(usecase: Get.find<OrdersUsecase>()));
  }
}
