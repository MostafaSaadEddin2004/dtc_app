part of 'select_teacher_cubit.dart';

@immutable
class SelectTeacherState {}

class SelectTeacherInitial extends SelectTeacherState {}

class SelectTeacherLoading extends SelectTeacherState {}

class SelectTeacherFetched extends SelectTeacherState {
  final List<TeacherModel> teachers;
  SelectTeacherFetched({required this.teachers});
}
