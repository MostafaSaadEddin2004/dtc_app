import 'package:flutter/material.dart';
import '../Components/Posts.dart';
import '../Constents/Colors.dart';
import '../Registering_Screens/SignUp_Screen.dart';
import 'Teacher_Auth_Profile_Page.dart';

class TeacherAuthHomePage extends StatefulWidget {
  const TeacherAuthHomePage({super.key});

  static String id = 'TeacherAuthHomePage';

  @override
  State<TeacherAuthHomePage> createState() => _TeacherAuthHomePageState();
}

class _TeacherAuthHomePageState extends State<TeacherAuthHomePage> {
  List<Map> posts = [
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'Time': '2:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Graduation.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'Time': '3:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': '',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'Time': '4:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'Time': '5:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Graduation.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'Time': '6:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': '',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'Time': '7:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
    {
      'Time': '8:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Graduation.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis."""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        actions: [
          Container(
            alignment: Alignment.center,
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'IT / IT',
              style: TextStyle(
                  color: WhiteColor, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
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
                      return TeacherAuthProfilePage();
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
                Navigator.of(context).pushReplacementNamed(SignUpScreen.id);
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
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => Posts(
              time: posts[index]["Time"].toString(),
              Poster: posts[index]["Poster"].toString(),
              PostImage: posts[index]['Images'].toString(),
              postText: posts[index]['PostText'].toString()),
        ),
      ),
    );
  }
}
