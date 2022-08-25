import 'package:get/state_manager.dart';
import 'package:simplibuy/authentication/domain/entities/login_details.dart';
import 'package:simplibuy/authentication/domain/usecases/login_usecase.dart';
import 'package:simplibuy/authentication/presentation/screen_model_controllers/login_screen_rx.dart';
import '../../../core/state/state.dart';

class LoginScreenController extends GetxController {
  final LoginUsecase _usecase;
  final LoginScreenRx _loginScreenRx;
  final _state = State().obs;
  State get state => _state.value;

  LoginScreenController(this._usecase, this._loginScreenRx);

  Stream<String> getEmailStream() {
    return _loginScreenRx.getEmailStream();
  }

  Function(String) get changeEmail => _loginScreenRx.changeEmail;
  Function(String) get changePassword => _loginScreenRx.changePassword;

  Stream<String> getPasswordStream() {
    return _loginScreenRx.getPasswordStream();
  }

  Stream<bool> submitValid() {
    return _loginScreenRx.submitValid();
  }

  Future<void> loginInUser() async {
    _state.value = LoadingState();
    final result = await _usecase.sendAuthDetails(LoginDetail(
        email: _loginScreenRx.giveEmail(),
        password: _loginScreenRx.givePassword()));
    if (result.isLeft) {
      _state.value = const ErrorState(errorMessage: "Error");
    } else {
      _state.value = FinishedState();
    }
  }
}
