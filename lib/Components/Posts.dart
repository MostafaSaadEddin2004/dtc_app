import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/Colors.dart';
import '../Students_Screens/Student_Home_Page.dart';
import '../Teachers_Auth_Screens/Editing_Posts.dart';

class Change {
  bool isFavorite;
  bool isSaved;
  int count;

  Change(
      {required this.isFavorite, required this.isSaved, required this.count});
}

List<Change> dTCPostChange = posts
    .map((e) => Change(isFavorite: false, isSaved: false, count: 0))
    .toList();
List<Change> departmentPostChange = posts
    .map((e) => Change(isFavorite: false, isSaved: false, count: 0))
    .toList();
List<Change> registerCoursesPostChange = posts
    .map((e) => Change(isFavorite: false, isSaved: false, count: 0))
    .toList();
List<Change> coursesPostChange = posts
    .map((e) => Change(isFavorite: false, isSaved: false, count: 0))
    .toList();

class DTCPosts extends StatefulWidget {
  const DTCPosts({
    super.key,
    required this.time,
    required this.postImage,
    required this.postText,
    this.isFavorite = false,
    this.isSaved = false,
    this.onChange,
    this.count = 0,
  });

  final String time;
  final String postImage;
  final String postText;
  final bool isFavorite;
  final bool isSaved;
  final int count;
  final Function(bool isFavorite, bool isSaved, int count)? onChange;

  @override
  State<DTCPosts> createState() => _DTCPostsState();
}

class _DTCPostsState extends State<DTCPosts> {
  late bool isFavorite = widget.isFavorite;
  late bool isSaved = widget.isSaved;
  late int count = widget.count;
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Text(
                        widget.time,
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
              child: Text(widget.postText),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                print(widget.postImage);
              },
              child: Container(
                width: double.infinity,
                child: widget.postImage == ""
                    ? const SizedBox()
                    : Image.network(widget.postImage, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          count++;
                        } else {
                          count--;
                        }
                        if (widget.onChange != null) {
                          widget.onChange!(isFavorite, isSaved, count);
                        }
                        setState(() {});
                      },
                      icon: isFavorite == false
                          ? Icon(
                              CupertinoIcons.heart,
                            )
                          : Icon(
                              CupertinoIcons.heart_fill,
                              color: RedColor,
                            )),
                  IconButton(
                      onPressed: () {
                        isSaved = !isSaved;
                        if (widget.onChange != null)
                          widget.onChange!(isFavorite, isSaved, count);
                        setState(() {});
                      },
                      icon: isSaved == false
                          ? Icon(
                              Icons.bookmark_border,
                            )
                          : Icon(
                              Icons.bookmark,
                            )),
                  const Spacer(
                    flex: 1,
                  ),
                  Text('$count إعجاب'),
                ],
              ),
            )
          ],
        ));
  }
}

class DepartmentPosts extends StatefulWidget {
  const DepartmentPosts({
    super.key,
    required this.time,
    required this.postImage,
    required this.postText,
    this.isFavorite = false,
    this.isSaved = false,
    this.count = 0,
    this.onChange,
  });
  final String time;
  final String postImage;
  final String postText;
  final bool isFavorite;
  final bool isSaved;
  final int count;
  final Function(bool isFavorite, bool isSaved, int count)? onChange;

  @override
  State<DepartmentPosts> createState() => _DepartmentPostsState();
}

class _DepartmentPostsState extends State<DepartmentPosts> {
  late bool isFavorite = widget.isFavorite;
  late bool isSaved = widget.isSaved;
  late int count = widget.count;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Text(
                        widget.time,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
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
              child: Text(widget.postText),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                print(widget.postImage);
              },
              child: Container(
                width: double.infinity,
                child: widget.postImage == ""
                    ? const SizedBox()
                    : Image.network(widget.postImage, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          count++;
                        } else {
                          count--;
                        }
                        if (widget.onChange != null) {
                          widget.onChange!(isFavorite, isSaved, count);
                        }
                        setState(() {});
                      },
                      icon: isFavorite == false
                          ? const Icon(
                              CupertinoIcons.heart,
                            )
                          : const Icon(
                              CupertinoIcons.heart_fill,
                              color: RedColor,
                            )),
                  IconButton(
                      onPressed: () {
                        isSaved = !isSaved;
                        if (widget.onChange != null)
                          widget.onChange!(isFavorite, isSaved, count);
                        setState(() {});
                      },
                      icon: isSaved == false
                          ? const Icon(
                              Icons.bookmark_border,
                            )
                          : const Icon(
                              Icons.bookmark,
                              color: BlackColor,
                            )),
                  const Spacer(
                    flex: 1,
                  ),
                  Text('$count إعجاب'),
                ],
              ),
            )
          ],
        ));
    ;
  }
}

class PostDepartmentPosts extends StatefulWidget {
  const PostDepartmentPosts({
    super.key,
    required this.time,
    required this.depName,
    required this.postImage,
    required this.postText,
    this.isFavorite = false,
    this.isSaved = false,
    this.count = 0,
    this.onChange,
  });
  final String time;
  final String depName;
  final String postImage;
  final String postText;
  final bool isFavorite;
  final bool isSaved;
  final int count;
  final Function(bool isFavorite, bool isSaved, int count)? onChange;

  @override
  State<PostDepartmentPosts> createState() => _PostDepartmentPostsState();
}

