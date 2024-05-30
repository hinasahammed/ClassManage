// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:class_manage/models/student_model.dart';

abstract class UploadEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UploadStudentData extends UploadEvent {
  final StudentModel model;
  final BuildContext context;

  UploadStudentData({required this.model, required this.context});

  @override
  bool operator ==(covariant UploadStudentData other) {
    if (identical(this, other)) return true;

    return other.model == model && other.context == context;
  }

  @override
  int get hashCode => model.hashCode ^ context.hashCode;
}

class GetStudentValue extends UploadEvent {
  final String dropValue;

  GetStudentValue({required this.dropValue});

  @override
  bool operator ==(covariant GetStudentValue other) {
    if (identical(this, other)) return true;

    return other.dropValue == dropValue;
  }

  @override
  int get hashCode => dropValue.hashCode;
}

class GetBirhDate extends UploadEvent {
  final BuildContext context;

  GetBirhDate({required this.context});

  @override
  bool operator ==(covariant GetBirhDate other) {
    if (identical(this, other)) return true;

    return other.context == context;
  }

  @override
  int get hashCode => context.hashCode;
}

class Logout extends UploadEvent {
  final BuildContext context;

  Logout({required this.context});

  @override
  bool operator ==(covariant Logout other) {
    if (identical(this, other)) return true;
  
    return 
      other.context == context;
  }

  @override
  int get hashCode => context.hashCode;
}
