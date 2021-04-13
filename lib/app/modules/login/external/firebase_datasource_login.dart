import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/errors/messages.dart';
import '../../../modules/login/domain/errors/errors.dart';
import '../../../modules/login/infra/datasources/login_datasource.dart';
import '../../../modules/login/infra/models/user_model.dart';

part 'firebase_datasource_login.g.dart';

@Injectable(singleton: false)
class FirebaseDataSourceLoginImpl implements LoginDataSource {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  FirebaseDataSourceLoginImpl(this.auth, this.googleSignIn);

  @override
  Future<UserModel> loginGoogle({String email, String password}) async {
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null)
      throw ErrorCancelledByUser(message: Messages.LOGIN_CANCELLED);

    final googleAuthentication = await googleUser.authentication;

    final authCredential = GoogleAuthProvider.credential(
      idToken: googleAuthentication.idToken,
      accessToken: googleAuthentication.accessToken,
    );

    var result = await auth.signInWithCredential(authCredential);
    var user = result.user;

    return UserModel(
      uid: user.uid,
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  Future<UserModel> currentUser() async {
    var user = (auth.currentUser);

    if (user == null) throw ErrorGetLoggedUser();

    return UserModel(
      uid: user.uid,
      name: user.displayName,
      phoneNumber: user.phoneNumber,
      email: user.email,
    );
  }

  @override
  Future<void> logout() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }
}
