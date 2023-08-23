import 'package:dtc_app/main.dart';
import 'package:flutter/material.dart';
import '../Components/Buttons.dart';
import '../Constants/Colors.dart';
import 'SignUp_Type.dart';

class StartAppScreen extends StatelessWidget {
  const StartAppScreen({super.key});

  static String id = 'StartAppScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 15, top: 80, right: 15, bottom: 30),
        child: Column(children: [
          Container(
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: Image.asset(
                'assets/images/DTC_LOGO.png',
              )),
          const Text(
            "إنضم إلى رحلتنا",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: WhiteColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                wordSpacing: 2,
                shadows: [
                  Shadow(
                      color: BlackColor, blurRadius: 10, offset: Offset(2, 2))
                ]),
          ),
          const Spacer(
            flex: 1,
          ),
          customButton(
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                SignUpType.id,
                (Route<dynamic> route) => false,
              );
            },
            backgroundColor: PrimaryColor,
            fontSize: 24,
            text: 'البدء',
          ),
        ]),
      ),
    );
  }
}
