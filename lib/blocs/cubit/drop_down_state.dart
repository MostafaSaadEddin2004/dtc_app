part of 'drop_down_cubit.dart';

@immutable
class DropDownState {}

class DropDownInitial extends DropDownState {}

class DropDownLoading extends DropDownState {}

class DropDownFetched extends DropDownState {
  final List<ComparisonModel> data;

  DropDownFetched({required this.data});
}
