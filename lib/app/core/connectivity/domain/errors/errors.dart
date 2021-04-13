import '../../../errors/errors.dart';

class ErrorConnection extends Failure {
  final String message;

  ErrorConnection({this.message});
}
