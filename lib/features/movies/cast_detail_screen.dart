import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:test_bnetfit/utils/colors.dart';

class CastDetailScreen extends StatefulWidget {
  const CastDetailScreen({super.key});

  @override
  State<CastDetailScreen> createState() => _CastDetailScreenState();
}

class _CastDetailScreenState extends State<CastDetailScreen> {
  List moviesArr = [
    {
      "name": "Ant Man",
      "image": "assets/images/ant_man.png",
    },
    {
      "name": "End of Watch",
      "image": "assets/images/end_of_wactch.png",
    },
    {
      "name": "American Hustle",
      "image": "assets/images/american_hustle.png",
    },
    {
      "name": "Crash",
      "image": "assets/images/crash.png",
    },
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
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: size.width,
                      height: size.width * 1.1,
                      child: ClipRect(
                        child: Image.asset(
                          AppColors.tModeDark
                              ? "assets/images/michael_dark.png"
                              : "assets/images/michael_light.png",
                          width: size.width,
                          height: size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.width * 1.1,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                            AppColors.bgDark,
                            AppColors.bgDark.withOpacity(0),
                            AppColors.bg.withOpacity(0),
                            AppColors.bg
                          ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Michael",
                            style: TextStyle(
                                color: AppColors.bgText,
                                fontSize: 37,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Peña",
                            style: TextStyle(
                                color: AppColors.bgText,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Michael Peña was born and raised in Chicago, to Nicolasa, a social worker, and Eleuterio Peña, who worked at a button factory. His parents were originally from Mexico.",
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Known for",
                          style: TextStyle(
                              color: AppColors.text,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
                SizedBox(
                  height: (size.width * 0.34) + 40,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      scrollDirection: Axis.horizontal,
                      itemCount: moviesArr.length,
                      itemBuilder: (context, index) {
                        var cObj = moviesArr[index] as Map? ?? {};
                        var image = cObj["image"].toString();

                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              color: AppColors.castBG,
                              width: size.width * 0.25,
                              height: size.width * 0.32,
                              child: image != ""
                                  ? ClipRect(
                                      child: Image.asset(
                                        image,
                                        width: size.width * 0.25,
                                        height: size.width * 0.32,
                                        fit: BoxFit.contain,
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              cObj["name"].toString(),
                              style: TextStyle(
                                color: AppColors.text,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                AppBar(
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
                            "assets/images/back_btn.png",
                            width: 13,
                            height: 13,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "BACK",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary1,
        onPressed: () {
          AppColors.tModeDark = !AppColors.tModeDark;
          FBroadcast.instance().broadcast("change_mode");
          if (mounted) {
            setState(() {});
          }
        },
        child: Icon(
          AppColors.tModeDark ? Icons.light_mode : Icons.dark_mode,
          color: AppColors.text,
        ),
      ),
    );
  }
}
