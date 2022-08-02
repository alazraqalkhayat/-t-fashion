import 'package:equatable/equatable.dart';

class SignupModel extends Equatable{
  late String userName,email,phoneNumber,password;

  SignupModel({required this.userName,required this.email,required this.phoneNumber,required this.password});

  Map<String,dynamic>toJson()=>{'userName':userName,'email':email,'phoneNumber':phoneNumber,'password':password};

  @override
  // TODO: implement props
  List<Object?> get props => [userName,email,phoneNumber,password];

}