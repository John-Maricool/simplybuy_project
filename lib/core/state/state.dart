import 'package:equatable/equatable.dart';

import '../error_types/error_types.dart';

class State<T> extends Equatable {
  const State();

  @override
  List<Object> get props => [this];
}

class LoadingState extends State implements Equatable {
  @override
  List<Object> get props => [this];

  @override
  bool? get stringify => true;
}

class FinishedState extends State implements Equatable {
  @override
  List<Object> get props => [this];

  @override
  bool? get stringify => true;
}

class ErrorState extends State implements Equatable {
  final ErrorType errorType;

  const ErrorState({required this.errorType});

  @override
  List<Object> get props => [errorType];

  @override
  bool? get stringify => true;
}
