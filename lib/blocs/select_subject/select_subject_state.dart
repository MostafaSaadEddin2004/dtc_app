part of 'select_subject_cubit.dart';

@immutable
class SelectSubjectState {}

class SelectSubjectInitial extends SelectSubjectState {}

class SelectSubjectLoading extends SelectSubjectState {}

class SelectSubjectFetched extends SelectSubjectState {
  final List<SubjectModel> subjectData;

  SelectSubjectFetched({required this.subjectData});
}
