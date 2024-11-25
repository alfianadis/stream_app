import 'package:flutter/material.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:test_bnetfit/features/homscreen/homescreen.dart';
import 'package:test_bnetfit/utils/colors.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView>
    with TickerProviderStateMixin {
  int selectTab = 0;
  TabController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
      if (mounted) {
        setState(() {});
      }
    });
    FBroadcast.instance().register("change_mode", (value, callback) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: controller, children: const [
        Homescreen(),
        // SearchView(),
        // DownloadView(),
        // ProfileView(),
      ]),
      backgroundColor: AppColors.bg,
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.tabBG,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          child: TabBar(
              controller: controller,
              indicatorWeight: 0.01,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              unselectedLabelStyle: TextStyle(
                  color: AppColors.subtext,
                  fontSize: 8,
                  fontWeight: FontWeight.w700),
              labelColor: AppColors.primary2,
              unselectedLabelColor: AppColors.subtext,
              labelStyle: TextStyle(
                  color: AppColors.primary2,
                  fontSize: 8,
                  fontWeight: FontWeight.w700),
              tabs: [
                Tab(
                  text: "HOME",
                  icon: Image.asset(
                    "assets/images/tab_home.png",
                    width: 30,
                    height: 30,
                    color:
                        selectTab == 0 ? AppColors.primary2 : AppColors.subtext,
                  ),
                ),
                Tab(
                  text: "SEARCH",
                  icon: Image.asset(
                    "assets/images/tab_search-2.png",
                    width: 30,
                    height: 30,
                    color:
                        selectTab == 1 ? AppColors.primary2 : AppColors.subtext,
                  ),
                ),
                Tab(
                  text: "DOWNLOAD",
                  icon: Image.asset(
                    "assets/images/tab_download.png",
                    width: 30,
                    height: 30,
                    color:
                        selectTab == 2 ? AppColors.primary2 : AppColors.subtext,
                  ),
                ),
                Tab(
                  text: "PROFILE",
                  icon: Image.asset(
                    "assets/images/tab_user.png",
                    width: 30,
                    height: 30,
                    color:
                        selectTab == 3 ? AppColors.primary2 : AppColors.subtext,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
