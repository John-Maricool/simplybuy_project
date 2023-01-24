import 'package:get/get.dart';
import 'package:simplibuy/to_buy_list/presentation/controllers/to_buy_controller.dart';

import '../../../core/local_db/to_buy_dao.dart';
import '../../domain/repository/to_buy_repository.dart';
import '../../domain/usecases/to_buy_usecase.dart';

class ToBuyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToBuyRepository>(
        () => ToBuyRepositoryImpl(dao: Get.find<ToBuyModelDao>()));
    Get.lazyPut<ToBuyUsecase>(
        () => ToBuyUsecaseImpl(repo: Get.find<ToBuyRepository>()));
    Get.lazyPut<ToBuyController>(
        () => ToBuyController(Get.find<ToBuyUsecase>()));
  }
}
