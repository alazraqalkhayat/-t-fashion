import 'package:equatable/equatable.dart';
import 'package:t_fashion/features/users/data/model/userModel.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();
}

class ForgetPasswordInitial extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}


class ForgetPasswordLoading extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordLoaded extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordVerifyCodeLoaded extends ForgetPasswordState {
  final UserModel user;

  ForgetPasswordVerifyCodeLoaded({required this.user});
  @override
  List<Object> get props => [user];
}


class ForgetPasswordCodeLoaded extends ForgetPasswordState {
  @override
  List<Object> get props => [];
}

class ForgetPasswordError extends ForgetPasswordState {
  final String message;

  ForgetPasswordError({required this.message});

  @override
  bool operator ==(Object other) {
    return false;
  }

  @override
  List<Object> get props => [message];
}
