import '../../../../core/errors/errors.dart';

class ErrorLoginGoogle extends Failure {
  final String message;
  ErrorLoginGoogle({this.message});
}

class ErrorGetLoggedUser extends Failure {
  final String message;
  ErrorGetLoggedUser({this.message});
}

class ErrorCancelledByUser extends Failure {
  final String message;
  ErrorCancelledByUser({this.message});
}

class ErrorLogout extends Failure {
  final String message;
  ErrorLogout({this.message});
}
