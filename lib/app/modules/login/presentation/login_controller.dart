import 'package:asuka/asuka.dart' as asuka;
import 'package:cleanapp/app/core/stores/auth_store.dart';
import 'package:cleanapp/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:cleanapp/app/modules/utils/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithGoogle loginWithGoogle;
  final AuthStore authStore;
  final LoadingDialog loading;

  _LoginControllerBase(this.loginWithGoogle, this.authStore, this.loading);

  enterLoginGoogle() async {
    loading.show();
    await Future.delayed(Duration(milliseconds: 500));
    var result = await loginWithGoogle();
    await loading.hide();
    result.fold((failure) {
      asuka.showSnackBar(SnackBar(
          content: Text(failure.message), duration: Duration(seconds: 2)));
    }, (user) {
      authStore.setUser(user);
      Modular.to.pushNamedAndRemoveUntil("/", (_) => false);
    });
  }
}
