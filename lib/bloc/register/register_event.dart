import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserRegister extends RegisterEvent {
  final BuildContext context;
  final String email;
  final String userName;
  final String password;

  UserRegister({
    required this.context,
    required this.email,
    required this.userName,
    required this.password,
  });

  @override
  List<Object?> get props => [context, email, userName, password];
}
