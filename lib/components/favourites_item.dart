import 'package:flutter/material.dart';
import 'package:explorego/models/favourite.dart';

const Color greenColor = Color.fromARGB(255, 45, 139, 31);

class FavouritesItem extends StatelessWidget {
  Favourite favourite;

  FavouritesItem(this.favourite, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: Text(favourite.provider,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text(favourite.getPercent(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white))),
            )));
  }
}
