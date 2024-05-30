// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:class_manage/utils/status.dart';

class UploadState extends Equatable {
  final Status status;
  final String dropValue;
  final DateTime dob;

  UploadState({
    this.status = Status.success,
    this.dropValue = 'Male',
    DateTime? dob,
  }) : dob = dob ?? DateTime(2000, 1, 1);

  UploadState copyWith({
    Status? status,
    String? dropValue,
    DateTime? dob,
  }) {
    return UploadState(
      status: status ?? this.status,
      dropValue: dropValue ?? this.dropValue,
      dob: dob ?? this.dob,
    );
  }

  @override
  List<Object> get props => [status, dropValue, dob];
}
