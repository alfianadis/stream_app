import 'package:flutter/material.dart';
import 'package:test_bnetfit/utils/colors.dart';
import 'package:test_bnetfit/utils/round_button.dart';
import 'package:test_bnetfit/utils/round_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

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
                Container(
                  width: size.width,
                  height: size.width * 0.5,
                  alignment: const Alignment(0, 0.5),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset(
                      "assets/img/app_logo.png",
                      width: size.width * 0.30,
                      height: size.width * 0.30,
                    ),
                  ),
                ),
                Text(
                  "FORGOT PASSWORD?",
                  style: TextStyle(
                      color: AppColors.text,
                      fontSize: 13,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Enter the email address you used to\ncreate your account and we will email\nyou a link to reset your password",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.subtext, fontSize: 15),
                ),
                const SizedBox(
                  height: 30,
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
                RoundButton(
                  title: "SEND EMAIL",
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
