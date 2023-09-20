import 'dart:io';

import 'package:dtc_app/api/services/depatrment_post_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/Dialogs.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';

class AddingPostPage extends StatefulWidget {
  const AddingPostPage({super.key});
  static String id = 'AddingPostPage';

  @override
  State<AddingPostPage> createState() => _AddingPostPageState();
}

class _AddingPostPageState extends State<AddingPostPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool gallery = false;
  bool camera = false;
  XFile? postImage;
  File? postImagePath;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: CustomAppBar(title: 'إضافة منشور'),
        body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height - 92,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(
                            left: 60, top: 50, right: 60, bottom: 10),
                        height: 206,
                        width: MediaQuery.of(context).size.width,
                        child: postImagePath == null
                            ? Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: WhiteColor,
                                    boxShadow: [BoxShadow(blurRadius: 4)],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
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
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                child: Image.file(
                                  postImagePath!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                                          await ImagePicker()
                                                              .pickImage(
                                                                  source: ImageSource
                                                                      .gallery);
                                                      teacherAuthProfileImagePath =
                                                          File(
                                                              teacherAuthProfileImageFile!
                                                                  .path);
                                                      this.setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: gallery == false
                                                        ? Container(
                                                            height: 80,
                                                            width: 80,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        GreyColor),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            20))),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
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
                                                                color:
                                                                    PrimaryColor,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const [
                                                                Icon(
                                                                    Icons
                                                                        .picture_in_picture_alt,
                                                                    size: 50,
                                                                    color:
                                                                        WhiteColor),
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
                                                          await ImagePicker()
                                                              .pickImage(
                                                                  source:
                                                                      ImageSource
                                                                          .camera);
                                                      teacherAuthProfileImagePath =
                                                          File(
                                                              teacherAuthProfileImageFile!
                                                                  .path);
                                                      this.setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: camera == false
                                                        ? Container(
                                                            height: 80,
                                                            width: 80,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        GreyColor),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            20))),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const [
                                                                Icon(
                                                                  Icons
                                                                      .camera_alt,
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
                                                                color:
                                                                    PrimaryColor,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const [
                                                                Icon(
                                                                    Icons
                                                                        .camera_alt,
                                                                    size: 50,
                                                                    color:
                                                                        WhiteColor),
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
                                                          await ImagePicker()
                                                              .pickImage(
                                                                  source: ImageSource
                                                                      .gallery);
                                                      teacherAuthProfileImagePath =
                                                          File(
                                                              teacherAuthProfileImageFile!
                                                                  .path);
                                                      this.setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: gallery == false
                                                        ? Container(
                                                            height: 80,
                                                            width: 80,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        GreyColor),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            20))),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
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
                                                                color:
                                                                    PrimaryColor,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const [
                                                                Icon(
                                                                    Icons
                                                                        .picture_in_picture_alt,
                                                                    size: 50,
                                                                    color:
                                                                        WhiteColor),
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
                                                          await ImagePicker()
                                                              .pickImage(
                                                                  source:
                                                                      ImageSource
                                                                          .camera);
                                                      teacherAuthProfileImagePath =
                                                          File(
                                                              teacherAuthProfileImageFile!
                                                                  .path);
                                                      this.setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: camera == false
                                                        ? Container(
                                                            height: 80,
                                                            width: 80,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color:
                                                                        GreyColor),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            20))),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const [
                                                                Icon(
                                                                  Icons
                                                                      .camera_alt,
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
                                                                color:
                                                                    PrimaryColor,
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: const [
                                                                Icon(
                                                                    Icons
                                                                        .camera_alt,
                                                                    size: 50,
                                                                    color:
                                                                        WhiteColor),
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            titleText(text: 'نص المنشور'),
                            const SizedBox(
                              height: 10,
                            ),
                            registrationInfoTextField(
                              maxLines: 6,
                              controller: postTextController,
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
                            onTap: () async {
                              isLoading = true;
                              await DepartmentPostServices.postDepartmentPost(
                                  content: postTextController.text.toString(),
                                  attachment: postImagePath.toString());
                              isLoading = false;
                              showDialog(
                                context: context,
                                builder: (context) => CustomDialog(
                                    onPressed: () {
                                      postTextController.clear();
                                      Navigator.of(context)
                                        ..pop()
                                        ..pop();
                                    },
                                    title: 'إضافة الملاحظة'),
                              );
                            },
                            text: 'إضافة',
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  )),
            )),
      ),
    );
  }
}
