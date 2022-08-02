import 'package:equatable/equatable.dart';
import 'package:t_fashion/features/users/data/model/loginModel.dart';
import 'package:t_fashion/features/users/data/model/signupModel.dart';

abstract class RegisterEvent extends Equatable{
  const RegisterEvent();
}

class SignupEvent extends RegisterEvent{
  SignupModel signupModel;
  SignupEvent({required this.signupModel});

  @override
  List<Object?> get props => [signupModel];

}

class LoginEvent extends RegisterEvent{
  LoginModel loginModel;
  LoginEvent({required this.loginModel});

  @override
  List<Object?> get props => [loginModel];


}