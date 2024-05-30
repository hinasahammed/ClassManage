import 'package:bloc/bloc.dart';
import 'package:class_manage/bloc/textField/textfield_event.dart';
import 'package:class_manage/bloc/textField/textfield_state.dart';

class TextfieldBloc extends Bloc<TextfieldEvent, TextfieldState> {
  TextfieldBloc() : super(const TextfieldState()) {
    on<CheckVisibility>(_checkVisibility);
  }

  void _checkVisibility(CheckVisibility event, Emitter<TextfieldState> emit) {
    emit(state.copyWith(isVisible: !state.isVisible));
  }
}
