import 'package:dartz/dartz.dart';
import '../../../../modules/login/domain/entities/logged_user_info.dart';
import '../../../../core/errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> loginGoogle();

  Future<Either<Failure, LoggedUserInfo>> loggedUser();

  Future<Either<Failure, Unit>> logout();
}
