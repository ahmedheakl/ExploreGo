import 'package:explorego/components/favourites_item.dart';
import 'package:explorego/pages/home.dart';
import 'package:explorego/pages/offers.dart';
import 'package:flutter/material.dart';
import 'package:explorego/pages/settings.dart';
import 'package:explorego/models/favourite.dart';
import 'package:provider/provider.dart';

const Color notActiveColor = Color.fromARGB(255, 106, 111, 141);
const Color activeColor = Color.fromARGB(255, 195, 10, 4);
const Color backgroundColor = Color.fromARGB(255, 248, 249, 252);
const Color greenColor = Color.fromARGB(255, 45, 139, 31);

class FavouritesPage extends StatefulWidget {
  FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<Favourite> favouritesList = [];
  TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> _searchFormKey = GlobalKey<FormState>();

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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                    key: _searchFormKey,
                    child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search_rounded,
                              size: 20,
                              color: Color.fromARGB(255, 165, 165, 165)),
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          suffix: GestureDetector(
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                searchController.clear();
                              },
                              child: const Icon(Icons.highlight_off_rounded,
                                  size: 20,
                                  color: Color.fromARGB(255, 165, 165, 165))),
                          hintText: "Search a store"),
                    )),
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Consumer<FavouriteProvider>(
                        builder: (context, fav, child) => ListView.builder(
                          itemCount: fav.items.length,
                          itemBuilder: (context, index) =>
                              FavouritesItem(fav.items[index]),
                        ),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OffersPage()));
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.local_offer_outlined,
                                size: 35, color: notActiveColor),
                            Text(
                              "Offers",
                              style: TextStyle(color: notActiveColor),
                            )
                          ],
                        )),
                    GestureDetector(
                        onTap: () {
                          print("Alreay HERE!!");
                        },
                        child: Column(
                          children: const [
                            Icon(Icons.star_rate_rounded,
                                size: 35, color: activeColor),
                            Text("Favorites",
                                style: TextStyle(color: activeColor))
                          ],
                        )),
                  ],
                ))),
      ),
    ));
  }
}
