import '../../../../modules/login/domain/entities/logged_user.dart';
import '../../../../modules/login/domain/entities/logged_user_info.dart';
import 'package:meta/meta.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel(
      {@required String name,
      @required String uid,
      String email,
      String phoneNumber})
      : super(name: name, uid: uid, email: email, phoneNumber: phoneNumber);

  LoggedUser toLoggedUser() => this;
}
