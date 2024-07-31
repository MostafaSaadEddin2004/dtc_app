import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Students_Screens/Registering_Screens/Long_Courses/Personal_Information.dart';
import 'package:dtc_app/blocs/select_wish/cubit/select_wish_cubit.dart';
import 'package:dtc_app/blocs/wishes/wishes_cubit.dart';
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
    required this.certificateName,
  });
  static String id = '/WishesPage';
  final int certificateId;
  final String certificateName;

  @override
  State<WishesPage> createState() => _WishesPageState();
}

class _WishesPageState extends State<WishesPage> {
  int checkedCount = 0;

  List<int> specialtyIDs = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WishesCubit()
        ..getNumberOfWishes(
            certificateName: widget.certificateName, isAdd: true),
      child: BlocProvider(
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
              return BlocConsumer<WishesCubit, WishesState>(
                builder: (context, state) {
                  return SingleChildScrollView(
                      child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        labelStyle(
                            text:
                                'إختر ${BlocProvider.of<WishesCubit>(context).sentence}'),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 278,
                      child: ListView.builder(
                          itemCount: wishesList
                              .where((element) =>
                                  !specialtyIDs.contains(element.id))
                              .length,
                          itemBuilder: (context, index) {
                            final wishes = wishesList
                                .where((element) =>
                                    !specialtyIDs.contains(element.id))
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
                                      if (checkedCount <=
                                          BlocProvider.of<WishesCubit>(context)
                                                  .wishes -
                                              1) {
                                        checkedCount++;
                                        specialtyIDs.add(wishes[index].id);
                                        print(specialtyIDs);
                                        setState(() {});
                                      } else if (checkedCount ==
                                          BlocProvider.of<WishesCubit>(context)
                                              .wishes) {
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (_) => warningDialog(
                                              title: 'إنتباه',
                                              message:
                                                  'لا يمكن إختيار أكثر ${BlocProvider.of<WishesCubit>(context).sentence}',
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              }),
                                        );
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
                              .where((element) =>
                                  specialtyIDs.contains(element.id))
                              .length,
                          itemBuilder: (context, index) {
                            final wishes = wishesList
                                .where((element) =>
                                    specialtyIDs.contains(element.id))
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
                              if (checkedCount ==
                                  BlocProvider.of<WishesCubit>(context)
                                      .wishes) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PersonalInformation(
                                          specialtyIDs: specialtyIDs,
                                        )));
                              } else {
                                showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (_) => warningDialog(
                                      title: 'إنتباه',
                                      message:
                                          'يجب إختيار ${BlocProvider.of<WishesCubit>(context).sentence.toString()} أولاً',
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
                listener: (context, state) {
                  if (state is WishesAdd) {
                    checkedCount =
                        BlocProvider.of<WishesCubit>(context).selectedWishes;
                  } else {
                    checkedCount =
                        BlocProvider.of<WishesCubit>(context).selectedWishes;
                  }
                },
              );
            },
          ),
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
