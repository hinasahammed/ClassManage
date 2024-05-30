// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:class_manage/utils/status.dart';

class LoginState extends Equatable {
  final Status status;

  const LoginState({this.status = Status.success});

  @override
  List<Object> get props => [status];

  LoginState copyWith({
    Status? status,
  }) {
    return LoginState(
      status: status ?? this.status,
    );
  }
}
