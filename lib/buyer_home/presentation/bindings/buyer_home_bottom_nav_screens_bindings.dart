import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/data/repositories/favorite_stores_repo_impl.dart';
import 'package:simplibuy/buyer_home/domain/repositories/favorite_stores_repository.dart';
import 'package:simplibuy/buyer_home/domain/repositories/stores_and_malls_list_repository.dart';
import 'package:simplibuy/buyer_home/domain/usecases/stores_and_malls_fav_usecase.dart';
import 'package:simplibuy/buyer_home/domain/usecases/stores_and_malls_usecase.dart';
import 'package:simplibuy/buyer_home/presentation/controller/fav_screen_controller.dart';
import 'package:simplibuy/buyer_home/presentation/controller/stores_and_malls_controller.dart';
import 'package:simplibuy/core/local_db/cart_dao.dart';
import 'package:simplibuy/core/local_db/fav_stores_dao.dart';
import 'package:simplibuy/core/network/network_info.dart';
import 'package:simplibuy/history/data/repositories/history_data_impl.dart';
import 'package:simplibuy/history/domain/repositories/history_data_repo.dart';
import 'package:simplibuy/history/domain/usecases/history_data_usecase.dart';
import 'package:simplibuy/history/presentation/controller/history_data_controller.dart';

import '../../../cart/data/repository/cart_list_repository_impl.dart';
import '../../../cart/domain/repository/cart_list_repository.dart';
import '../../../cart/domain/usecases/cart_list_usecase.dart';
import '../../../cart/presentation/controllers/cart_list_controller.dart';
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
    _getFavStoresControllers();
    _getHistoryController(info);
  }

  _getStoresAndMallsController(NetworkInfo info) {
    Get.lazyPut<FavStoresAndMallsRepository>(
        () => FavStoresRepoImpl(dao: Get.find<FavStoresDao>()));
    Get.lazyPut<StoresAndMallsFavUsecase>(() =>
        StoresAndMallsFavUsecase(Get.find<FavStoresAndMallsRepository>()));
    Get.lazyPut<StoresAndMallsRepository>(
        () => StoresAndMallsRepositoryImpl(info));
    Get.lazyPut<StoresAndMallsUsecase>(() => StoresAndMallsUsecase(
        repository: Get.find<StoresAndMallsRepository>()));
    Get.lazyPut<StoresAndMallsController>(() => StoresAndMallsController(
        usecase: Get.find<StoresAndMallsUsecase>(),
        usecaseFav: Get.find<StoresAndMallsFavUsecase>()));
  }

  _getCartListControllers() {
    Get.lazyPut<CartListRepository>(
        () => CartListRepositoryImpl(dao: Get.find<CartDao>()));
    Get.lazyPut(
        () => CartListUsecase(repository: Get.find<CartListRepository>()));
    Get.lazyPut<CartListController>(
        () => CartListController(usecase: Get.find<CartListUsecase>()));
  }

  _getFavStoresControllers() {
    Get.lazyPut(() =>
        StoresAndMallsFavUsecase(Get.find<FavStoresAndMallsRepository>()));
    Get.lazyPut<FavScreenController>(() =>
        FavScreenController(usecase: Get.find<StoresAndMallsFavUsecase>()));
  }

  _getHistoryController(NetworkInfo info) {
    Get.lazyPut<HistoryDataRepo>(() => HistoryDataImpl(info));
    Get.lazyPut(() => HistoryDataUsecase(Get.find<HistoryDataRepo>()));
    Get.lazyPut(() => HistoryDataController(Get.find<HistoryDataUsecase>()));
  }
}
