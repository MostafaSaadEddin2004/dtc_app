part of 'select_wish_cubit.dart';

@immutable
class SelectWishState {}

class SelectWishInitial extends SelectWishState {}

class SelectWishLoading extends SelectWishState {}

class SelectWishFetched extends SelectWishState {
  final List<ComparisonModel> wishes;

  SelectWishFetched({required this.wishes});
}
