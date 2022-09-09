import 'package:flutter/material.dart';
import 'package:explorego/pages/settings.dart';
import 'package:explorego/pages/favourites.dart';
import 'package:explorego/pages/offers.dart';

const Color notActiveColor = Color.fromARGB(255, 106, 111, 141);
const Color activeColor = Color.fromARGB(255, 195, 10, 4);
const Color backgroundColor = Color.fromARGB(255, 248, 249, 252);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.account_circle,
          size: 30,
          color: notActiveColor,
        ),
        title: const Center(
            child: Text("ExploGo",
                style: TextStyle(
                    fontSize: 30,
                    color: activeColor,
                    fontWeight: FontWeight.bold))),
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
                      size: 30, color: notActiveColor))),
        ],
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: Container(
          decoration: const BoxDecoration(color: backgroundColor),
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const Text("///TeXTBAR"),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        children: [
                          Card(
                              child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: AssetImage(
                                            "assets/mall_of_egypt.jpg"),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: const Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 35),
                                      child: Text(
                                        "Mall of Egypt",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )))),
                          Card(
                              child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/mall_of_arabia.jpg"),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: const Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 20),
                                      child: Text(
                                        "Mall of Arabia",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )))),
                          Card(
                              child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: AssetImage(
                                            "assets/cairo_festival_city.jpg"),
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: const Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, top: 35),
                                      child: Text(
                                        "Cairo Festival City",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ))))
                        ],
                      )))
            ],
          )),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
            height: 65,
            child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _active = 0;
                          });
                        },
                        child: Column(
                          children: [
                            Icon(
                                _active == 0
                                    ? Icons.home_rounded
                                    : Icons.home_outlined,
                                size: 35,
                                color: _active == 0
                                    ? activeColor
                                    : notActiveColor),
                            Text("Home",
                                style: TextStyle(
                                    color: _active == 0
                                        ? activeColor
                                        : notActiveColor))
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OffersPage()));
                        },
                        child: Column(
                          children: [
                            Icon(
                                _active == 1
                                    ? Icons.local_offer_rounded
                                    : Icons.local_offer_outlined,
                                size: 35,
                                color: _active == 1
                                    ? activeColor
                                    : notActiveColor),
                            Text(
                              "Offers",
                              style: TextStyle(
                                  color: _active == 1
                                      ? activeColor
                                      : notActiveColor),
                            )
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            _active = 2;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavouritesPage()));
                        },
                        child: Column(
                          children: [
                            Icon(
                                _active == 2
                                    ? Icons.star_rate_rounded
                                    : Icons.star_border_rounded,
                                size: 35,
                                color: _active == 2
                                    ? activeColor
                                    : notActiveColor),
                            Text("Favorites",
                                style: TextStyle(
                                    color: _active == 2
                                        ? activeColor
                                        : notActiveColor))
                          ],
                        )),
                  ],
                ))),
      ),
    ));
  }
}
