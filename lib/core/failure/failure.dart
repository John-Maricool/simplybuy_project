import 'package:equatable/equatable.dart';

import '../error_types/error_types.dart';

// ignore: must_be_immutable
class Failure extends Equatable {
  ErrorType error = DefaultError();
  Failure({required this.error});

  @override
  List<Object> get props => [error];
}
