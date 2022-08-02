import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  int id;
  late String userName,email,phoneNumber,image,token;

  UserModel({required this.id,required this.userName,required this.email,required this.phoneNumber,required this.image,required this.token});

  factory UserModel.fromJson(Map<String,dynamic> customer){
    return UserModel(id:customer['id'],userName:customer['username'],email:customer['email'],phoneNumber: customer['phoneNumber'],image:customer['image'],token:customer['token']);
  }

  UserModel fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }

  factory UserModel.init(){
    return UserModel(
      id: 0,
      userName: '',
      email: '',
      phoneNumber: '',
      image: '',
      token: '',
    );
  }

  Map<String,dynamic>toJson()=>{'id':id,'userName':userName,'email':email,'phoneNumber':phoneNumber,'image':image,'token':token};

  @override
  // TODO: implement props
  List<Object?> get props => [id,userName,email,phoneNumber,image,token];

}