part of 'get_user_information_cubit.dart';

@immutable
class GetUserInformationState {}

class GetUserInformationInitial extends GetUserInformationState {}
class GetUserInformationLoading extends GetUserInformationState {}
class GetUserInformationFetched extends GetUserInformationState {
  final RegistrationInformationModel userData;

  GetUserInformationFetched({required this.userData});
}