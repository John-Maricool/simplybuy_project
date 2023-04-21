import 'package:equatable/equatable.dart';

import '../error_types/error_types.dart';

// ignore: must_be_immutable
class Failure extends Equatable {
  ErrorType error = DefaultError();
  String message = "";
  Failure({required this.error});
  Failure.withMessage({required this.error, required this.message});

  @override
  List<Object> get props => [error];
}
