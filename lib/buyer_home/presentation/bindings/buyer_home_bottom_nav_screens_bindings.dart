import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/domain/repositories/stores_and_malls_list_repository.dart';
import 'package:simplibuy/buyer_home/domain/usecases/stores_and_malls_usecase.dart';
import 'package:simplibuy/buyer_home/presentation/controller/stores_and_malls_controller.dart';
import 'package:simplibuy/cart/presentation/bindings/cart_list_binding.dart';
import 'package:simplibuy/core/local_db/cart_dao.dart';
import 'package:simplibuy/core/network/network_info.dart';

import '../../../cart/data/repository/cart_list_repository_impl.dart';
import '../../../cart/domain/repository/cart_list_repository.dart';
import '../../../cart/domain/usecases/cart_list_usecase.dart';
import '../../../cart/presentation/controllers/cart_list_controller.dart';
import '../../../core/local_db/app_database.dart';
import '../../data/repositories/stores_and_malls_repository_impl.dart';
import '../controller/buyer_home_navigation_controller.dart';

class BuyerHomeBottomNavScreensBindings implements Bindings {
  @override
  Future<void> dependencies() async {
    Get.lazyPut<BuyerHomeNavigationController>(
        () => BuyerHomeNavigationController());
    NetworkInfoImpl info = Get.find();
    _getStoresAndMallsController(info);
    _getCartListControllers();
  }

  _getStoresAndMallsController(NetworkInfo info) {
    Get.lazyPut<StoresAndMallsRepository>(
        () => StoresAndMallsRepositoryImpl(info));
    Get.lazyPut<StoresAndMallsUsecase>(() => StoresAndMallsUsecase(
        repository: Get.find<StoresAndMallsRepository>()));
    Get.lazyPut<StoresAndMallsController>(() =>
        StoresAndMallsController(usecase: Get.find<StoresAndMallsUsecase>()));
  }

  _getCartListControllers() {
    Get.lazyPut<CartListRepository>(
        () => CartListRepositoryImpl(dao: Get.find<CartDao>()));
    Get.lazyPut(
        () => CartListUsecase(repository: Get.find<CartListRepository>()));
    Get.lazyPut<CartListController>(
        () => CartListController(usecase: Get.find<CartListUsecase>()));
  }
}
