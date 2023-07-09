import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/DropDownSearch.dart';
import '../Components/Label.dart';
import '../Components/TextField.dart';
import '../Constents/Colors.dart';
import '../Constents/TextStyle.dart';
import 'Browser_Start_Page.dart';

class BrowserInformationPage extends StatefulWidget {
  const BrowserInformationPage({super.key});
  static String id = 'BrowserInformationPage';

  @override
  State<BrowserInformationPage> createState() => _BrowserInformationPageState();
}

class _BrowserInformationPageState extends State<BrowserInformationPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController browserFirstNameController = TextEditingController();
  TextEditingController browserLastNameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController birthPlaceController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController permanentController = TextEditingController();
  TextEditingController browserNationalityController = TextEditingController();
  DateTime? dateTime;
  String nationality = '';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: CustomAppBar(title: 'معلومات المتصفح'),
        body: Form(
          key: formState,
          child: SingleChildScrollView(
            child: Container(
              height: height,
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
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'الإسم'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: browserFirstNameController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'User Name is required';
                                  } else if (text.length < 3) {
                                    return 'User Name must be 3 character at least';
                                  }
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
                              titleText(text: 'الكنية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: browserLastNameController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'User Name is required';
                                  } else if (text.length < 3) {
                                    return 'User Name must be 3 character at least';
                                  }
                                },
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
                    child: Expanded(
                      child: Column(
                        children: [
                          titleText(text: 'الشهادة'),
                          const SizedBox(
                            height: 10,
                          ),
                          registrationInfoTextField(
                            controller: motherNameController,
                            keyboardType: TextInputType.name,
                            radius: 20,
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'User Name is required';
                              } else if (text.length < 3) {
                                return 'User Name must be 3 character at least';
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: nationality == 'فلسطيني مُسجل' || nationality == ''
                        ? Column(
                            children: [
                              titleText(text: 'الجنسية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: ['فلسطيني مُسجل', 'أخرى...'],
                                  onChange: (data) {
                                    setState(() {
                                      nationality = data!;
                                    });
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'االحقل مطلوب';
                                    }
                                  }),
                            ],
                          )
                        : Column(
                            children: [
                              titleText(text: 'الجنسية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: ['فلسطيني مُسجل', 'أخرى...'],
                                  onChange: (data) {
                                    setState(() {
                                      nationality = data!;
                                    });
                                  },
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'االحقل مطلوب';
                                    }
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              titleText(text: 'الجنسية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: browserNationalityController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'الحقل مطلوب';
                                  } else if (text.length < 10) {
                                    return 'الحقل يجب أن يكون 4 أحرف أو أكثر';
                                  } else if (text.length > 10) {
                                    return 'الحقل يجب أن يكون 4 أحرف او أكثر';
                                  }
                                },
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
                                titleText(text: 'الجنسية'),
                                const SizedBox(
                                  height: 10,
                                ),
                                registrationDropDownSearch(
                                    hint: '',
                                    items: ['فلسطيني مُسجل', 'أخرى...'],
                                    onChange: (data) {
                                      setState(() {
                                        nationality = data!;
                                      });
                                    },
                                    validator: (data) {
                                      if (data!.isEmpty) {
                                        return 'االحقل مطلوب';
                                      }
                                    }),
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
                              controller: birthDateController,
                              validator: (text) {},
                              keyboardType: TextInputType.none,
                              enabled: true,
                              cursorColor: GreyColor,
                              decoration: InputDecoration(
                                alignLabelWithHint: true,
                                suffixIconColor: BlackColor,
                                floatingLabelStyle: const TextStyle(
                                  color: BlackColor,
                                ),
                                hintText: 'أنقر على الرمز لإختيار التاريخ',
                                labelStyle: const TextStyle(
                                    color: GreyColor, fontSize: 16),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.calendar_month),
                                  onPressed: () async {
                                    dateTime = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2024),
                                        keyboardType: TextInputType.datetime);
                                    birthDateController.text =
                                        '${dateTime?.day} / ${dateTime?.month} / ${dateTime?.year}';
                                  },
                                ),
                                contentPadding: const EdgeInsets.symmetric(
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
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
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
                                controller: currentController,
                                keyboardType: TextInputType.streetAddress,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'User Name is required';
                                  } else if (text.length < 3) {
                                    return 'User Name must be 3 character at least';
                                  }
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
                                controller: permanentController,
                                keyboardType: TextInputType.streetAddress,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'User Name is required';
                                  } else if (text.length < 3) {
                                    return 'User Name must be 3 character at least';
                                  }
                                },
                              )
                            ],
                          ),
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
                          text: 'التالي',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const BrowserStartPage()));
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
