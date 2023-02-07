import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:simplibuy/notification/domain/repositories/notifications_repo.dart';
import 'package:simplibuy/notification/domain/usecases/notifications_usecase.dart';
import 'package:simplibuy/notification/presentation/controller/notification_controller.dart';

import '../../../core/network/network_info.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    NetworkInfoImpl info = Get.find();

    Get.lazyPut<NotificationRepo>(() => NotificationRepoImpl(info));
    Get.lazyPut(() => NotificationUsecase(Get.find<NotificationRepo>()));
    Get.lazyPut(() => NotificationController(Get.find<NotificationUsecase>()));
  }
}
