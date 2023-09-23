import 'package:dtc_app/Components/loading.dart';
import 'package:dtc_app/Constants/Colors.dart';
import 'package:dtc_app/api/services/auth_services.dart';
import 'package:dtc_app/api/services/notification_service.dart';
import 'package:flutter/material.dart';
import '../Components/Notifications.dart';
import '../Start_App_Screens/SignUp_Type.dart';
import 'Browser_Profile_Page.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});
  static String id = '/NotificationsPage';

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
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
