import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Personal_Information.dart';
import 'package:dtc_app/api/services/comparison_service.dart';
import 'package:dtc_app/blocs/select_wish/cubit/select_wish_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Dialogs.dart';
import '../../../Components/Label.dart';
import '../../../Constants/Colors.dart';

class WishesPage extends StatefulWidget {
  const WishesPage({
    super.key,
    required this.certificateId,
  });
  static String id = '/WishesPage';
  final int certificateId;

  @override
  State<WishesPage> createState() => _WishesPageState();
}

class _WishesPageState extends State<WishesPage> {
  int checkedCount = 0;
  List<String> wishesList = [
    'مساعد صيدلي',
    'فني مخبر طبي',
    'الكمبيوتر ونظم المعلومات',
    'مساعد مهندس مدني',
    'تكنولوجية الإتصالات',
    'المحاسبة',
    'المصارف والتأمين',
    'ميكاترونيكس',
    'مساعد مهندس آليات',
    'فني إلكترون وتكنولوجيا الحاسوب',
    'إدارة التسويق والأعمال الإلكترونية',
    'إدارة المشاريع',
    'مساعد مهندس معماري',
    'التصميم الإعلاني',
    'مساعد مهندس ديكور وتصميم داخلي'
  ];
  List<int> specialtyIDs = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectWishCubit()
        ..fetchData(certificateType_id: widget.certificateId),
      child: Scaffold(
        appBar: CustomAppBar(title: 'طلب الانتساب'),
        body: Builder(
          builder: (context) {
            final state =
                BlocProvider.of<SelectWishCubit>(context, listen: true).state;
            if (state is! SelectWishFetched) {
              return Loading();
            }
            final wishesList = state.wishes;
            return SingleChildScrollView(
                child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  labelStyle(text: 'إختر ست رغبات'),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 278,
                child: ListView.builder(
                    itemCount: wishesList
                        .where((element) => !specialtyIDs.contains(element.id))
                        .length,
                    itemBuilder: (context, index) {
                      final wishes = wishesList
                          .where(
                              (element) => !specialtyIDs.contains(element.id))
                          .toList();
                      return Container(
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 15, right: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: GreyColor),
                            borderRadius: BorderRadius.circular(5),
                            color: WhiteColor,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: GreyColor,
                                  offset: Offset(2, 2))
                            ]),
                        child: Row(children: [
                          Text(wishes[index].name),
                          const Spacer(
                            flex: 1,
                          ),
                          IconButton(
                              onPressed: () {
                                if (checkedCount <= 5) {
                                  checkedCount++;
                                  specialtyIDs.add(wishes[index].id);
                                  print(specialtyIDs);
                                  setState(() {});
                                } else if (checkedCount == 6) {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => warningDialog(
                                        title: 'إنتباه',
                                        message:
                                            'لا يمكن إختيار أكثر من ثلاث رغبات',
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                  );
                                  setState(() {});
                                }
                              },
                              icon: const Icon(
                                Icons.add_circle_rounded,
                                color: PrimaryColor,
                                size: 30,
                              )),
                        ]),
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  labelStyle(text: 'الرغبات المختارة $checkedCount'),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: 210,
                child: ListView.builder(
                    itemCount: wishesList
                        .where((element) => specialtyIDs.contains(element.id))
                        .length,
                    itemBuilder: (context, index) {
                      final wishes = wishesList
                          .where((element) => specialtyIDs.contains(element.id))
                          .toList();
                      return Container(
                        margin: const EdgeInsets.only(
                            bottom: 10, left: 15, right: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: GreyColor),
                            borderRadius: BorderRadius.circular(5),
                            color: WhiteColor,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: GreyColor,
                                  offset: Offset(2, 2))
                            ]),
                        child: Row(children: [
                          Text('${index + 1}-  ${wishes[index].name}'),
                          const Spacer(
                            flex: 1,
                          ),
                          IconButton(
                              onPressed: () {
                                checkedCount--;
                                specialtyIDs.remove(wishes[index].id);
                                print(specialtyIDs);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.remove_circle_rounded,
                                color: RedColor,
                                size: 25,
                              )),
                        ]),
                      );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  nextButton(
                      onTap: () {
                        if (checkedCount == 6) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PersonalInformation(
                                    specialtyIDs: specialtyIDs,
                                  )));
                        } else {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => warningDialog(
                                title: 'إنتباه',
                                message: 'يجب إختيار ثلاث رغبات أولاً',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }),
                          );
                        }
                      },
                      text: 'التالي'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ]));
          },
        ),
      ),
    );
  }
}

class Wish {
  final String name;
  bool selected = false;

  Wish(this.name);
}
