part of 'drop_down_and_select_department_cubit.dart';

@immutable
class DropDownAndSelectDepartmentState {}

class DropDownAndSelectDepartmentInitial
    extends DropDownAndSelectDepartmentState {}

class DropDownAndSelectDepartmentLoading
    extends DropDownAndSelectDepartmentState {}

class DropDownAndSelectDepartmentFetched
    extends DropDownAndSelectDepartmentState {
  final List<DepartmentModel> departmentData;
  DropDownAndSelectDepartmentFetched({required this.departmentData});
}


