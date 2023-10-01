import 'package:bloc/bloc.dart';
import 'package:dtc_app/api/models/department_model.dart';
import 'package:dtc_app/api/services/department_services.dart';
import 'package:meta/meta.dart';
part 'drop_down_and_select_department_state.dart';

class DropDownAndSelectDepartmentCubit
    extends Cubit<DropDownAndSelectDepartmentState> {
  DropDownAndSelectDepartmentCubit()
      : super(DropDownAndSelectDepartmentInitial());
  void fetchDepartmentData({int? departmentId}) async {
    emit(DropDownAndSelectDepartmentLoading());
    final departmentData = await DepartmentServices.getDepartment();
    emit(DropDownAndSelectDepartmentFetched(
        departmentData: departmentData));
  }
}
