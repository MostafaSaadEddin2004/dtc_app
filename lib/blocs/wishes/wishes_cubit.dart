import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wishes_state.dart';

class WishesCubit extends Cubit<WishesState> {
  WishesCubit() : super(WishesState());
  int selectedWishes = 0;
  int wishes = 0;
  String sentence = '';

  void getNumberOfWishes({bool? isAdd, String? certificateName}) {
    if (isAdd == true) {
      if (certificateName == 'علمي') {
        selectedWishes += 1;
        wishes = 6;
        sentence = 'ست رغبات';
      } else if (certificateName == 'أدبي') {
        selectedWishes += 1;
        wishes = 5;
        sentence = 'خمس رغبات';
      } else if (certificateName == 'صناعي معلوماتية') {
        selectedWishes += 1;
        wishes = 1;
        sentence = 'رغبة';
      } else if (certificateName == 'صناعي إلكترون') {
        selectedWishes += 1;
        wishes = 1;
        sentence = 'رغبة';
      } else if (certificateName == 'صناعي إتصالات') {
        selectedWishes += 1;
        wishes = 1;
        sentence = 'رغبة';
      } else if (certificateName == 'صناعي ميكاترونكس') {
        selectedWishes += 1;
        wishes = 1;
        sentence = 'رغبة';
      } else if (certificateName == 'فنون نسوية') {
        selectedWishes += 1;
        wishes = 2;
        sentence = 'رغبتين';
      } else if (certificateName == 'مهني') {
        selectedWishes += 1;
        wishes = 6;
        sentence = 'ست رغبات';
      }
      emit(WishesAdd());
    } else {
      if (certificateName == 'علمي') {
        selectedWishes -= 1;
        wishes = 6;
        sentence = 'ست رغبات';
      } else if (certificateName == 'أدبي') {
        selectedWishes -= 1;
        wishes = 5;
        sentence = 'خمس رغبات';
      } else if (certificateName == 'صناعي معلوماتية') {
        selectedWishes -= 1;
        wishes = 1;
        sentence = 'رغبة';
      } else if (certificateName == 'صناعي إلكترون') {
        selectedWishes -= 1;
        wishes = 1;
        sentence = 'رغبة';
      } else if (certificateName == 'صناعي إتصالات') {
        selectedWishes -= 1;
        wishes = 1;
        sentence = 'رغبة';
      } else if (certificateName == 'صناعي ميكاترونكس') {
        selectedWishes -= 1;
        wishes = 1;
        sentence = 'رغبة';
      } else if (certificateName == 'فنون نسوية') {
        selectedWishes -= 1;
        wishes = 2;
        sentence = 'رغبتين';
      } else if (certificateName == 'مهني') {
        selectedWishes -= 1;
        wishes = 6;
        sentence = 'ست رغبات';
      }
      emit(WishesMinus());
    }
  }
}
