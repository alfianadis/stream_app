import 'package:flutter/material.dart';
import 'package:test_bnetfit/utils/colors.dart';
import 'package:test_bnetfit/utils/images.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 75,
                    height: 100,
                    child: Image.asset("assets/images/logo_bnetfit.png"),
                  ),
                  Row(
                    children: [
                      InkWell(
                        radius: 8,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Image.asset(ic_search,
                            fit: BoxFit.contain,
                            color: Colors.white,
                            height: 20,
                            width: 20),
                      ),
                      SizedBox(width: 16),
                      InkWell(
                        radius: 8,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Image.asset(ic_blog,
                            fit: BoxFit.contain,
                            color: Colors.white,
                            height: 20,
                            width: 20),
                      ),
                      SizedBox(width: 16),
                      InkWell(
                        radius: 8,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {},
                        child: Image.asset(add_user,
                            fit: BoxFit.contain,
                            color: Colors.white,
                            height: 20,
                            width: 20),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
