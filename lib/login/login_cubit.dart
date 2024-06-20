import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testss/endPoints.dart';
import 'package:testss/local/dio.dart';
import 'package:testss/models/login_model.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
loginModel? loginstudent;
 void userLogin({
  required String email,
   required String password
}){
   emit(LoginLoaded());
DioHelper.PostData(url: LOGIN,  data: {
"email":email,
  "password":password
}
).then((value) {
  print(value.data);
 loginstudent= loginModel.fromjson(value.data);
 print(loginstudent?.token);
  emit(LoginSuccess(loginstudent!));
}).catchError((error){
  emit(LoginFailure(error.toString()));
});
 }
}
