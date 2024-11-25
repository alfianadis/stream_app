import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:test_bnetfit/features/movies/movies_detail_screen.dart';
import 'package:test_bnetfit/features/movies/tv_show_details_screen.dart';
import 'package:test_bnetfit/utils/colors.dart';
import 'package:test_bnetfit/utils/images.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List watchArr = [
    "assets/images/mov_1.png",
    "assets/images/mov_2.png",
    "assets/images/mov_3.png",
    "assets/images/mov_4.png",
    "assets/images/mov_1.png",
    "assets/images/mov_2.png",
    "assets/images/mov_3.png",
    "assets/images/mov_4.png",
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MoviesDetailScreen()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            SizedBox(
                              width: size.width,
                              height: size.width * 1.35,
                              child: ClipRect(
                                child: Image.asset(
                                  AppColors.tModeDark
                                      ? "assets/images/home_image_dark.png"
                                      : "assets/images/home_image_light.png",
                                  width: size.width,
                                  height: size.width,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "4.0",
                          style: TextStyle(
                            color: AppColors.text,
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
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Movie",
                              style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              " | ",
                              style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Adventure",
                              style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              " | ",
                              style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Comedy",
                              style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              " | ",
                              style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Family",
                              style: TextStyle(
                                  color: AppColors.text,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
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
                            "Watching",
                            style: TextStyle(
                                color: AppColors.text,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: size.width * 0.46,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: watchArr.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TvShowDetailsScreen()));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              color: AppColors.card,
                              child: ClipRect(
                                child: Image.asset(
                                  watchArr[index].toString(),
                                  width: size.width * 0.33,
                                  height: size.width * 0.45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "New & Upcoming",
                            style: TextStyle(
                                color: AppColors.text,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: size.width * 0.46,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: watchArr.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TvShowDetailsScreen()));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              color: AppColors.card,
                              child: ClipRect(
                                child: Image.asset(
                                  watchArr[index].toString(),
                                  width: size.width * 0.33,
                                  height: size.width * 0.45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Action",
                            style: TextStyle(
                                color: AppColors.text,
                                fontSize: 15,
                                fontWeight: FontWeight.w700),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: size.width * 0.46,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        scrollDirection: Axis.horizontal,
                        itemCount: watchArr.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TvShowDetailsScreen()));
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              color: AppColors.card,
                              child: ClipRect(
                                child: Image.asset(
                                  watchArr[index].toString(),
                                  width: size.width * 0.33,
                                  height: size.width * 0.45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
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
