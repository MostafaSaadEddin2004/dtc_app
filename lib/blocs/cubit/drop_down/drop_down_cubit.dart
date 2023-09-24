import 'package:bloc/bloc.dart';
import 'package:dtc_app/api/models/comparison_model.dart';
import 'package:dtc_app/api/services/comparison_service.dart';
import 'package:meta/meta.dart';

part 'drop_down_state.dart';

class DropDownCubit extends Cubit<DropDownState> {
  DropDownCubit() : super(DropDownInitial());
  void fetchData({required int certificateType_id}) async {
    emit(DropDownLoading());
    final comparisonData = await ComparisonService.getComparison(
        certificateType_id: certificateType_id);
    emit(DropDownFetched(data: comparisonData));
  }
}
