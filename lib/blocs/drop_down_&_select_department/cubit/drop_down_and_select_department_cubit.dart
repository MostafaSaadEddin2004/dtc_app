import 'package:bloc/bloc.dart';
import 'package:dtc_app/api/models/department_model.dart';
import 'package:dtc_app/api/services/department_services.dart';
import 'package:dtc_app/blocs/cubit/drop_down/drop_down_cubit.dart';
import 'package:meta/meta.dart';

part 'drop_down_and_select_department_state.dart';

class DropDownAndSelectDepartmentCubit
    extends Cubit<DropDownAndSelectDepartmentState> {
  DropDownAndSelectDepartmentCubit()
      : super(DropDownAndSelectDepartmentInitial());
  void fetchData({required int certificateType_id}) async {
    emit(DropDownAndSelectDepartmentLoading());
    final departmentData = await DepartmentServices.getDepartment();
    emit(DropDownAndSelectDepartmentFetched(data: departmentData));
  }
}
