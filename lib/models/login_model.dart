import 'package:shop_app/models/user_model.dart';
class LoginModel
{
  bool? status;
  String? message;
  UserModel? data;
  LoginModel.fromJason(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModel.fromJason(json['data']): null;
  }
}

