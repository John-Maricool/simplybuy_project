import 'package:get/get.dart';
import 'package:simplibuy/authentication/data/repositories/signup_repository_impl.dart';
import 'package:simplibuy/authentication/domain/usecases/signup_usecase.dart';
import 'package:simplibuy/authentication/presentation/screen_model_controllers/signup_screen_controller.dart';
import 'package:simplibuy/core/network/network_info.dart';

class SignupScreenBinding implements Bindings {
  @override
  void dependencies() {
    NetworkInfoImpl info = Get.find();
    SignupRepositoryImpl repository =
        Get.put(SignupRepositoryImpl(networkInfo: info));
    SignupUsecase usecase = Get.put(SignupUsecase(repository));
    Get.put<SignupScreenController>(SignupScreenController(usecase));
  }
}
