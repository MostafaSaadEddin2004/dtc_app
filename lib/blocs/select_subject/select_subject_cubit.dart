import 'package:bloc/bloc.dart';
import 'package:dtc_app/api/models/subject_model.dart';
import 'package:dtc_app/api/services/subject_service.dart';
import 'package:meta/meta.dart';

part 'select_subject_state.dart';

class SelectSubjectCubit extends Cubit<SelectSubjectState> {
  SelectSubjectCubit() : super(SelectSubjectInitial());
  void fetchData() async {
    emit(SelectSubjectLoading());
    final subjectData = await SubjectService.getSubjects();
    emit(SelectSubjectFetched(subjectData: subjectData));
  }
}
