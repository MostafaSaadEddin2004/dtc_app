import 'package:dtc_app/api/services/depatrment_post_services.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Components/Buttons.dart';
import '../Components/CustomAppBar.dart';
import '../Components/Dialogs.dart';
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
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            titleText(text: 'نص المنشور'),
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
                                  maxLines: 6,
                                  onChanged: (data) {},
                                  controller: postTextController,
                                  validator: (text) {},
                                  keyboardType: TextInputType.text,
                                  enabled: true,
                                  cursorColor: GreyColor,
                                  decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    suffixIconColor: BlackColor,
                                    floatingLabelStyle: const TextStyle(
                                      color: BlackColor,
                                    ),
                                    hintText: 'أدخل نص المنشور',
                                    labelStyle: const TextStyle(
                                        color: GreyColor, fontSize: 16),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
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
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          children: [
                            titleText(text: 'صورة او ملف المنشور'),
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
                                  controller: postFileController,
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
                                    hintText:
                                        'أنقر على الرمز لنحميل صورة او ملف للمنشور',
                                    labelStyle: const TextStyle(
                                        color: GreyColor, fontSize: 16),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: const BorderSide(
                                            color: Colors.transparent)),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.upload),
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
                      const Spacer(
                        flex: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          nextButton(
                            onTap: () async {
                              isLoading = true;
                              final post = await DepartmentPostServices
                                  .postDepartmentPost(
                                      content:
                                          postTextController.text.toString(),
                                      attachment: postFileController.text.toString());
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
