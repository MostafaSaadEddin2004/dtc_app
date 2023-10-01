import 'package:dtc_app/Components/Dialogs.dart';
import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Components/showDialogList.dart';
import 'package:dtc_app/api/services/department_services.dart';
import 'package:dtc_app/api/services/move_request_service.dart';
import 'package:dtc_app/blocs/drop_down_&_select_specialty/cubit/drop_down_select_specialty_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Components/Buttons.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';

class MovingRequestPage extends StatefulWidget {
  const MovingRequestPage({super.key});
  static String id = '/MovingRequestPage';

  @override
  State<MovingRequestPage> createState() => _MovingRequestPageState();
}

class _MovingRequestPageState extends State<MovingRequestPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    int selectedDepartmentId = 1;
    int selectedSpecialtyId = 1;
    String newDepartment = '';
    String newClass = '';
    return BlocProvider(
      create: (context) => DropDownSelectSpecialtyCubit()
        ..fetchSpecialtyData(departmentId: selectedDepartmentId),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: const Text('طلب الإنتقال'),
        ),
        body: Builder(builder: (context) {
          final specialtyState = BlocProvider.of<DropDownSelectSpecialtyCubit>(
                  context,
                  listen: true)
              .state;
          if (specialtyState is! DropDownSelectSpecialtyFetched) {
            return Loading();
          }
          final specialtyData = specialtyState.specialtyData;
          selectedDepartmentId =
              specialtyData.isEmpty ? 1 : specialtyData.first.id;

          return Form(
              key: formState,
              child: SingleChildScrollView(
                child: SizedBox(
                  height: height - 92,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, right: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  titleText(text: 'القسم'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  FutureBuilder(
                                      future:
                                          DepartmentServices.getDepartment(),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData || !mounted)
                                          return Loading();
                                        final departmentData = snapshot.data!;
                                        return ShowDialogList(
                                          value: newDepartment.isEmpty
                                              ? 'إختر...'
                                              : newDepartment,
                                          child: ListView.builder(
                                            itemCount: departmentData.length,
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  newDepartment =
                                                      departmentData[index]
                                                          .name;
                                                  selectedDepartmentId =
                                                      departmentData[index].id;
                                                  Navigator.of(context).pop();
                                                  setState(() {});
                                                },
                                                child: SizedBox(
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(departmentData[index]
                                                          .name)
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      })
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  titleText(text: 'الفرع المراد الإنتقال إليه'),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ShowDialogList(
                                    cubit: BlocProvider.of<
                                        DropDownSelectSpecialtyCubit>(context),
                                    value:
                                        newClass.isEmpty ? 'إختر...' : newClass,
                                    child: ListView.builder(
                                      itemCount: specialtyData.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            newClass =
                                                specialtyData[index].name;
                                            selectedSpecialtyId =
                                                specialtyData[index].id;
                                            Navigator.of(context).pop();
                                            setState(() {});
                                          },
                                          child: SizedBox(
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(specialtyData[index].name)
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, right: 15),
                        child: Column(
                          children: [
                            titleText(text: 'نص طلب الإنتقال'),
                            const SizedBox(
                              height: 10,
                            ),
                            registrationInfoTextField(
                              maxLines: 6,
                              controller: movingRequestTextController,
                              keyboardType: TextInputType.text,
                              radius: 20,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'الحقل مطلوب';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          nextButton(
                              text: 'إنهاء',
                              onTap: () {
                                if (formState.currentState!.validate()) {
                                  MoreRequestService.postMoveRequest(
                                    text: movingRequestTextController.text
                                        .toString(),
                                    department_id: selectedSpecialtyId,
                                  );
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => CustomDialog(
                                        title: 'إرسال طلب الإنتقال',
                                        onPressed: () {
                                          newClass = '';
                                          newDepartment = '';
                                          movingRequestTextController.clear();
                                          Navigator.of(context)
                                            ..pop()
                                            ..pop();
                                        }),
                                  );
                                }
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ));
        }),
      ),
    );
  }
}
