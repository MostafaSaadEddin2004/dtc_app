import 'package:flutter/material.dart';

import '../../Components/Buttons.dart';
import '../../Components/CustomAppBar.dart';
import '../../Components/DropDownSearch.dart';
import '../../Components/Label.dart';
import '../../Components/TextField.dart';
import '../../Constents/Colors.dart';
import '../../Constents/TextStyle.dart';
import 'Browser_Other_Information.dart';

class BrowserPersonalInformation extends StatefulWidget {
  const BrowserPersonalInformation({super.key});
  static String id = 'BrowserPersonalInformation';

  @override
  State<BrowserPersonalInformation> createState() =>
      _BrowserPersonalInformationState();
}

class _BrowserPersonalInformationState
    extends State<BrowserPersonalInformation> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController englishFullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  String nationality = '';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: coursePageAppBar(title: 'طلب إنتساب للدورة'),
      body: Form(
          key: formState,
          child: SingleChildScrollView(
            child: Container(
              // height: height,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      labelStyle(text: 'المعلومات شخصية'),
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
                              titleText(text: 'الجنس'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: ['ذكر', 'أنثى'],
                                  onChange: (data) {},
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'الحقل مطلوب';
                                    }
                                  })
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'الحالة الإجتماعية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationDropDownSearch(
                                  hint: '',
                                  items: ['متزوج', 'مخطوب', 'أعزب'],
                                  onChange: (data) {},
                                  validator: (data) {
                                    if (data!.isEmpty) {
                                      return 'الحقل مطلوب';
                                    }
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'الإسم الكامل'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: fullNameController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'الحقل مطلوب';
                                  } else if (text.length < 3) {
                                    return 'الحقل يجب أن يكون 5 أحرف او أكثر';
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
                              titleText(text: 'الإسم الكامل بالإنكليزية'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: englishFullNameController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'الحقل مطلوب';
                                  } else if (text.length < 5) {
                                    return 'الحقل يجب أن يكون 5 أحرف او أكثر';
                                  }
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
                                controller: phoneNumberController,
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
                        titleText(text: 'الإيميل'),
                        const SizedBox(
                          height: 10,
                        ),
                        registrationInfoTextField(
                          controller: emailController,
                          keyboardType: TextInputType.streetAddress,
                          radius: 20,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'الحقل مطلوب';
                            } else if (text.length < 3) {
                              return 'الحقل يجب أن يكون 12 حرف أو أكثر';
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              titleText(text: 'رقم الجوال'),
                              const SizedBox(
                                height: 10,
                              ),
                              registrationInfoTextField(
                                controller: phoneNumberController,
                                keyboardType: TextInputType.name,
                                radius: 20,
                                validator: (text) {
                                  if (text!.isEmpty) {
                                    return 'الحقل مطلوب';
                                  } else if (text.length < 10) {
                                    return 'الحقل يجب أن يكون 10 أرقام';
                                  } else if (text.length > 10) {
                                    return 'الحقل يجب أن يكون 10 أرقام';
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
                                    return 'الحقل مطلوب';
                                  } else if (text.length < 3) {
                                    return 'الحقل يجب أن يكون 3 أحرف أو أكثر';
                                  }
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
                              controller: birthDateController,
                              validator: (text) {
                                if (text!.isEmpty) {
                                  return 'الحقل مطلوب';
                                }
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
                                hintText: 'أنقر على الرمز لإختيار التاريخ',
                                labelStyle: const TextStyle(
                                    color: GreyColor, fontSize: 16),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent)),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.calendar_month),
                                  onPressed: () {},
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      nextButton(
                          text: 'التالي',
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const BrowserOtherInformation(),
                            ));
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
