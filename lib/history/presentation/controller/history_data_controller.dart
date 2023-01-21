import 'package:get/state_manager.dart';
import 'package:simplibuy/history/domain/entities/history_data.dart';
import 'package:simplibuy/history/domain/usecases/history_data_usecase.dart';

import '../../../core/state/state.dart';

class HistoryDataController extends GetxController {
  final HistoryDataUsecase _usecase;

  HistoryDataController(this._usecase);
  final RxList<HistoryData> _data = (List<HistoryData>.of([])).obs;
  // ignore: invalid_use_of_protected_member
  List<HistoryData> get data => _data.value;
  final _state = const State().obs;
  State get state => _state.value;

  void start() {
    _getHistoryData();
  }

  _getHistoryData() {
    _state.value = LoadingState();
    _usecase.getHistoryData((result) {
      if (result.isLeft) {
        _state.value = ErrorState(errorType: result.left.error);
      } else {
        _data.value = result.right.value;
        _state.value = FinishedState();
      }
    });
  }
}
