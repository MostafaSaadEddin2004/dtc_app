import 'package:bloc/bloc.dart';
import 'package:dtc_app/api/models/auth_models.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:meta/meta.dart';

part 'get_user_information_state.dart';

class GetUserInformationCubit extends Cubit<GetUserInformationState> {
  GetUserInformationCubit() : super(GetUserInformationInitial());
  void fetchData() async {
    emit(GetUserInformationLoading());
    final userData = await AuthServices.getUserInformation();
    emit(GetUserInformationFetched(userData: userData));
  }
}
