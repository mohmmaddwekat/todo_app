
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/login/states.dart';
import 'package:shop_app/shared/network/end_point.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>
{

  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) =>  BlocProvider.of(context);
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  LoginModel? loginModel;
  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: login,
      data: {
        'email' : email,
        'password' : password,
      },
    ).then((value){
      loginModel = LoginModel.fromJason(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      print(error);
      emit(LoginErrorState(error.toString()));
    });
  }

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}