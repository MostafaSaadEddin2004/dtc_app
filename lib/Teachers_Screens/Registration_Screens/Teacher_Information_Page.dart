import 'package:dtc_app/Browsers_Screens/Browser_Start_Page.dart';
import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Components/showDialogList.dart';
import 'package:dtc_app/api/services/teacher_information_services.dart';
import 'package:dtc_app/blocs/drop_down_&_select_department/drop_down_and_select_department_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Components/Buttons.dart';
import '../../Components/CustomAppBar.dart';
import '../../Components/Label.dart';
import '../../Components/TextField.dart';
import '../../Constants/Colors.dart';
import '../../Constants/Controller.dart';
import '../../Constants/TextStyle.dart';

class TeacherInformationPage extends StatefulWidget {
  const TeacherInformationPage({super.key});
  static String id = '/TeacherInformationPage';

  @override
  State<TeacherInformationPage> createState() => _TeacherInformationPageState();
}

class _TeacherInformationPageState extends State<TeacherInformationPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  DateTime? dateTime;
  String teacherDepartmentVariable = '';
  String teacherNationalityVariable = '';
  int teacherDepartmentIDVariable = 1;
  int nationalitySelectedIndex = 0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DropDownAndSelectDepartmentCubit()..fetchDepartmentData(),
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
            appBar: CustomAppBar(title: 'معلومات الأستاذ الشخصية'),
            body: Form(
              key: formState,
              child: Builder(builder: (context) {
                final state = BlocProvider.of<DropDownAndSelectDepartmentCubit>(
                        context,
                        listen: true)
                    .state;
                if (state is! DropDownAndSelectDepartmentFetched)
                  return Loading();
                final departmentData = state.departmentData;
                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            labelStyle(text: 'المعلومات الشخصية'),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, right: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    titleText(text: 'الشهادة'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    registrationInfoTextField(
                                      controller:
                                          teacherCertificationController,
                                      keyboardType: TextInputType.name,
                                      radius: 20,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return 'هذا الحقل مطلوب';
                                        } else if (text.length < 3) {
                                          return 'الحقل يجب أن يكون 3 أحرف على الأقل';
                                        }
                                        return null;
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    titleText(text: 'الإختصاص'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    registrationInfoTextField(
                                      controller: teacherSpecialtyController,
                                      keyboardType: TextInputType.name,
                                      radius: 20,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return 'هذا الحقل مطلوب';
                                        } else if (text.length < 3) {
                                          return 'الحقل يجب أن يكون 3 أحرف على الأقل';
                                        }
                                        return null;
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            children: [
                              titleText(text: 'تاريخ الولادة'),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                // decoration: BoxDecoration(
                                //   color: WhiteColor,
                                //   borderRadius: BorderRadius.circular(20),
                                //   boxShadow: const [
                                //     BoxShadow(
                                //       color: GreyColor,
                                //       blurRadius: 2,
                                //       offset: Offset(2, 2), // Shadow position
                                //     ),
                                //   ],
                                // ),
                                child: TextFormField(
                                    onChanged: (data) {},
                                    controller: teacherBirthDateController,
                                    validator: (text) {
                                      if (text!.isEmpty) {
                                        return 'الحقل مطلوب';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.none,
                                    enabled: true,
                                    cursorColor: GreyColor,
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      suffixIconColor: BlackColor,
                                      floatingLabelStyle: const TextStyle(
                                        color: BlackColor,
                                      ),
                                      hintText:
                                          'أنقر على الرمز لإختيار التاريخ',
                                      labelStyle: const TextStyle(
                                          color: GreyColor, fontSize: 16),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      suffixIcon: IconButton(
                                        icon: const Icon(Icons.calendar_month),
                                        onPressed: () async {
                                          dateTime = await showDatePicker(
                                              context: context,
                                              initialDate: DateTime(1960),
                                              firstDate: DateTime(1960),
                                              lastDate: DateTime(1998),
                                              keyboardType:
                                                  TextInputType.datetime);
                                          teacherBirthDateController.text =
                                              '${dateTime?.day}-${dateTime?.month}-${dateTime?.year}';
                                        },
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide:
                                            const BorderSide(color: GreyColor),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, right: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    titleText(text: 'العنوان الحالي'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    registrationInfoTextField(
                                      controller:
                                          teacherCurrentLocationController,
                                      keyboardType: TextInputType.streetAddress,
                                      radius: 20,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return 'هذا الحقل مطلوب';
                                        } else if (text.length < 3) {
                                          return 'الحقل يجب أن يكون 3 أحرف على الأقل';
                                        }
                                        return null;
                                      },
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    titleText(text: 'العنوان الدائم'),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    registrationInfoTextField(
                                      controller:
                                          teacherPermanentLocationController,
                                      keyboardType: TextInputType.streetAddress,
                                      radius: 20,
                                      validator: (text) {
                                        if (text!.isEmpty) {
                                          return 'هذا الحقل مطلوب';
                                        } else if (text.length < 3) {
                                          return 'الحقل يجب أن يكون 3 أحرف على الأقل';
                                        }
                                        return null;
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              titleText(text: 'القسم'),
                              const SizedBox(
                                height: 10,
                              ),
                              ShowDialogList(
                                  cubit: BlocProvider.of<
                                          DropDownAndSelectDepartmentCubit>(
                                      context),
                                  value: teacherDepartmentVariable == ''
                                      ? 'اضغط للإختيار...'
                                      : teacherDepartmentVariable,
                                  child: ListView.builder(
                                    itemCount: departmentData.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          teacherDepartmentVariable =
                                              departmentData[index].name;
                                          teacherDepartmentIDVariable =
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
                                              Text(departmentData[index].name)
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: nationalitySelectedIndex == 2
                                ? Column(
                                    children: [
                                      Row(
                                        children: [labelFont(text: 'الجنسية')],
                                      ),
                                      RadioListTile(
                                          value: 1,
                                          groupValue: nationalitySelectedIndex,
                                          activeColor: PrimaryColor,
                                          title: const Text('فلسطيني مُسجل'),
                                          onChanged: (index) {
                                            setState(() {
                                              nationalitySelectedIndex = index!;
                                            });
                                            print(nationalitySelectedIndex);
                                          }),
                                      RadioListTile(
                                          value: 2,
                                          groupValue: nationalitySelectedIndex,
                                          activeColor: PrimaryColor,
                                          title: const Text('أخرى'),
                                          onChanged: (index) {
                                            setState(() {
                                              nationalitySelectedIndex = index!;
                                            });
                                            print(nationalitySelectedIndex);
                                          }),
                                      registrationInfoTextField(
                                        controller:
                                            teacherAuthNationalityController,
                                        keyboardType: TextInputType.name,
                                        radius: 20,
                                        onChanged: (data) {
                                          teacherNationalityVariable = '';
                                          setState(() {});
                                        },
                                        validator: (text) {
                                          if (text!.isEmpty) {
                                            return 'الحقل مطلوب';
                                          } else if (text.length < 4) {
                                            return 'الحقل يجب أن يكون 4 أحرف أو أكثر';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Row(
                                        children: [labelFont(text: 'الجنسية')],
                                      ),
                                      RadioListTile(
                                          value: 1,
                                          groupValue: nationalitySelectedIndex,
                                          activeColor: PrimaryColor,
                                          title: const Text('فلسطيني مُسجل'),
                                          onChanged: (index) {
                                            setState(() {
                                              nationalitySelectedIndex = index!;
                                            });
                                          }),
                                      RadioListTile(
                                          value: 2,
                                          groupValue: nationalitySelectedIndex,
                                          activeColor: PrimaryColor,
                                          title: const Text('أُخرى'),
                                          onChanged: (index) {
                                            setState(() {
                                              nationalitySelectedIndex = index!;
                                            });
                                          }),
                                    ],
                                  )),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            nextButton(
                              text: 'إنهاء',
                              onTap: () {
                                if (formState.currentState!.validate()) {
                                  isLoading = true;
                                  getNationalityValue(
                                      index: nationalitySelectedIndex,
                                      value: teacherNationalityVariable
                                          .toString());
                                  TeacherInformationServices.postTeacherInformation(
                                      nationality: teacherNationalityVariable,
                                      specialty: teacherSpecialtyController.text
                                          .toString(),
                                      certificate:
                                          teacherCertificationController.text
                                              .toString(),
                                      current_location:
                                          teacherCurrentLocationController.text
                                              .toString(),
                                      permanent_location:
                                          teacherPermanentLocationController
                                              .text
                                              .toString(),
                                      birth_date: teacherBirthDateController
                                          .text
                                          .toString(),
                                      section_id: teacherDepartmentIDVariable);
                                  isLoading = false;
                                  teacherSpecialtyController.clear();
                                  teacherCertificationController.clear();
                                  teacherCurrentLocationController.clear();
                                  teacherPermanentLocationController.clear();
                                  teacherBirthDateController.clear();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const BrowserStartPage()));
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                );
              }),
            )),
      ),
    );
  }

  void getNationalityValue({required String value, required int index}) {
    if (index == 1) {
      teacherNationalityVariable = 'فلسطيني مُسجل';
    } else if (index == 2) {
      teacherNationalityVariable =
          teacherAuthNationalityController.text.toString();
    }
  }
}
