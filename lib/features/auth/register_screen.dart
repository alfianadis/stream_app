import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_bnetfit/utils/colors.dart';
import 'package:test_bnetfit/utils/round_button.dart';
import 'package:test_bnetfit/utils/round_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();

  final ImagePicker picker = ImagePicker();
  XFile? image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 100,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/img/back_btn.png",
                    width: 13,
                    height: 13,
                    color: AppColors.subtext,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "BACK",
                    style: TextStyle(
                        color: AppColors.subtext,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.bg,
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primary1,
          onPressed: () {
            AppColors.tModeDark = !AppColors.tModeDark;
            if (mounted) {
              setState(() {});
            }
          },
          child: Icon(
            AppColors.tModeDark ? Icons.light_mode : Icons.dark_mode,
            color: AppColors.text,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: AppColors.card,
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
                                  width: size.width * 0.18,
                                  height: size.width * 0.18,
                                  fit: BoxFit.cover,
                                ))
                            : ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(size.width * 0.15),
                                child: Image.asset(
                                  "assets/img/user_placeholder.png",
                                  width: size.width * 0.18,
                                  height: size.width * 0.18,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Add profile picture",
                      style: TextStyle(
                          color: AppColors.text,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundTextField(
                  title: "FIRST NAME",
                  hintText: "first name here",
                  controller: txtEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundTextField(
                  title: "LAST NAME",
                  hintText: "last name here",
                  controller: txtEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundTextField(
                  title: "EMAIL",
                  hintText: "email here",
                  keyboardType: TextInputType.emailAddress,
                  controller: txtEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundTextField(
                  title: "PASSWORD",
                  hintText: "password here",
                  obscureText: true,
                  controller: txtPassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                RoundTextField(
                  title: "CONFIRM PASSWORD",
                  hintText: "confirm password here",
                  obscureText: true,
                  controller: txtPassword,
                ),
                const SizedBox(
                  height: 30,
                ),
                RoundButton(
                  title: "REGISTER",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ));
  }
}
