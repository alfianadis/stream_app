import 'dart:io';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_bnetfit/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  List menuArr = [
    {
      "image": "assets/images/pr_user.png",
      "name": "Account",
    },
    {
      "image": "assets/images/pr_notification.png",
      "name": "Notification",
    },
    {
      "image": "assets/images/pr_settings.png",
      "name": "Setting",
    },
    {
      "image": "assets/images/pr_help.png",
      "name": "Help",
    },
    {
      "image": "assets/images/pr_logout.png",
      "name": "Logout",
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FBroadcast.instance().register("change_mode", (value, callback) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        image =
                            await picker.pickImage(source: ImageSource.gallery);

                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: AppColors.primaryG,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius:
                                BorderRadius.circular(size.width * 0.20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 4))
                            ]),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColors.bg,
                              borderRadius:
                                  BorderRadius.circular(size.width * 0.15),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 6,
                                    offset: Offset(0, 4))
                              ]),
                          child: image != null
                              ? ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.15),
                                  child: Image.file(
                                    File(image!.path),
                                    width: size.width * 0.28,
                                    height: size.width * 0.28,
                                    fit: BoxFit.cover,
                                  ))
                              : ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.15),
                                  child: Image.asset(
                                    "assets/images/user_placeholder.png",
                                    width: size.width * 0.28,
                                    height: size.width * 0.28,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Code For Any",
                      style: TextStyle(
                          color: AppColors.bgText,
                          fontSize: 27,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Premium",
                      style: TextStyle(
                        color: AppColors.primary2,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var mObj = menuArr[index] as Map? ?? {};
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              mObj["image"].toString(),
                              width: 20,
                              height: 20,
                              color: AppColors.text,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              mObj["name"].toString(),
                              style: TextStyle(
                                color: AppColors.text,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                          height: 1,
                          color: AppColors.subtext.withOpacity(0.2),
                        ),
                    itemCount: menuArr.length)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
