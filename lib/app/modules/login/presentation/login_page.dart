import 'package:cleanapp/app/modules/login/presentation/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<StatefulWidget, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/clean.png",
              height: 250,
            ),
            Expanded(
              child: SizedBox(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                elevation: 15,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Login com Google",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      "assets/google.png",
                      height: 20,
                    ),
                  ),
                ],
              ),
              onPressed: controller.enterLoginGoogle,
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      ),
    );
  }
}
