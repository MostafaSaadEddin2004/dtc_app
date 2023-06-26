import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constents/Colors.dart';

Widget Posts({
  required String time,
  required String Poster,
  required String PostImage,
  required String postText,
  final BuildContext? contextParameter,
}) =>
    Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        decoration: BoxDecoration(
          color: WhiteColor,
          border: Border.all(color: GreyColor, width: 0.5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: GreyColor,
              blurRadius: 2,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    minRadius: 25,
                    maxRadius: 25,
                    child: Icon(
                      Icons.person,
                      color: WhiteColor,
                      size: 35,
                    ),
                    backgroundColor: PrimaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'معهد دمشق المتوسط',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(
                        Poster,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        time,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: BlackColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(postText),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                print(PostImage);
              },
              child: Container(
                width: double.infinity,
                child: PostImage == ""
                    ? const SizedBox()
                    : Image.asset(PostImage, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.heart,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_border,
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  const Text('610 إعجاب'),
                ],
              ),
            )
          ],
        ));

Widget departmentPosts({
  required String time,
  required String Poster,
  required String PostImage,
  required String postText,
  final BuildContext? contextParameter,
}) =>
    Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        decoration: BoxDecoration(
          color: WhiteColor,
          border: Border.all(color: GreyColor, width: 0.5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: GreyColor,
              blurRadius: 2,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    minRadius: 25,
                    maxRadius: 25,
                    child: Icon(
                      Icons.person,
                      color: WhiteColor,
                      size: 35,
                    ),
                    backgroundColor: PrimaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'إسم القسم',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        Poster,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        time,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: BlackColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(postText),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                print(PostImage);
              },
              child: Container(
                width: double.infinity,
                child: PostImage == ""
                    ? const SizedBox()
                    : Image.asset(PostImage, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.heart,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_border,
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  const Text('610 تفاعل'),
                ],
              ),
            )
          ],
        ));

Widget coursesPost({
  required String time,
  required String poster,
  required String postImage,
  required String postText,
  required void Function() onTap,
}) =>
    Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        decoration: BoxDecoration(
          color: WhiteColor,
          border: Border.all(color: GreyColor, width: 0.5),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: GreyColor,
              blurRadius: 2,
              offset: Offset(2, 2), // Shadow position
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    minRadius: 25,
                    maxRadius: 25,
                    child: Icon(
                      Icons.person,
                      color: WhiteColor,
                      size: 35,
                    ),
                    backgroundColor: PrimaryColor,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'إسم الدورة',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        poster,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'مجاني',
                        style: TextStyle(fontSize: 12, color: RedColor),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        time,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: BlackColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(postText),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                print(postImage);
              },
              child: Container(
                width: double.infinity,
                child: postImage == ""
                    ? const SizedBox()
                    : Image.asset(postImage, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.heart,
                        fill: 1,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark_border,
                      )),
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Text(
                  //     'Register',
                  //     style: TextStyle(color: PrimaryColor),
                  //   ),
                  // ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Text('610 تفاعل'),
                ],
              ),
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: GreyColor,
                            offset: Offset(0, 0),
                            blurRadius: 2)
                      ]),
                  height: 40,
                  child: const Text(
                    'التسجيل الآن',
                    style: TextStyle(
                        color: WhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
            )
          ],
        ));
