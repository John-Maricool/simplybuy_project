import 'package:get/get.dart';
import 'package:simplibuy/buyer_home/domain/repositories/stores_and_malls_list_repository.dart';
import 'package:simplibuy/buyer_home/domain/usecases/stores_and_malls_usecase.dart';
import 'package:simplibuy/buyer_home/presentation/controller/stores_and_malls_controller.dart';
import 'package:simplibuy/core/network/network_info.dart';

import '../../data/repositories/stores_and_malls_repository_impl.dart';
import '../controller/buyer_home_navigation_controller.dart';

class StoresAndMallsBinding implements Bindings {
  @override
  void dependencies() {
    NetworkInfoImpl info = Get.find();
    StoresAndMallsRepository repository =
        Get.put(StoresAndMallsRepositoryImpl(info));
    StoresAndMallsUsecase usecase =
        Get.put(StoresAndMallsUsecase(repository: repository));
    Get.put<StoresAndMallsController>(
        StoresAndMallsController(usecase: usecase));
    Get.lazyPut<BuyerHomeNavigationController>(
        () => BuyerHomeNavigationController());
  }
}
