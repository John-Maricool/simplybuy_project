import 'package:equatable/equatable.dart';

class LoginDetail extends Equatable {
  String email = "";
  String password = "";

  LoginDetail({required String email, required String password}) {
    email = email;
    password = password;
  }

  @override
  List<Object?> get props => [email, password];
}
