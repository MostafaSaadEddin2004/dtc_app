import 'package:dtc_app/api/services/depatrment_post_services.dart';
import 'package:flutter/material.dart';
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
                        child: studentProfileImagePath == null
                            ? Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    color: WhiteColor,
                                    boxShadow: [BoxShadow(blurRadius: 4)],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
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
                                  studentProfileImagePath!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            titleText(text: 'صورة او ملف المنشور'),
                            const SizedBox(
                              height: 10,
                            ),
                            UploadFileTextFormField(
                              controller: postFileController,
                              fileTypeText: 'صورة او ملف للمنشور',
                              onPressedUploadIcon: () {},
                              validator: (text) {
                                return '';
                              },
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
                                  attachment:
                                      postFileController.text.toString());
                              isLoading = false;
                              showDialog(
                                context: context,
                                builder: (context) => CustomDialog(
                                    onPressed: () {
                                      postTextController.clear();
                                      postFileController.clear();
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
