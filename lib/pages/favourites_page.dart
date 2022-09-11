import 'package:explorego/components/favourites_item.dart';
import 'package:flutter/material.dart';
import 'package:explorego/pages/settings_page.dart';
import 'package:explorego/models/favourite.dart';
import 'package:provider/provider.dart';

const Color notActiveColor = Color.fromARGB(255, 106, 111, 141);
const Color activeColor = Color.fromARGB(255, 195, 10, 4);
const Color backgroundColor = Color.fromARGB(255, 248, 249, 252);
const Color greenColor = Color.fromARGB(255, 45, 139, 31);

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

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
    ));
  }
}
