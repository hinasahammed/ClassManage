import 'package:bloc/bloc.dart';
import 'package:class_manage/bloc/upload/upload_event.dart';
import 'package:class_manage/bloc/upload/upload_state.dart';
import 'package:class_manage/repository/upload/upload_repository.dart';
import 'package:class_manage/utils/status.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final uploadRepository = UploadRepository();
  UploadBloc() : super(UploadState()) {
    on<UploadStudentData>(_uploadStudentData);
    on<GetStudentValue>(_getStudentValue);
    on<GetBirhDate>(_getBirhDate);
    on<Logout>(_logout);
  }
  void _uploadStudentData(
      UploadStudentData event, Emitter<UploadState> emit) async {
    emit(state.copyWith(status: Status.loading));
    await uploadRepository.uploadStudent(
      event.model,
      event.context,
    );
    emit(state.copyWith(status: Status.success));
  }

  void _getStudentValue(GetStudentValue event, Emitter<UploadState> emit) {
    emit(state.copyWith(dropValue: event.dropValue));
  }

  void _getBirhDate(GetBirhDate event, Emitter<UploadState> emit) async {
    final selectedDate = await uploadRepository.selectDob(event.context);
    emit(state.copyWith(dob: selectedDate ?? DateTime(2000, 1, 1)));
  }

  void _logout(Logout event, Emitter<UploadState> emit) async {
    await uploadRepository.logout(event.context);
  }
}
