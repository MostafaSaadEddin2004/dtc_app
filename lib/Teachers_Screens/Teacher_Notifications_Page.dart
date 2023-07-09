import 'package:dtc_app/Components/BottomNavBar.dart';
import 'package:dtc_app/Constents/Colors.dart';
import 'package:flutter/material.dart';
import '../Components/Notifications.dart';
import '../SignUp_Type.dart';
import 'Teacher_Profile_Page.dart';

class TeacherNotificationsPage extends StatefulWidget {
  const TeacherNotificationsPage({super.key});
  static String id = 'TeacherNotificationsPage';

  @override
  State<TeacherNotificationsPage> createState() =>
      _TeacherNotificationsPageState();
}

class _TeacherNotificationsPageState extends State<TeacherNotificationsPage> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: PrimaryColor,
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              height: 30,
              width: 60,
              decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'IT',
                style: TextStyle(
                    color: WhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: PrimaryColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
            child: Column(children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (contex) {
                        return TeacherProfilePage();
                      }));
                    },
                    child: const CircleAvatar(
                      minRadius: 30,
                      maxRadius: 30,
                      backgroundColor: WhiteColor,
                      child: Icon(
                        Icons.person,
                        color: PrimaryColor,
                        size: 45,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: const [
                      Text(
                        'إسم المستخدم',
                        style: TextStyle(
                            color: WhiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '1A2B3C',
                        style: TextStyle(
                          color: WhiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(color: WhiteColor, thickness: 2),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Icon(
                      Icons.location_on,
                      color: WhiteColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'موقع المعهد',
                      style: TextStyle(
                          color: WhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: const [
                    Icon(
                      Icons.people,
                      color: WhiteColor,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'دعوة صديق',
                      style: TextStyle(
                          color: WhiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(SignUpType.id);
                },
                child: Row(
                  children: const [
                    Text(
                      'تسجيل الخروج',
                      style: TextStyle(
                          color: RedColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.exit_to_app_rounded,
                      color: RedColor,
                      size: 30,
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => notificationsBubble(
              notificationImage: 'assets/images/DTC_LOGO.png',
              notificationText:
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.""",
              time: '10:10 صباحاً'),
        ));
  }
}








// SafeArea(
//       child: Card(
//         elevation: 5,
//         child: ListTile(
//           leading: Icon(Icons.person),
//           title: Text('Title'),
//           subtitle: Text('SubTitle'),
//           trailing: Icon(Icons.ac_unit),
//           isThreeLine: true,
//         ),
//       ),
//     )