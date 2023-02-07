import 'package:get/state_manager.dart';
import 'package:simplibuy/notification/domain/entities/notification_data.dart';
import 'package:simplibuy/notification/domain/usecases/notifications_usecase.dart';

import '../../../core/state/state.dart';

class NotificationController extends GetxController {
  final NotificationUsecase _usecase;

  NotificationController(this._usecase);
  final RxList<NotificationData> _data = (List<NotificationData>.of([])).obs;
  // ignore: invalid_use_of_protected_member
  List<NotificationData> get data => _data.value;
  final _state = const State().obs;
  State get state => _state.value;

  @override
  void onInit() {
    super.onInit();
    start();
  }

  void start() {
    _getHistoryData();
  }

  _getHistoryData() {
    _state.value = LoadingState();
    _usecase.getNotifications((result) {
      if (result.isLeft) {
        _state.value = ErrorState(errorType: result.left.error);
      } else {
        _data.value = result.right.value;
        _state.value = FinishedState();
      }
    });
  }
}
