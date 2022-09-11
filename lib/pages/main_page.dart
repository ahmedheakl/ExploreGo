import 'package:explorego/pages/settings_page.dart';
import 'package:explorego/providers/user_provider.dart';
import 'package:explorego/utils/global_variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:explorego/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:explorego/models/user_model.dart' as model;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _page = 0;
  late PageController pageController;
  model.User? user;

  @override
  void initState() {
    super.initState();
    getData();
    pageController = PageController();
  }

  getData() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
    setState(() {
      user = userProvider.getUser;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTap(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: user != null
              ? Consumer<UserProvider>(builder: (context, userProv, child) {
                  return CircleAvatar(
                    backgroundImage: NetworkImage(userProv.getUser.photoUrl),
                    radius: 20,
                  );
                })
              : const Icon(Icons.person_off_outlined,
                  size: 20, color: secondaryColor),
          centerTitle: true,
          title: const Text("ExploGo",
              style: TextStyle(
                  fontSize: 30, color: redColor, fontWeight: FontWeight.bold)),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()));
                    },
                    child: const Icon(Icons.settings_rounded,
                        size: 30, color: secondaryColor))),
          ],
          backgroundColor: lightWhiteColor,
          elevation: 0,
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: onPageChange,
          children: homePageItems,
        ),
        bottomNavigationBar: CupertinoTabBar(
            onTap: navigationTap,
            currentIndex: _page,
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 0 ? Icons.home_rounded : Icons.home_outlined,
                  color: (_page == 0) ? redColor : secondaryColor,
                  size: 35,
                ),
                label: 'Home',
                backgroundColor: redColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 1
                      ? Icons.local_offer_rounded
                      : Icons.local_offer_outlined,
                  color: (_page == 1) ? redColor : secondaryColor,
                  size: 35,
                ),
                label: 'Offers',
                backgroundColor: redColor,
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _page == 2
                      ? Icons.star_rate_rounded
                      : Icons.star_border_rounded,
                  color: (_page == 2) ? redColor : secondaryColor,
                  size: 35,
                ),
                label: 'Favorites',
                backgroundColor: redColor,
              ),
            ]),
      ),
    );
  }
}
