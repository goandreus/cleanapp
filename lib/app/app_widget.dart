import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka show builder;

import 'app_theme.dart';

///This is main Wigdet in the app to define MaterialDesiner, Routes, Locale...
class AppWidget extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            color: ThemeApp.appColor,
          ),
          primaryColor: ThemeApp.appMaterialColor,
          fontFamily: "Nunito",
          textTheme: TextTheme(button: TextStyle(color: Colors.white))),
      debugShowCheckedModeBanner: false,
      builder: asuka.builder,
      initialRoute: '/',
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
