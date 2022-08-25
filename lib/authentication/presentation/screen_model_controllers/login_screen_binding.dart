import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:simplibuy/authentication/data/repositories/login_repository_impl.dart';
import 'package:simplibuy/authentication/domain/repositories/auth_repository.dart';
import 'package:simplibuy/authentication/domain/usecases/login_usecase.dart';
import 'package:simplibuy/authentication/presentation/screen_model_controllers/login_screen_controller.dart';
import 'package:simplibuy/authentication/presentation/screen_model_controllers/login_screen_rx.dart';
import 'package:simplibuy/core/network/network_info.dart';

class LoginScreenBinding implements Bindings {
  @override
  void dependencies() {
    NetworkInfoImpl info = Get.find();
    AuthRepository repository = Get.put(LoginRepositoryImpl(networkInfo: info));
    LoginUsecase usecase = Get.put(LoginUsecase(repository));
    LoginScreenRx rx = Get.put<LoginScreenRx>(LoginScreenRx());
    Get.put<LoginScreenController>(LoginScreenController(usecase, rx));
  }
}
