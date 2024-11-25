import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:test_bnetfit/utils/colors.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  List downloadArr = [
    {
      "name": "Narcos",
      "image": "assets/images/down_1.png",
      "size": "5.02GB",
      "episodes": "4",
      "is_movie": false,
    },
    {
      "name": "Alita Battle Angel",
      "image": "assets/images/down_2.png",
      "size": "1.45GB",
      "episodes": "",
      "is_movie": true,
    },
    {
      "name": "Gotham",
      "image": "assets/images/down_3.png",
      "size": "10.04GB",
      "episodes": "8",
      "is_movie": false,
    },
    {
      "name": "Sacred Games",
      "image": "assets/images/down_4.png",
      "size": "2.02GB",
      "episodes": "3",
      "is_movie": true,
    },
    {
      "name": "Shazam",
      "image": "assets/images/down_5.png",
      "size": "2.32GB",
      "episodes": "",
      "is_movie": true,
    },
    {
      "name": "Toy Story 4",
      "image": "assets/images/down_6.png",
      "size": "3.45GB",
      "episodes": "",
      "is_movie": true,
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
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: downloadArr.length,
          itemBuilder: (context, index) {
            var dObj = downloadArr[index] as Map? ?? {};
            var image = dObj["image"].toString();

            return InkWell(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             const CastDetailsView()));
              },
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    color: AppColors.castBG,
                    width: size.width * 0.35,
                    height: size.width * 0.22,
                    child: image != ""
                        ? ClipRect(
                            child: Image.asset(
                              image,
                              width: size.width * 0.35,
                              height: size.width * 0.22,
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            dObj["name"].toString(),
                            maxLines: 1,
                            style: TextStyle(
                                color: AppColors.text,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            (dObj["is_movie"] as bool? ?? false)
                                ? dObj["size"].toString()
                                : "${dObj["episodes"] ?? ""} Episodes | ${dObj["size"] ?? ""}",
                            style: TextStyle(
                                color: AppColors.subtext, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