class _PostDepartmentPostsState extends State<PostDepartmentPosts> {
  late bool isFavorite = widget.isFavorite;
  late bool isSaved = widget.isSaved;
  late int count = widget.count;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Text(
                        widget.depName,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        widget.time,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            margin: const EdgeInsets.all(15),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.depName,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            widget.time,
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Divider(
                                    color: BlackColor,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(EditingPostPage.id);
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(Icons.edit),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            'تعديل المنشور',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: const [
                                        Icon(Icons.delete),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text('حذف المنشور',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ),
                                  )
                                ]),
                          ),
                        );
                      },
                      icon: const Icon(Icons.more_horiz)),
                ],
              ),
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
              child: Text(widget.postText),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                print(widget.postImage);
              },
              child: Container(
                width: double.infinity,
                child: widget.postImage == ""
                    ? const SizedBox()
                    : Image.network(widget.postImage, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          count++;
                        } else {
                          count--;
                        }
                        if (widget.onChange != null) {
                          widget.onChange!(isFavorite, isSaved, count);
                        }
                        setState(() {});
                      },
                      icon: isFavorite == false
                          ? const Icon(
                              CupertinoIcons.heart,
                            )
                          : const Icon(
                              CupertinoIcons.heart_fill,
                              color: RedColor,
                            )),
                  IconButton(
                      onPressed: () {
                        isSaved = !isSaved;
                        if (widget.onChange != null)
                          widget.onChange!(isFavorite, isSaved, count);
                        setState(() {});
                      },
                      icon: isSaved == false
                          ? const Icon(
                              Icons.bookmark_border,
                            )
                          : const Icon(
                              Icons.bookmark,
                              color: BlackColor,
                            )),
                  const Spacer(
                    flex: 1,
                  ),
                  Text('$count إعجاب'),
                ],
              ),
            )
          ],
        ));
    ;
  }
}

class RegisterCoursesPost extends StatefulWidget {
  const RegisterCoursesPost(
      {super.key,
      required this.time,
      required this.postImage,
      required this.postText,
      this.isFavorite = false,
      this.isSaved = false,
      this.count = 0,
      this.onChange,
      required this.onTap});

  final String time;
  final String postImage;
  final String postText;
  final bool isFavorite;
  final bool isSaved;
  final int count;
  final Function(bool isFavorite, bool isSaved, int count)? onChange;
  final void Function() onTap;

  @override
  State<RegisterCoursesPost> createState() => _RegisterCoursesPostState();
}

class _RegisterCoursesPostState extends State<RegisterCoursesPost> {
  late bool isFavorite = widget.isFavorite;
  late bool isSaved = widget.isSaved;
  late int count = widget.count;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Text(
                        'إسم الدورة',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        widget.time,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Text(
                    'مجاني',
                    style: TextStyle(fontSize: 12, color: RedColor),
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
              child: Text(widget.postText),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                print(widget.postImage);
              },
              child: Container(
                width: double.infinity,
                child: widget.postImage == ""
                    ? const SizedBox()
                    : Image.network(widget.postImage, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          count++;
                        } else {
                          count--;
                        }
                        if (widget.onChange != null) {
                          widget.onChange!(isFavorite, isSaved, count);
                        }
                        setState(() {});
                      },
                      icon: isFavorite == false
                          ? const Icon(
                              CupertinoIcons.heart,
                            )
                          : const Icon(
                              CupertinoIcons.heart_fill,
                              color: RedColor,
                            )),
                  IconButton(
                      onPressed: () {
                        isSaved = !isSaved;
                        if (widget.onChange != null)
                          widget.onChange!(isFavorite, isSaved, count);
                        setState(() {});
                      },
                      icon: isSaved == false
                          ? const Icon(
                              Icons.bookmark_border,
                            )
                          : const Icon(
                              Icons.bookmark,
                              color: BlackColor,
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
                  Text('$count إعجاب'),
                ],
              ),
            ),
            InkWell(
              onTap: widget.onTap,
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
    ;
  }
}

class CoursesPost extends StatefulWidget {
  const CoursesPost({
    super.key,
    required this.time,
    required this.postImage,
    required this.postText,
    this.isFavorite = false,
    this.isSaved = false,
    this.count = 0,
    this.onChange,
  });
  final String time;
  final String postImage;
  final String postText;
  final bool isFavorite;
  final bool isSaved;
  final int count;
  final Function(bool isFavorite, bool isSaved, int count)? onChange;
  @override
  State<CoursesPost> createState() => _CoursesPostState();
}

class _CoursesPostState extends State<CoursesPost> {
  late bool isFavorite = widget.isFavorite;
  late bool isSaved = widget.isSaved;
  late int count = widget.count;
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    children: [
                      const Text(
                        'إسم الدورة',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        widget.time,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  const Text(
                    'مجاني',
                    style: TextStyle(fontSize: 12, color: RedColor),
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
              child: Text(widget.postText),
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                print(widget.postImage);
              },
              child: Container(
                width: double.infinity,
                child: widget.postImage == ""
                    ? const SizedBox()
                    : Image.network(widget.postImage, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        isFavorite = !isFavorite;
                        if (isFavorite) {
                          count++;
                        } else {
                          count--;
                        }
                        if (widget.onChange != null) {
                          widget.onChange!(isFavorite, isSaved, count);
                        }
                        setState(() {});
                      },
                      icon: isFavorite == false
                          ? const Icon(
                              CupertinoIcons.heart,
                            )
                          : const Icon(
                              CupertinoIcons.heart_fill,
                              color: RedColor,
                            )),
                  IconButton(
                      onPressed: () {
                        isSaved = !isSaved;
                        if (widget.onChange != null)
                          widget.onChange!(isFavorite, isSaved, count);
                        setState(() {});
                      },
                      icon: isSaved == false
                          ? const Icon(
                              Icons.bookmark_border,
                            )
                          : const Icon(
                              Icons.bookmark,
                              color: BlackColor,
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
                  Text('$count إعجاب'),
                ],
              ),
            ),
          ],
        ));
    ;
  }
}
