import 'dart:io';
import 'package:dtc_app/Browsers_Screens/Browser_Start_Page.dart';
import 'package:dtc_app/Components/Dialogs.dart';
import 'package:dtc_app/Constants/Controller.dart';
import 'package:dtc_app/api/services/academic_registraion_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Documents_card.dart';
import '../../../Components/Label.dart';
import '../../../Constants/Colors.dart';

class RequiredDocuments extends StatefulWidget {
  const RequiredDocuments({super.key, required this.specialtyIDs});
  static String id = "RequiredDocuments";
  final List<int> specialtyIDs;

  @override
  State<RequiredDocuments> createState() => _RequiredDocumentsState();
}

GlobalKey<FormState> formState = GlobalKey<FormState>();

class _RequiredDocumentsState extends State<RequiredDocuments> {
  bool gallery = false;
  bool camera = false;
  XFile? identifyImage;
  XFile? certificateImage;
  XFile? unCardImage;
  XFile? personalImage;
  File? identifyImageFile;
  File? certificateImageFile;
  File? unCardImageFile;
  File? personalImageFile;
  bool isLoading = false;
  var studentMarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: CustomAppBar(title: 'طلب الانتساب'),
        body: Form(
          key: formState,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  labelStyle(text: 'الأوراق المطلوبة'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: DocumentCard(
                  title: 'صورة عن إخراج القيد أو صورة عن الهوية الشخصية',
                  onShowPressed: () {
                    if (identifyImageFile != null) {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: Center(
                                child: Stack(children: [
                              Image.file(identifyImageFile!),
                              Positioned(
                                  top: 5,
                                  right: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: BlackColor,
                                    ),
                                  ))
                            ])),
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return warningDialog(
                              title: 'إنتبه',
                              message:
                                  'لا يوجد أي صورة... إختر صورة ليتم عرضها',
                              onPressed: () {
                                Navigator.of(context).pop();
                              });
                        },
                      );
                    }
                  },
                  onUploadPressed: () {
                    camera = false;
                    gallery = false;
                    setState(() {});
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 40),
                                child: Row(children: [
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        gallery = true;
                                        camera = false;
                                      });
                                      identifyImage = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.gallery);
                                      identifyImageFile =
                                          File(identifyImage!.path);
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
                                                    const BorderRadius.all(
                                                        Radius.circular(20))),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                  Icons.picture_in_picture_alt,
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(
                                                    Icons
                                                        .picture_in_picture_alt,
                                                    size: 50,
                                                    color: WhiteColor),
                                                Text(
                                                  'المعرض',
                                                  style: TextStyle(
                                                      color: WhiteColor),
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
                                      setState(() {
                                        gallery = false;
                                        camera = true;
                                      });
                                      identifyImage = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.camera);
                                      identifyImageFile =
                                          File(identifyImage!.path);
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
                                                    const BorderRadius.all(
                                                        Radius.circular(20))),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
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
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20))),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Icon(Icons.camera_alt,
                                                    size: 50,
                                                    color: WhiteColor),
                                                Text(
                                                  'الكاميرا',
                                                  style: TextStyle(
                                                      color: WhiteColor),
                                                )
                                              ],
                                            ),
                                          ),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                ]),
                              );
                            },
                          );
                        });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: DocumentCard(
                    title: 'صورة مصدقة عن الشهادة التي يحملها الطالب',
                    onShowPressed: () {
                      if (certificateImageFile != null) {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Center(
                                  child: Stack(children: [
                                Image.file(certificateImageFile!),
                                Positioned(
                                    top: 5,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: BlackColor,
                                      ),
                                    ))
                              ])),
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return warningDialog(
                                title: 'إنتبه',
                                message:
                                    'لا يوجد أي صورة... إختر صورة ليتم عرضها',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                });
                          },
                        );
                      }
                    },
                    onUploadPressed: () {
                      camera = false;
                      gallery = false;
                      setState(() {});
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  child: Row(children: [
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          gallery = true;
                                          camera = false;
                                        });
                                        certificateImage = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        certificateImageFile =
                                            File(certificateImage!.path);
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
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                      Icons
                                                          .picture_in_picture_alt,
                                                      size: 50,
                                                      color: WhiteColor),
                                                  Text(
                                                    'المعرض',
                                                    style: TextStyle(
                                                        color: WhiteColor),
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
                                        setState(() {
                                          gallery = false;
                                          camera = true;
                                        });
                                        certificateImage = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        certificateImageFile =
                                            File(certificateImage!.path);
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
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(Icons.camera_alt,
                                                      size: 50,
                                                      color: WhiteColor),
                                                  Text(
                                                    'الكاميرا',
                                                    style: TextStyle(
                                                        color: WhiteColor),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                  ]),
                                );
                              },
                            );
                          });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: DocumentCard(
                    title: 'صورة عن بطاقة الوكالة',
                    onShowPressed: () {
                      if (unCardImageFile != null) {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Center(
                                  child: Stack(children: [
                                Image.file(unCardImageFile!),
                                Positioned(
                                    top: 5,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: BlackColor,
                                      ),
                                    ))
                              ])),
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return warningDialog(
                                title: 'إنتبه',
                                message:
                                    'لا يوجد أي صورة... إختر صورة ليتم عرضها',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                });
                          },
                        );
                      }
                    },
                    onUploadPressed: () {
                      camera = false;
                      gallery = false;
                      setState(() {});
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  child: Row(children: [
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          gallery = true;
                                          camera = false;
                                        });
                                        unCardImage = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        unCardImageFile =
                                            File(unCardImage!.path);
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
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                      Icons
                                                          .picture_in_picture_alt,
                                                      size: 50,
                                                      color: WhiteColor),
                                                  Text(
                                                    'المعرض',
                                                    style: TextStyle(
                                                        color: WhiteColor),
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
                                        setState(() {
                                          gallery = false;
                                          camera = true;
                                        });
                                        unCardImage = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        unCardImageFile =
                                            File(unCardImage!.path);
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
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(Icons.camera_alt,
                                                      size: 50,
                                                      color: WhiteColor),
                                                  Text(
                                                    'الكاميرا',
                                                    style: TextStyle(
                                                        color: WhiteColor),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                  ]),
                                );
                              },
                            );
                          });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: DocumentCard(
                    title: 'صورة شخصية',
                    onShowPressed: () {
                      if (personalImageFile != null) {
                        showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Center(
                                  child: Stack(children: [
                                Image.file(personalImageFile!),
                                Positioned(
                                    top: 5,
                                    right: 5,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Icon(
                                        Icons.close,
                                        color: BlackColor,
                                      ),
                                    ))
                              ])),
                            );
                          },
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return warningDialog(
                                title: 'إنتبه',
                                message:
                                    'لا يوجد أي صورة... إختر صورة ليتم عرضها',
                                onPressed: () {
                                  Navigator.of(context).pop();
                                });
                          },
                        );
                      }
                    },
                    onUploadPressed: () {
                      camera = false;
                      gallery = false;
                      setState(() {});
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 40),
                                  child: Row(children: [
                                    const Spacer(
                                      flex: 1,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          gallery = true;
                                          camera = false;
                                        });
                                        personalImage = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        personalImageFile =
                                            File(personalImage!.path);
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
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(
                                                      Icons
                                                          .picture_in_picture_alt,
                                                      size: 50,
                                                      color: WhiteColor),
                                                  Text(
                                                    'المعرض',
                                                    style: TextStyle(
                                                        color: WhiteColor),
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
                                        setState(() {
                                          gallery = false;
                                          camera = true;
                                        });
                                        personalImage = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        personalImageFile =
                                            File(personalImage!.path);
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
                                                      const BorderRadius.all(
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
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
                                                          Radius.circular(20))),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Icon(Icons.camera_alt,
                                                      size: 50,
                                                      color: WhiteColor),
                                                  Text(
                                                    'الكاميرا',
                                                    style: TextStyle(
                                                        color: WhiteColor),
                                                  )
                                                ],
                                              ),
                                            ),
                                    ),
                                    const Spacer(
                                      flex: 1,
                                    ),
                                  ]),
                                );
                              },
                            );
                          });
                    }),
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
                        if (identifyImageFile != null &&
                            certificateImageFile != null &&
                            unCardImageFile != null &&
                            personalImageFile != null) {
                          isLoading = true;
                          AcademicRegistrationService.postAcademicRegistration(
                              father_name: studentFatherNameController.text,
                              mother_name: studentMotherNameController.text,
                              date_of_birth: studentBirthDateController.text,
                              place_of_birth: studentBirthPlaceController.text,
                              military: studentSoliderController.text,
                              current_address: studentCurrentController.text,
                              address: studentPermanentController.text,
                              name_of_parent: guardianNameController.text,
                              job_of_parent: guardianWorkController.text,
                              phone_of_parent:
                                  guardianPhoneNumberController.text,
                              phone_of_mother:
                                  studentMotherPhoneNumberController.text,
                              avg_mark: studentTotalDegreesController.text,
                              certificate_year: certificationDate,
                              id_image: identifyImageFile!,
                              certificate_image: certificateImageFile!,
                              personal_image: personalImageFile!,
                              un_image: unCardImageFile!,
                              department_ids: widget.specialtyIDs);
                          isLoading = false;
                          studentFatherNameController.clear();
                          studentMotherNameController.clear();
                          studentBirthDateController.clear();
                          studentBirthPlaceController.clear();
                          studentSoliderController.clear();
                          studentCurrentController.clear();
                          studentPermanentController.clear();
                          guardianNameController.clear();
                          guardianWorkController.clear();
                          guardianPhoneNumberController.clear();
                          studentMotherPhoneNumberController.clear();
                          studentTotalDegreesController.clear();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            BrowserStartPage.id,
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return warningDialog(
                                  title: 'إنتبه',
                                  message: 'لم يتم تقديم جميع الأوراق المطلوبة',
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  });
                            },
                          );
                        }
                      }),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
