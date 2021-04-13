import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/errors/errors.dart';
import '../../../../core/errors/messages.dart';
import '../../../../modules/login/domain/entities/logged_user_info.dart';
import '../../../../modules/login/domain/errors/errors.dart';
import '../../../../modules/login/domain/repositories/login_repository.dart';
import '../../../../modules/login/infra/datasources/login_datasource.dart';

part 'login_repository_impl.g.dart';

@Injectable(singleton: false)
class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loginGoogle() async {
    try {
      var user = await dataSource.loginGoogle();
      return Right(user);
    } catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try {
      var user = await dataSource.currentUser();
      return Right(user);
    } catch (e) {
      return Left(
          ErrorGetLoggedUser(message: Messages.FAILED_TO_RECOVER_USER_LOGGED));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await dataSource.logout();
      return Right(unit);
    } catch (e) {
      return Left(ErrorLogout(message: Messages.FAILED_TO_LOGOUT));
    }
  }
}
