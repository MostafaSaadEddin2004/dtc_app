import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:dtc_app/api/services/notification_service.dart';
import 'package:dtc_app/blocs/get_user_information/get_user_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => GetUserInformationCubit(),
      child: Builder(builder: (context) {
        final state =
            BlocProvider.of<GetUserInformationCubit>(context, listen: true)
                .state;
        if (state is! GetUserInformationFetched) return Loading();
        final userData = state.userData;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: PrimaryColor,
              actions: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  height: 30,
                  decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${userData.section}',
                    style: TextStyle(
                        color: WhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                )
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
                                .popAndPushNamed(TeacherProfilePage.id);
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: WhiteColor,
                            backgroundImage: NetworkImage(userData.image != null
                                ? userData.image!
                                : 'assets/images/person.png'),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              userData.first_name_en.toString() +
                                  ' ' +
                                  userData.last_name_en.toString(),
                              style: TextStyle(
                                  color: WhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              userData.email.toString(),
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
                )),
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
      }),
    );
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