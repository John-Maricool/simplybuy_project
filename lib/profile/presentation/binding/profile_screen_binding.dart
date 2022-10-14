import 'package:get/get.dart';

import '../../../core/network/network_info.dart';
import '../../data/repository/profile_repository_impl.dart';
import '../../domain/repository/profile_repository.dart';
import '../../domain/usecases/profile_usecase.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenBinding implements Bindings {
  @override
  void dependencies() {
    NetworkInfoImpl info = Get.find();
    Get.lazyPut<ProfileRepository>(() => ProfileRepositoryImpl(info));
    Get.lazyPut<ProfileUsecase>(
        () => ProfileUsecase(Get.find<ProfileRepository>()));
    Get.lazyPut(() => ProfileScreenController(Get.find<ProfileUsecase>()));
  }
}
