import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_bnetfit/features/movies/cast_detail_screen.dart';
import 'package:test_bnetfit/utils/colors.dart';
import 'package:test_bnetfit/utils/round_button.dart';

class MoviesDetailScreen extends StatefulWidget {
  const MoviesDetailScreen({super.key});

  @override
  State<MoviesDetailScreen> createState() => _MoviesDetailScreenState();
}

class _MoviesDetailScreenState extends State<MoviesDetailScreen> {
  List castArr = [
    {
      "name": "Isabela Moner",
      "image": "",
    },
    {
      "name": "Michael Peña",
      "image": "assets/images/Michael Pena.png",
    },
    {
      "name": "Eva Longoria",
      "image": "assets/images/Eva Longoria.png",
    },
    {
      "name": "Eugenio Derbez",
      "image": "",
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
                      height: size.width * 0.8,
                      child: ClipRect(
                        child: Image.asset(
                          "assets/img/mov_detail.png",
                          width: size.width,
                          height: size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.width * 0.8,
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
                    Container(
                      width: size.width,
                      height: size.width * 0.8,
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {},
                        child: Image.asset("assets/img/play-button.png",
                            width: 55, height: 55),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Dora and the lost city of gold",
                            style: TextStyle(
                                color: AppColors.bgText,
                                fontSize: 19,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Movie",
                                style: TextStyle(
                                    color: AppColors.bgText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                " | ",
                                style: TextStyle(
                                    color: AppColors.bgText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Adventure",
                                style: TextStyle(
                                    color: AppColors.bgText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                " | ",
                                style: TextStyle(
                                    color: AppColors.bgText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Comedy",
                                style: TextStyle(
                                    color: AppColors.bgText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                " | ",
                                style: TextStyle(
                                    color: AppColors.bgText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Family",
                                style: TextStyle(
                                    color: AppColors.bgText,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Text(
                  "4.0",
                  style: TextStyle(
                    color: AppColors.bgText,
                    fontSize: 33,
                  ),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: RatingBar(
                    initialRating: 2,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 18,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    ratingWidget: RatingWidget(
                      full: Image.asset("assets/images/star_fill.png"),
                      half: Image.asset("assets/images/star.png"),
                      empty: Image.asset("assets/images/star.png"),
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school. ",
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 150,
                  child: RoundButton(
                    title: "WATCH NOW",
                    height: 40,
                    onPressed: () {
                      //  Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             const MainTabView()));
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Cast",
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
                      itemCount: castArr.length,
                      itemBuilder: (context, index) {
                        var cObj = castArr[index] as Map? ?? {};
                        var image = cObj["image"].toString();

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CastDetailScreen()));
                          },
                          child: Column(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
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
                          ),
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
                            "assets/img/back_btn.png",
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
