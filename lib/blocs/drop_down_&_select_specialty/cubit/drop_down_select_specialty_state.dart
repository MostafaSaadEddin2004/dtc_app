part of 'drop_down_select_specialty_cubit.dart';

@immutable
class DropDownSelectSpecialtyState {}

class DropDownSelectSpecialtyInitial extends DropDownSelectSpecialtyState {}

class DropDownSelectSpecialtyLoading extends DropDownSelectSpecialtyState {}

class DropDownSelectSpecialtyFetched extends DropDownSelectSpecialtyState {
  final List<SpecialtyModel> specialtyData;

  DropDownSelectSpecialtyFetched({required this.specialtyData});
}
