import 'package:dartz/dartz.dart';
import '../../../errors/errors.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
