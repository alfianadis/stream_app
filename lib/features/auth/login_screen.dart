import 'package:flutter/material.dart';
import 'package:test_bnetfit/features/auth/forgot_password.dart';
import 'package:test_bnetfit/features/auth/register_screen.dart';
import 'package:test_bnetfit/features/homscreen/main_tab.dart';
import 'package:test_bnetfit/utils/colors.dart';
import 'package:test_bnetfit/utils/round_button.dart';
import 'package:test_bnetfit/utils/round_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: size.width,
            height: size.width,
            child: ClipRect(
              child: Transform.scale(
                  scale: 1.3,
                  child: Image.asset(
                    "assets/img/login_top.png",
                    width: size.width,
                    height: size.width,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            width: size.width,
            height: size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColors.bg.withOpacity(0),
                AppColors.bg.withOpacity(0),
                AppColors.bg
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width,
                    height: size.width * 0.75,
                    alignment: const Alignment(0, 0.5),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: AppColors.tModeDark
                              ? Colors.transparent
                              : AppColors.bg,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: AppColors.tModeDark
                              ? null
                              : const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      offset: Offset(0, 4))
                                ]),
                      child: Image.asset(
                        "assets/img/app_logo.png",
                        width: size.width * 0.30,
                        height: size.width * 0.30,
                      ),
                    ),
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
                    right: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()));
                      },
                      child: Text(
                        "FORGOT?",
                        style: TextStyle(
                            color: AppColors.text,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RoundButton(
                    title: "LOGIN",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainTabView()));
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColors.subtext,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Social Logins",
                          style: TextStyle(
                              color: AppColors.text,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: AppColors.subtext,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/img/fb_btn.png",
                          width: 45,
                          height: 45,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/img/google_btn.png",
                          width: 45,
                          height: 45,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Don’t have an account?",
                    style: TextStyle(
                        color: AppColors.subtext,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                          color: AppColors.text,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
