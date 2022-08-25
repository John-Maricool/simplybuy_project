import 'package:rxdart/rxdart.dart';
import 'package:simplibuy/core/validators/validators_string.dart';

class LoginScreenRx with ValidatorMixin {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  //change data
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  String giveEmail() {
    return _email.value;
  }

  Stream<String> getEmailStream() {
    return _email.stream.transform(validateEmail);
  }

  Stream<String> getPasswordStream() {
    return _password.stream.transform(validatePassword);
  }

  Stream<bool> submitValid() {
    return Rx.combineLatest2(
        getEmailStream(), getPasswordStream(), (e, p) => true);
  }

  String givePassword() {
    return _password.value;
  }

  dispose() {
    _email.close();
    _password.close();
  }
}
