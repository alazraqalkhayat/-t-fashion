import 'package:equatable/equatable.dart';

class LoginModel extends Equatable{
  late String email,password;
  LoginModel({required this.email,required this.password});

  Map<String,dynamic>toJson()=>{'email':email,'password':password};

  @override
  List<Object?> get props => [email,password];

}