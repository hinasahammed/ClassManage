// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentModel {
  final String name;
  final String gender;
  final String dob;

  StudentModel({required this.name, required this.gender, required this.dob});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'gender': gender,
      'dob': dob,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'] as String,
      gender: map['gender'] as String,
      dob: map['dob'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) => StudentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
