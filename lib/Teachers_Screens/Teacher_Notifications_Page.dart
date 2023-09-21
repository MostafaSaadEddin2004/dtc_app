import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:dtc_app/api/services/notification_service.dart';
import 'package:flutter/material.dart';
import '../Components/Notifications.dart';
import '../Start_App_Screens/SignUp_Type.dart';
import 'Teacher_Profile_Page.dart';

class TeacherNotificationsPage extends StatefulWidget {
  const TeacherNotificationsPage({super.key});
  static String id = '/TeacherNotificationsPage';

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
          child: FutureBuilder(
              future: AuthServices.getUserInformation(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !mounted) return Loading();
                final users = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(left: 15, top: 50, right: 15),
                  child: Column(children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .popAndPushNamed(TeacherProfilePage.id);
                          },
                          child: CircleAvatar(
                              minRadius: 30,
                              maxRadius: 30,
                              backgroundColor: WhiteColor,
                              // ignore: unnecessary_null_comparison
                              child: users.image.toString() == null
                                  ? Icon(
                                      Icons.person,
                                      color: PrimaryColor,
                                      size: 45,
                                    )
                                  : Image.network(
                                      users.image.toString(),
                                      fit: BoxFit.cover,
                                      height: 30,
                                      width: 30,
                                    )),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              users.first_name_en.toString() +
                                  ' ' +
                                  users.last_name_en.toString(),
                              style: TextStyle(
                                  color: WhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              users.email.toString(),
                              style: TextStyle(
                                color: WhiteColor,
                                fontSize: 10,
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
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        AuthServices.postLogout();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          SignUpType.id,
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.exit_to_app_rounded,
                            color: RedColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'تسجيل الخروج',
                            style: TextStyle(
                                color: RedColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ]),
                );
              }),
        ),
        body: FutureBuilder(
            future: NotificationService.getNotifications(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || !mounted) return Loading();
              final notification = snapshot.data!;
              return ListView.builder(
                itemCount: notification.length,
                itemBuilder: (context, index) => notificationsBubble(
                    notificationTitle: notification[index].title,
                    notificationBody: notification[index].body,
                    notificationImage: 'assets/images/DTC_LOGO.png',
                    time: notification[index].created_at),
              );
            }));
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