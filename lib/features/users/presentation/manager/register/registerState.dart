import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable{
  const RegisterState();
}

class RegisterInitial extends RegisterState{
  @override
  List<Object?> get props => [];

}

class RegisterLoading extends RegisterState{
  @override
  List<Object?> get props => throw UnimplementedError();
}

class RegisterLoaded extends RegisterState{
  String message;
  RegisterLoaded({required this.message});
  @override
  List<Object?> get props => [message];
}

class RegisterError extends RegisterState{
  String errorMessage;
  RegisterError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}