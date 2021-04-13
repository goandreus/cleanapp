import 'package:cleanapp/app/modules/utils/loading_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'app_widget.dart';
import 'core/connectivity/external/flutter_connectivity_driver_impl.dart';
import 'core/connectivity/infra/services/connectivity_service_impl.dart';
import 'core/pages/splash_screen_page.dart';
import 'core/stores/auth_store.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';

///This is main module define to every app
class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        ...LoginModule.export,
        $AuthStore,
        $ConnectivityServiceImpl,
        $FlutterConnectivityDriver,
        $LoadingDialogImpl,
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => FirebaseFirestore.instance),
        Bind((i) => GoogleSignIn()),
        Bind((i) => Connectivity()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, __) => SplashScreenPage()),
        ModularRouter("/login", module: LoginModule()),
        ModularRouter("/home", module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
