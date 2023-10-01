import 'package:bloc/bloc.dart';
import 'package:dtc_app/api/models/teacher_information_model.dart';
import 'package:dtc_app/api/services/teacher_information_services.dart';
import 'package:meta/meta.dart';

part 'select_teacher_state.dart';

class SelectTeacherCubit extends Cubit<SelectTeacherState> {
  SelectTeacherCubit() : super(SelectTeacherInitial());

  void fetchData() async {
    emit(SelectTeacherLoading());
    final teachers = await TeacherInformationServices.getTeaches();
    emit(SelectTeacherFetched(teachers: teachers));
  }
}
