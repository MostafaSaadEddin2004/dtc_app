import 'package:flutter/material.dart';
import '../Components/CustomAppBar.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import '../Constants/TextStyle.dart';

class EditingPostPage extends StatefulWidget {
  const EditingPostPage({super.key});
  static String id = '/EditingPostPage';

  @override
  State<EditingPostPage> createState() => _EditingPostPageState();
}

class _EditingPostPageState extends State<EditingPostPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تعديل المنشور'),
      body: Form(
          key: formState,
          child: SingleChildScrollView(
            child: Container(
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
                            controller: editingPostTextController,
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
                                borderSide: const BorderSide(color: GreyColor),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          )),
    );
  }
}
