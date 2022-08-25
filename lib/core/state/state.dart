import 'package:equatable/equatable.dart';

class State<T> extends Equatable {
  const State();

  @override
  List<Object> get props => [];
}

class LoadingState extends State {}

class FinishedState extends State {}

class ErrorState extends State {
  final String errorMessage;

  const ErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
