import 'package:dtc_app/Components/Dialogs.dart';
import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Components/showDialogList.dart';
import 'package:dtc_app/api/services/department_services.dart';
import 'package:dtc_app/api/services/move_request_service.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
    bool isLoading = false;
    int selectedDepartmentId = 0;
    int selectedSpecialtyId = 0;
    String newDepartment = '';
    String newClass = '';
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          title: const Text('طلب الإنتقال'),
        ),
        body: Form(
            key: formState,
            child: FutureBuilder(
                future: DepartmentServices.getDepartment(),
                builder: (context, snapshot) {
                  return SingleChildScrollView(
                    child: Container(
                      height: height - 92,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 15, right: 15),
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
                                          future: DepartmentServices
                                              .getDepartment(),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData || !mounted)
                                              return Loading();
                                            final departmentData =
                                                snapshot.data!;
                                            return ShowDialogList(
                                              value: newDepartment == ''
                                                  ? 'إختر...'
                                                  : newDepartment,
                                              child: ListView.builder(
                                                itemCount:
                                                    departmentData.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      newDepartment =
                                                          departmentData[index]
                                                              .name;
                                                      selectedDepartmentId =
                                                          departmentData[index]
                                                              .id;
                                                      Navigator.of(context)
                                                          .pop();
                                                      setState(() {});
                                                    },
                                                    child: SizedBox(
                                                      height: 50,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(departmentData[
                                                                  index]
                                                              .name)
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      titleText(
                                          text: 'الفرع المراد الإنتقال إليه'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      FutureBuilder(
                                          future:
                                              DepartmentServices.getSpecialty(
                                                  departmentId:
                                                      selectedDepartmentId),
                                          builder: (context, snapshot) {
                                            if (!snapshot.hasData || !mounted)
                                              return Loading();
                                            final specialtyData =
                                                snapshot.data!;
                                            return ShowDialogList(
                                              value: newClass == ''
                                                  ? 'إختر...'
                                                  : newClass,
                                              child: ListView.builder(
                                                itemCount: specialtyData.length,
                                                itemBuilder: (context, index) {
                                                  return GestureDetector(
                                                    onTap: () {
                                                      newClass =
                                                          specialtyData[index]
                                                              .name;
                                                      selectedSpecialtyId =
                                                          specialtyData[index]
                                                              .id;
                                                      Navigator.of(context)
                                                          .pop();
                                                      setState(() {});
                                                    },
                                                    child: SizedBox(
                                                      height: 50,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(specialtyData[
                                                                  index]
                                                              .name)
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 15, right: 15),
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
                                      isLoading = true;
                                      MoreRequestService.postMoveRequest(
                                        text: movingRequestTextController.text
                                            .toString(),
                                        department_id: selectedSpecialtyId,
                                      );
                                      isLoading = false;
                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => CustomDialog(
                                            title: 'إرسال طلب الإنتقال',
                                            onPressed: () {
                                              newClass = '';
                                              newDepartment = '';
                                              movingRequestTextController
                                                  .clear();
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
                  );
                })),
      ),
    );
  }
}
