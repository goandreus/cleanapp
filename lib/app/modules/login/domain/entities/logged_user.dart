import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable {
  final String uid;
  final String email;
  final String name;
  final String phoneNumber;

  const LoggedUser({this.uid, this.email, this.name, this.phoneNumber});

  @override
  List<Object> get props => [uid, email, name, phoneNumber];
}
