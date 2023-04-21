import 'package:get/get.dart';
import 'package:simplibuy/authentication/data/datasources/registration_datasource.dart';
import 'package:simplibuy/authentication/data/repositories/verify_email_repository_impl.dart';
import 'package:simplibuy/authentication/domain/usecases/verify_email_usecase.dart';
import 'package:simplibuy/authentication/presentation/screen_model_controllers/verify_email_controller.dart';
import 'package:simplibuy/core/network/network_info.dart';

class VerifyEmailBinding implements Bindings {
  @override
  void dependencies() {
    NetworkInfoImpl info = Get.find();
    RegistrationDataSource dataSource = Get.put(RegistrationDataSource());
    VerifyEmailRepoImpl repository =
        Get.put(VerifyEmailRepoImpl(networkInfo: info, dataSource: dataSource));
    VerifyEmailUsecase usecase = Get.put(VerifyEmailUsecase(repository));
    Get.put<VerifyEmailController>(VerifyEmailController(usecase));
  }
}
