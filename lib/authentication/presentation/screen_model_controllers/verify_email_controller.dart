import 'package:get/get.dart';
import 'package:simplibuy/authentication/domain/usecases/verify_email_usecase.dart';
import 'package:simplibuy/core/prefs/shared_prefs.dart';
import '../../../core/state/state.dart';

class VerifyEmailController extends GetxController {
  final VerifyEmailUsecase _usecase;

  final _state = const State().obs;
  String _code = "";

  State get state => _state.value;

  VerifyEmailController(this._usecase);

  Future<void> verifyEmail(String email) async {
    if (_validateCode()) {
      _state.value = LoadingState();
      await SharedPrefs.initializeSharedPrefs();
      final uid = SharedPrefs.userId();

      final result = await _usecase.verifyEmail(uid, _code);
      if (result.isLeft) {
        final err = ErrorState(errorType: result.left.error);
        err.setErrorMessage(result.left.message);
        _state.value = err;
      } else {
        _state.value = FinishedState();
      }
    }
  }

  addCode(String code) {
    _code = code;
  }

  bool _validateCode() {
    if (_code.length < 4) {
      return false;
    } else {
      return true;
    }
  }
}
