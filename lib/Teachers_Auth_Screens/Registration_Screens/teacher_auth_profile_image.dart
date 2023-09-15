import 'dart:io';
import 'package:dtc_app/Components/Buttons.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/Teachers_Auth_Screens/Registration_Screens/Teacher_Auth_Information_Page.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../Constants/Controller.dart';

class TeacherAuthProfileImage extends StatefulWidget {
  const TeacherAuthProfileImage({super.key});
  static String id = 'TeacherAuthProfileImage';

  @override
  State<TeacherAuthProfileImage> createState() => _TeacherAuthProfileImageState();
}

class _TeacherAuthProfileImageState extends State<TeacherAuthProfileImage> {
  bool gallery = false;
  bool camera = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 60, top: 20, right: 60),
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: teacherAuthProfileImagePath == null
                    ? Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: WhiteColor,
                            boxShadow: [BoxShadow(blurRadius: 4)],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20))),
                        child: Icon(
                          Icons.person,
                          color: BlackColor.withOpacity(0.8),
                          size: 200,
                        ),
                      )
                    : Container(
                        padding: const EdgeInsets.all(2),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            color: WhiteColor,
                            boxShadow: [BoxShadow(blurRadius: 4)],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: Image.file(
                          teacherAuthProfileImagePath!,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: GreyColor),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        camera = false;
                        gallery = false;
                        setState(() {});
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // GestureDetector(
                                        //   child: Icon(Icons.close)),
                                        // const SizedBox(
                                        //   height: 20,
                                        // ),
                                        Row(children: [
                                          const Spacer(
                                            flex: 1,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              gallery = true;
                                              camera = false;
                                              teacherAuthProfileImageFile =
                                                  await ImagePicker().pickImage(
                                                      source:
                                                          ImageSource.gallery);
                                              teacherAuthProfileImagePath = File(
                                                  teacherAuthProfileImageFile!
                                                      .path);
                                              this.setState(() {});
                                              Navigator.of(context).pop();
                                            },
                                            child: gallery == false
                                                ? Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: GreyColor),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons
                                                              .picture_in_picture_alt,
                                                          size: 50,
                                                        ),
                                                        Text('المعرض')
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: const BoxDecoration(
                                                        color: PrimaryColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                            Icons
                                                                .picture_in_picture_alt,
                                                            size: 50,
                                                            color: WhiteColor),
                                                        Text(
                                                          'المعرض',
                                                          style: TextStyle(
                                                              color:
                                                                  WhiteColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                          ),
                                          const Spacer(
                                            flex: 1,
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              gallery = false;
                                              camera = true;
                                              teacherAuthProfileImageFile =
                                                  await ImagePicker().pickImage(
                                                      source:
                                                          ImageSource.camera);
                                              teacherAuthProfileImagePath = File(
                                                  teacherAuthProfileImageFile!
                                                      .path);
                                              this.setState(() {});
                                              Navigator.of(context).pop();
                                            },
                                            child: camera == false
                                                ? Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: GreyColor),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(
                                                          Icons.camera_alt,
                                                          size: 50,
                                                        ),
                                                        Text(
                                                          'الكاميرا',
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : Container(
                                                    height: 80,
                                                    width: 80,
                                                    decoration: const BoxDecoration(
                                                        color: PrimaryColor,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20))),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const [
                                                        Icon(Icons.camera_alt,
                                                            size: 50,
                                                            color: WhiteColor),
                                                        Text(
                                                          'الكاميرا',
                                                          style: TextStyle(
                                                              color:
                                                                  WhiteColor),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                          ),
                                          const Spacer(
                                            flex: 1,
                                          ),
                                        ]),
                                      ],
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: BlackColor.withOpacity(0.8),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      teacherAuthSinUpEnglishFirstNameController.text +
                          teacherAuthSinUpEnglishLastNameController.text,
                      style: TextStyle(fontSize: 20),
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
                        isLoading = true;
                        AuthServices.postRegistration(
                            arFirstName:
                                teacherAuthSinUpFirstNameController.text.toString(),
                            arLastName:
                                teacherAuthSinUpLastNameController.text.toString(),
                            enFirstName: teacherAuthSinUpEnglishFirstNameController
                                .text
                                .toString(),
                            enLastName: teacherAuthSinUpEnglishLastNameController
                                .text
                                .toString(),
                            email: teacherAuthSignUpEmailController.text.toString(),
                            password:
                                teacherAuthSignUpPasswordController.text.toString(),
                            phoneNumber:
                                teacherAuthSignUpPhoneController.text.toString(),
                            role: 'teacher');
                        isLoading = false;
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          TeacherAuthInformationPage.id,
                          (Route<dynamic> route) => false,
                        );
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
    );
  }
}
