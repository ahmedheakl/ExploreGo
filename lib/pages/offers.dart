import 'package:explorego/pages/favourites.dart';
import 'package:explorego/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:explorego/pages/settings.dart';
import 'package:explorego/components/offer_item.dart';

const Color notActiveColor = Color.fromARGB(255, 106, 111, 141);
const Color activeColor = Color.fromARGB(255, 195, 10, 4);
const Color backgroundColor = Color.fromARGB(255, 248, 249, 252);
const Color greenColor = Color.fromARGB(255, 45, 139, 31);
const Color redColor = Color.fromARGB(255, 195, 10, 4);

class OffersPage extends StatefulWidget {
  OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  List<List<dynamic>> offersList = [
    // imagePath, provider, percent, id
    ["assets/offer1.jpg", "H&M", 40.0, 1],
    ["assets/offer2.jpg", "Zara", 25.0, 2],
    ["assets/offer3.webp", "Adidas", 30.0, 3]
  ];

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
                      child: ListView.builder(
                        itemCount: offersList.length,
                        itemBuilder: (context, index) =>
                            OfferItem(offersList[index]),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.home_outlined,
                                size: 35, color: notActiveColor),
                            Text("Home",
                                style: TextStyle(color: notActiveColor))
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          print("Already Here");
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.local_offer_rounded,
                                size: 35, color: activeColor),
                            Text(
                              "Offers",
                              style: TextStyle(color: activeColor),
                            )
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavouritesPage()));
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.star_border_rounded,
                                size: 35, color: notActiveColor),
                            Text("Favorites",
                                style: TextStyle(color: notActiveColor))
                          ],
                        )),
                  ],
                ))),
      ),
    ));
  }
}
