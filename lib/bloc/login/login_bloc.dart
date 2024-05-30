import 'package:bloc/bloc.dart';
import 'package:class_manage/bloc/login/login_event.dart';
import 'package:class_manage/bloc/login/login_state.dart';
import 'package:class_manage/repository/login/login_repository.dart';
import 'package:class_manage/utils/status.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final loginRepository = LoginRepository();
  LoginBloc() : super(const LoginState()) {
    on<UserLogin>(_userLogin);
  }

  void _userLogin(UserLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: Status.loading));

    await loginRepository.login(
      event.email,
      event.password,
      event.context,
    );
    emit(state.copyWith(status: Status.success));
  }
}
