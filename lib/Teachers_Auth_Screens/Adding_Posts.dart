import 'dart:io';

import 'package:dtc_app/api/services/depatrment_post_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:open_file/open_file.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/Dialogs.dart';
import '../Components/TextField.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';

class AddingPostPage extends StatefulWidget {
  const AddingPostPage({super.key});
  static String id = '/AddingPostPage';

  @override
  State<AddingPostPage> createState() => _AddingPostPageState();
}

class _AddingPostPageState extends State<AddingPostPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isThereFile = false;
  XFile? postImageFile;
  File? postImagePath;
  File? postFilePath;
  FilePickerResult? postFile;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: CustomAppBar(title: 'إضافة منشور'),
        body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height - 92,
                  child: Column(
                    children: [
                      registrationInfoTextField(
                        maxLines: 6,
                        controller: postTextController,
                        keyboardType: TextInputType.text,
                        radius: 0,
                        validator: (text) {
                          return null;
                        },
                      ),
                      Container(
                          alignment: Alignment.topCenter,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: WhiteColor,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  offset: Offset(1, 1),
                                  color: GreyColor)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              postImagePath != null || postFile != null
                                  ? Container(
                                      height: 200,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        color: WhiteColor,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              offset: Offset(1, 1),
                                              color: GreyColor)
                                        ],
                                      ),
                                      child: postImagePath == null
                                          ? GestureDetector(
                                              onTap: () {
                                                //  OpenFile.open(
                                                //     postFilePath.toString());
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.file,
                                                    color:
                                                        BlackColor.withOpacity(
                                                            0.6),
                                                    size: 80,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(postFile!
                                                      .files.first.name)
                                                ],
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  barrierDismissible: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 40),
                                                      child: Center(
                                                          child:
                                                              Stack(children: [
                                                        Image.file(
                                                          postImagePath!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Positioned(
                                                            top: 5,
                                                            right: 5,
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Icon(
                                                                Icons.close,
                                                                color:
                                                                    BlackColor,
                                                              ),
                                                            ))
                                                      ])),
                                                    );
                                                  },
                                                );
                                              },
                                              child: Image.file(
                                                postImagePath!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                    )
                                  : const SizedBox(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        postFile = await FilePicker.platform
                                            .pickFiles(allowMultiple: false);
                                        postFilePath =
                                            File(postFile!.files.first.path!);
                                        postImagePath = null;
                                        this.setState(() {});
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.fileCirclePlus,
                                        size: 25,
                                        color: BlackColor.withOpacity(0.7),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        postImageFile = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery);
                                        postImagePath =
                                            File(postImageFile!.path);
                                        this.setState(() {});
                                      },
                                      child: Icon(
                                        FontAwesomeIcons.image,
                                        size: 30,
                                        color: BlackColor.withOpacity(0.7),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        postImageFile = await ImagePicker()
                                            .pickImage(
                                                source: ImageSource.camera);
                                        postImagePath =
                                            File(postImageFile!.path);
                                        this.setState(() {});
                                      },
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 35,
                                        color: BlackColor.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          nextButton(
                            onTap: () {
                              isLoading = true;
                              DepartmentPostServices.postDepartmentPost(
                                  content: postTextController.text.toString(),
                                  attachment: postImagePath != null
                                      ? postImagePath!
                                      : postFilePath!);
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
                                    title: 'إضافة المنشور'),
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
