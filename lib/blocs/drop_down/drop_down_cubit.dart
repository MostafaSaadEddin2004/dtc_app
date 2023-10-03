import 'package:bloc/bloc.dart';
import 'package:dtc_app/api/models/certificate_type_model.dart';
import 'package:dtc_app/api/services/certificate_type_service.dart';
import 'package:meta/meta.dart';

part 'drop_down_state.dart';

class DropDownCubit extends Cubit<DropDownState> {
  DropDownCubit() : super(DropDownInitial());
  void fetchData() async {
    emit(DropDownLoading());
    final certificateData = await CertificateTypeService.getCertificateType(
        );
    emit(DropDownFetched(certificateData: certificateData));
  }
}
