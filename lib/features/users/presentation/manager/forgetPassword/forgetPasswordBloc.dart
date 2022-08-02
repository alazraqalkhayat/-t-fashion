import 'package:bloc/bloc.dart';
import 'package:t_fashion/features/users/data/repository/ForgetPasswordRepository.dart';
import 'package:t_fashion/features/users/presentation/manager/forgetPassword/forgetPasswordStatetate.dart';
import 'package:t_fashion/features/users/presentation/manager/forgetPassword/registerEvent.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent,ForgetPasswordState>{
  final ForgetPasswordRepository repository;

  ForgetPasswordBloc({required this.repository})
      : assert(repository != null),
        super(ForgetPasswordInitial());


  @override
  Stream<ForgetPasswordState> mapEventToState(ForgetPasswordEvent event) {
    return Stream.empty();
  }

}