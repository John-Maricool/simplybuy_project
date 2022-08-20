import 'package:equatable/equatable.dart';

class SignupDetail extends Equatable {
  String email = "";
  String password = "";
  String name = "";

  SignupDetail(
      {required String email, required String password, required String name}) {
    email = email;
    password = password;
    name = name;
  }

  @override
  List<Object?> get props => [email, password];
}
