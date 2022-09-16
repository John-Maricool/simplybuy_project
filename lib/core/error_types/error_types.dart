abstract class ErrorType {
  String? errMessage;

  ErrorType({this.errMessage});
}

class InternetError implements ErrorType {
  @override
  String? errMessage = "No Internet";
}

class EmptyListError implements ErrorType {
  @override
  String? errMessage = "The list is Empty";
}

class ServerError implements ErrorType {
  @override
  String? errMessage = "Server failure";
  ServerError({this.errMessage});
}

class DefaultError implements ErrorType {
  @override
  String? errMessage = "Server failure";
  DefaultError({this.errMessage});
}
