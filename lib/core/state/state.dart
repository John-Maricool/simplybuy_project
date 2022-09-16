import 'package:equatable/equatable.dart';

import '../error_types/error_types.dart';

class State<T> extends Equatable {
  const State();

  @override
  List<Object> get props => [];
}

class LoadingState extends State {}

class FinishedState extends State {}

class ErrorState extends State {
  final ErrorType errorType;

  const ErrorState({required this.errorType});

  @override
  List<Object> get props => [errorType];
}
