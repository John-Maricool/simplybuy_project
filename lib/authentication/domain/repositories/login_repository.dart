import 'package:simplibuy/authentication/domain/entities/login_details.dart';

abstract class LoginRepository {
  sendLoginDetails(LoginDetail detail);
}
