import 'package:flutter/material.dart';
import '../Components/Dialogs.dart';
import '../Components/PrivacySettings.dart';
import '../Constants/Colors.dart';
import '../Constants/Controller.dart';
import 'Browser_ChangePassword.dart';

class BrowserPrivacyPage extends StatefulWidget {
  const BrowserPrivacyPage({super.key});
  static String id = 'BrowserPrivacyPage';

  @override
  State<BrowserPrivacyPage> createState() => _BrowserPrivacyPageState();
}

class _BrowserPrivacyPageState extends State<BrowserPrivacyPage> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: Column(
              children: [
                privacyEditing(
                    icon: Icons.call,
                    label: 'رقم الهاتف',
                    onPressedIconButton: () {
                      showDialog(
                        context: context,
                        builder: (context) => Form(
                          key: formState,
                          child: editingPrivacyDialog(
                              controller: browserPrivacyEditingPhone,
                              onChanged: (text) {},
                              validator: (text) {
                                if (!RegExp(r'^(\+?963|0)?9\d{8}$')
                                    .hasMatch(text!)) {
                                  return 'الرجاء التأكد من رقم الجوال';
                                }
                              },
                              keyboardType: TextInputType.number,
                              onCancelPressed: () {
                                Navigator.of(context).pop();
                              },
                              onOkPressed: () {
                                print('not null');
                              },
                              prefixIcon: Icons.call,
                              title: 'رقم الهاتف',
                              hint: 'أدخل رقم الهاتف'),
                        ),
                      );
                    },
                    value: 'رقم الهاتف'),
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
                    value: 'كلمة السر'),
                const SizedBox(
                  height: 15,
                ),
                privacyEditing(
                    icon: Icons.location_on,
                    label: 'الموقع',
                    onPressedIconButton: () {
                      showDialog(
                      context: context,
                      builder: (context) => editingPrivacyDialog(
                          controller: browserPrivacyEditingLocation,
                          onChanged: (text) {},
                          validator: (text) {
                            if (text!.length < 3) {
                              return 'الموقع يجب أن يكون 3 أحرف على الأقل';
                            }
                          },
                          keyboardType: TextInputType.name,
                          onCancelPressed: () {
                            Navigator.of(context).pop();
                            setState(() {});
                          },
                          onOkPressed: () {},
                          prefixIcon: Icons.location_on,
                          title: 'الموقع',
                          hint: 'أدخل الموقع'),
                    );
                    },
                    value: 'الموقع'),
              ],
            )),
      ),
    );
  }
}
