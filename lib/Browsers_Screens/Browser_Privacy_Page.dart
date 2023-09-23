import 'package:dtc_app/Browsers_Screens/Browser_Start_Page.dart';
import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Components/Dialogs.dart';
import '../Components/PrivacySettings.dart';
import '../Constants/Controller.dart';
import 'Browser_ChangePassword.dart';

class BrowserPrivacyPage extends StatefulWidget {
  const BrowserPrivacyPage({super.key});
  static String id = '/BrowserPrivacyPage';

  @override
  State<BrowserPrivacyPage> createState() => _BrowserPrivacyPageState();
}

class _BrowserPrivacyPageState extends State<BrowserPrivacyPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).popAndPushNamed(BrowserStartPage.id);
        return true;
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: FutureBuilder(
              future: AuthServices.getUserInformation(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !mounted) return Loading();
                final user = snapshot.data!;
                browserPrivacyEditingPhone.text = user.phone;
                return ListView(
                  children: [
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 15, right: 15),
                        child: Column(
                          children: [
                            privacyEditing(
                                icon: Icons.call,
                                label: 'رقم الهاتف',
                                onPressedIconButton: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) => Form(
                                      key: formKey,
                                      child: editingPrivacyDialog(
                                          key: formKey,
                                          controller:
                                              browserPrivacyEditingPhone,
                                          validator: (text) {
                                            if (!RegExp(r'^(\+?963|0)?9\d{8}$')
                                                .hasMatch(text!)) {
                                              return 'الرجاء التأكد من رقم الجوال';
                                            }
                                            return null;
                                          },
                                          keyboardType: TextInputType.number,
                                          onCancelPressed: () {
                                            Navigator.of(context).pop();
                                            browserPrivacyEditingPhone.text =
                                                user.phone;
                                          },
                                          onOkPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              isLoading = true;
                                              AuthServices.postEditProfile(
                                                  phone:
                                                      browserPrivacyEditingPhone
                                                          .text);
                                              isLoading = false;
                                              Navigator.of(context).pop();
                                              setState(() {});
                                            }
                                          },
                                          prefixIcon: Icons.call,
                                          title: 'رقم الهاتف',
                                          hint: 'أدخل رقم الهاتف'),
                                    ),
                                  );
                                },
                                value: user.phone),
                            const SizedBox(
                              height: 15,
                            ),
                            privacyEditing(
                                icon: Icons.lock,
                                label: 'كلمة السر',
                                onPressedIconButton: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const BrowserChangePasswordEnterPassword(),
                                  ));
                                },
                                value: ''),
                          ],
                        )),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
