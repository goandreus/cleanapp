import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../core/connectivity/domain/services/connectivity_service.dart';
import '../../../../modules/login/domain/entities/logged_user_info.dart';
import '../../../../core/errors/errors.dart';
import '../../../../modules/login/domain/repositories/login_repository.dart';

part 'login_with_google.g.dart';

abstract class LoginWithGoogle {
  Future<Either<Failure, LoggedUserInfo>> call();
}

@Injectable(singleton: false)
class LoginWithGoogleImpl implements LoginWithGoogle {
  final LoginRepository repository;
  final ConnectivityService service;

  LoginWithGoogleImpl(this.repository, this.service);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    var result = await service.isOnline();

    if (result.isLeft()) {
      return result.map((r) => null);
    }

    return await repository.loginGoogle();
  }
}
