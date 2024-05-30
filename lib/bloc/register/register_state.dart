// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:class_manage/utils/status.dart';

class RegisterState extends Equatable {
  final Status status;

  const RegisterState({this.status = Status.success});

  @override
  List<Object> get props => [status];

  RegisterState copyWith({
    Status? status,
  }) {
    return RegisterState(
      status: status ?? this.status,
    );
  }
}
