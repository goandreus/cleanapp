import 'dart:async';

import '../../../../modules/login/infra/models/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> loginGoogle();
  Future<UserModel> currentUser();
  Future<void> logout();
}
