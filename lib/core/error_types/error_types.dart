import 'package:equatable/equatable.dart';

abstract class ErrorType extends Equatable {
  String errMessage = "Error";

  ErrorType();
  @override
  List<Object> get props => [this];
}

// ignore: must_be_immutable
class InternetError extends ErrorType implements Equatable {
  @override
  String get errMessage => "No Internet";
  @override
  List<Object> get props => [errMessage];

  @override
  bool? get stringify => true;
}

class EmptyListError extends ErrorType implements Equatable {
  @override
  List<Object> get props => [errMessage];

  @override
  bool? get stringify => true;
}

class ServerError extends ErrorType implements Equatable {
  @override
  List<Object> get props => [this];

  @override
  bool? get stringify => true;
}

class DefaultError extends ErrorType implements Equatable {
  @override
  List<Object> get props => [this];

  @override
  bool? get stringify => true;
}
