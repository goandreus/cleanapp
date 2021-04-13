import 'package:cleanapp/app/modules/login/presentation/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/get_logged_user.dart';
import 'domain/usecases/login_with_google.dart';
import 'domain/usecases/logout.dart';
import 'external/firebase_datasource_login.dart';
import 'infra/repositories/login_repository_impl.dart';
import 'presentation/login_page.dart';

class LoginModule extends ChildModule {
  static List<Bind> export = [
    $GetLoggedUserImpl,
    $LogoutImpl,
    $LoginRepositoryImpl,
    $LoginController,
    $FirebaseDataSourceLoginImpl,
  ];

  @override
  List<Bind> get binds => [
        $LoginWithGoogleImpl,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => LoginPage()),
      ];
}
