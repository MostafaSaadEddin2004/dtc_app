import 'package:flutter/material.dart';

import '../Components/Posts.dart';
import '../Constents/Colors.dart';
import '../SignUp_Type.dart';
import 'Browser_Profile_Page.dart';
import 'Registration_Screens/Short_Course/Browser_Personal_Information.dart';

class BrowserCoursePage extends StatefulWidget {
  const BrowserCoursePage({super.key});

  static String id = 'BrowserCoursePage';

  @override
  State<BrowserCoursePage> createState() => _BrowserCoursePageState();
}

class _BrowserCoursePageState extends State<BrowserCoursePage> {
  List<Map> posts = [
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.""",
    },
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.""",
    },
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.""",
    },
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.""",
    },
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.""",
    },
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.""",
    },
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.""",
    },
    {
      'Time': '1:7 مساءً',
      'Poster': 'ناشر المنشور',
      'Images': 'assets/images/Course.jpeg',
      'PostText':
          """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis.""",
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
                        .push(MaterialPageRoute(builder: (context) {
                      return BrowserProfilePage();
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
              onTap: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(SignUpType.id, (route) => false);
              },
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
              onTap: () {},
              child: Row(
                children: const [
                  Icon(
                    Icons.assignment_ind,
                    color: WhiteColor,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'التسجيل كطالب',
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
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(SignUpType.id, (route) => false);
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
          itemBuilder: (context, index) => registerCoursesPost(
            time: posts[index]["Time"].toString(),
            poster: posts[index]["Poster"].toString(),
            postImage: posts[index]['Images'].toString(),
            postText: posts[index]['PostText'].toString(),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BrowserPersonalInformation(),
              ));
            },
          ),
        ),
      ),
    );
  }
}
