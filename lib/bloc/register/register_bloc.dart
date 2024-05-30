import 'package:bloc/bloc.dart';
import 'package:class_manage/bloc/register/register_event.dart';
import 'package:class_manage/bloc/register/register_state.dart';
import 'package:class_manage/repository/signup/signup_repository.dart';
import 'package:class_manage/utils/status.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final signupRepository = SignupRepository();
  RegisterBloc() : super(const RegisterState()) {
    on<UserRegister>(_userRegister);
  }

  void _userRegister(UserRegister event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(status: Status.loading));

    await signupRepository.createAccount(
      event.context,
      event.email,
      event.userName,
      event.password,
    );
    emit(state.copyWith(status: Status.success));
  }
}
