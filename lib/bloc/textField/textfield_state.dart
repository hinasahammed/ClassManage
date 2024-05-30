// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TextfieldState extends Equatable {
  final bool isVisible;

  const TextfieldState({this.isVisible=false});

  TextfieldState copyWith({
    bool? isVisible,
  }) {
    return TextfieldState(
      isVisible: isVisible ?? this.isVisible,
    );
  }

  @override
  List<Object> get props => [isVisible];
}
