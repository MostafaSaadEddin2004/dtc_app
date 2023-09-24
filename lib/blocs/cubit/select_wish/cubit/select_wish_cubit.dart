import 'package:bloc/bloc.dart';
import 'package:dtc_app/api/models/comparison_model.dart';
import 'package:dtc_app/api/services/comparison_service.dart';
import 'package:meta/meta.dart';

part 'select_wish_state.dart';

class SelectWishCubit extends Cubit<SelectWishState> {
  SelectWishCubit() : super(SelectWishInitial());
  void fetchData({required int certificateType_id}) async {
    emit(SelectWishLoading());
    final response = await ComparisonService.getComparison(
        certificateType_id: certificateType_id);
    emit(SelectWishFetched(wishes: response));
  }
}
