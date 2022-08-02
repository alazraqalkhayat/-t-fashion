
import 'package:bloc/bloc.dart';
import 'package:t_fashion/dataProviders/error/failures.dart';
import 'package:t_fashion/features/users/data/repository/registerRepository.dart';
import 'package:t_fashion/features/users/presentation/manager/register/registerEvent.dart';
import 'package:t_fashion/features/users/presentation/manager/register/registerState.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  final RegisterRepository repository;

  RegisterBloc({required this.repository})
      : assert(repository != null),
        super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async*{
    print('map terned on ');
    if(event is SignupEvent){
      final failureOrData=await repository.signup(signupModel: event.signupModel);
      yield* failureOrData.fold(
              (failure)async*{
            yield RegisterError(errorMessage: mapFailureToMessage(failure));
          },
              (data)async*{
            yield RegisterLoaded(message: data);
          }
      );
    }

    if(event is LoginEvent){
      print('login event');
      yield RegisterLoading();
      final failureOrData=await repository.login(loginModel: event.loginModel);

      yield* failureOrData.fold(
              (failure)async*{
            yield RegisterError(errorMessage: mapFailureToMessage(failure));
          },
              (data)async*{

            print('yield $data,,,,,,,,,,,,');
            yield RegisterLoaded(message: 'data');
          }
      );
    }
  }

}