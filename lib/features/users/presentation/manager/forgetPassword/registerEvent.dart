import 'package:equatable/equatable.dart';
import 'package:t_fashion/features/users/data/model/loginModel.dart';
import 'package:t_fashion/features/users/data/model/signupModel.dart';

abstract class ForgetPasswordEvent extends Equatable{
  const ForgetPasswordEvent();
}

class ForgetPasswordRequest extends ForgetPasswordEvent{
  String email;
  ForgetPasswordRequest({required this.email});

  @override
  List<Object?> get props => [email];

}

class ResendForgetPasswordRequest extends ForgetPasswordEvent{
  String email;
  ResendForgetPasswordRequest({required this.email});

  @override
  List<Object?> get props => [email];
}

class ForgetPasswordVerify extends ForgetPasswordEvent {
  final String email;
  final String code;

  ForgetPasswordVerify({required this.email,required this.code,});

  @override
  List<Object> get props => [email, code];
}

class ResetPasswordRequest extends ForgetPasswordEvent {
  final String email;
  final String token;
  final String password;

  ResetPasswordRequest({required this.email,required this.token,required this.password,});

  @override
  List<Object> get props => [email, password];
}
