import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserLogin extends LoginEvent {
  final BuildContext context;
  final String email;
  final String password;

  UserLogin({
    required this.context,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [context, email,  password];
}
