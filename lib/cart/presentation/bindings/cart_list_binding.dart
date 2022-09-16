import 'package:get/get.dart';
import 'package:simplibuy/cart/domain/usecases/cart_list_usecase.dart';
import 'package:simplibuy/cart/presentation/controllers/cart_list_controller.dart';
import 'package:simplibuy/core/local_db/app_database.dart';

import '../../data/repository/cart_list_repository_impl.dart';
import '../../domain/repository/cart_list_repository.dart';

class CartListBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    AppDatabase db = await Get.find<Future<AppDatabase>>();
    Get.lazyPut<CartListRepository>(
        () => CartListRepositoryImpl(dao: db.cartDao));
    Get.lazyPut(
        () => CartListUsecase(repository: Get.find<CartListRepositoryImpl>()));
    Get.lazyPut(() => CartListController(usecase: Get.find<CartListUsecase>()));
  }
}
