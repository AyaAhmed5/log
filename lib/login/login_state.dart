

import 'package:testss/models/login_model.dart';

abstract class LoginStates {}

final class LoginInitial extends LoginStates {}

final class LoginLoaded extends LoginStates {}

final class LoginSuccess extends LoginStates {
final loginModel loginstudent;
LoginSuccess(this.loginstudent);
}

final class LoginFailure extends LoginStates {
  final String errMessage;

  LoginFailure(this.errMessage);
}

final class LoginchangePasswordVisibility extends LoginStates {}
