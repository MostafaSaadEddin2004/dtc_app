import 'package:bloc/bloc.dart';
import 'package:dtc_app/api/models/specialty_model.dart';
import 'package:dtc_app/api/services/department_services.dart';
import 'package:meta/meta.dart';

part 'drop_down_select_specialty_state.dart';

class DropDownSelectSpecialtyCubit extends Cubit<DropDownSelectSpecialtyState> {
  DropDownSelectSpecialtyCubit() : super(DropDownSelectSpecialtyInitial());
  void fetchSpecialtyData({required int departmentId}) async {
    emit(DropDownSelectSpecialtyLoading());
    final specialtyData =
        await DepartmentServices.getSpecialty(departmentId: departmentId);
    emit(DropDownSelectSpecialtyFetched(specialtyData: specialtyData));
  }
}