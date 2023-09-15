import 'dart:io';
import 'package:dtc_app/Components/Dialogs.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Components/Buttons.dart';
import '../../../Components/CustomAppBar.dart';
import '../../../Components/Documents_card.dart';
import '../../../Components/Label.dart';
import '../../../Constants/Colors.dart';
import '../../../Constants/Controller.dart';
import '../../Student_Start_Page.dart';

class RequiredDocuments extends StatefulWidget {
  const RequiredDocuments({super.key});
  static String id = "RequiredDocuments";

  @override
  State<RequiredDocuments> createState() => _RequiredDocumentsState();
}

GlobalKey<FormState> formState = GlobalKey<FormState>();

class _RequiredDocumentsState extends State<RequiredDocuments> {
  bool gallery = false;
  bool camera = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  if (identifyImagePath != null) {
                    showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: Center(
                              child: Stack(children: [
                            Image.file(identifyImagePath!),
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
                            message: 'لا يوجد أي صورة... إختر صورة ليتم عرضها',
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
                              padding: const EdgeInsets.symmetric(vertical: 40),
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
                                        .pickImage(source: ImageSource.gallery);
                                    identifyImagePath =
                                        File(identifyImage!.path);
                                    Navigator.of(context).pop();
                                  },
                                  child: gallery == false
                                      ? Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: GreyColor),
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
                                              Icon(Icons.picture_in_picture_alt,
                                                  size: 50, color: WhiteColor),
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
                                        .pickImage(source: ImageSource.camera);
                                    identifyImagePath =
                                        File(identifyImage!.path);
                                    Navigator.of(context).pop();
                                  },
                                  child: camera == false
                                      ? Container(
                                          height: 80,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              border:
                                                  Border.all(color: GreyColor),
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
                                                  size: 50, color: WhiteColor),
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
                    if (certificateImagePath != null) {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: Center(
                                child: Stack(children: [
                              Image.file(certificateImagePath!),
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
                                      certificateImagePath =
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
                                      certificateImage = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.camera);
                                      certificateImagePath =
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
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: DocumentCard(
                  title: 'صورة عن بطاقة الوكالة',
                  onShowPressed: () {
                    if (unCardImagePath != null) {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: Center(
                                child: Stack(children: [
                              Image.file(unCardImagePath!),
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
                                      unCardImagePath = File(unCardImage!.path);
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
                                      unCardImage = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.camera);
                                      unCardImagePath = File(unCardImage!.path);
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
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: DocumentCard(
                  title: 'صورة شخصية',
                  onShowPressed: () {
                    if (personalImagePath != null) {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: Center(
                                child: Stack(children: [
                              Image.file(personalImagePath!),
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
                                      personalImagePath =
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
                                      personalImage = await ImagePicker()
                                          .pickImage(
                                              source: ImageSource.camera);
                                      personalImagePath =
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
                      if (identifyImagePath != null &&
                          certificateImagePath != null &&
                          unCardImagePath != null &&
                          personalImagePath != null) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          StudentStartPage.id,
                          (Route<dynamic> route) => false,
                        );
                      } else {
                        showDialog(
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
    );
  }
}
