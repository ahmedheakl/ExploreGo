import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:explorego/models/favourite.dart';

const Color redColor = Color.fromARGB(255, 195, 10, 4);
const Color greenColor = Color.fromARGB(255, 45, 139, 31);
const Color lightRedColor = Color.fromARGB(255, 180, 77, 73);

Favourite getFav(List<dynamic> offer) {
  return Favourite(
      id: offer[3], imagePath: offer[0], provider: offer[1], percent: offer[2]);
}

class OfferItem extends StatelessWidget {
  List<dynamic> offer = [];
  OfferItem(this.offer, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image(image: AssetImage(offer[0])),
            Consumer<FavouriteProvider>(
                builder: (context, fav, child) => GestureDetector(
                      onTap: () {
                        Favourite favourite = getFav(offer);
                        if (!fav.exists(favourite)) {
                          fav.addFav(favourite);
                        } else {
                          fav.remove(favourite);
                        }
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          decoration: const BoxDecoration(
                              color: redColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              fav.exists(getFav(offer))
                                  ? Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                          color: lightRedColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: Icon(
                                                Icons.auto_delete_rounded,
                                                size: 20,
                                                color: Colors.white),
                                          ),
                                          Text("DELETE",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ))
                                  : Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                          color: greenColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(right: 5),
                                            child: Icon(Icons.star_rate,
                                                size: 20, color: Colors.white),
                                          ),
                                          Text("ADD",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      )),
                              Row(
                                children: const [
                                  Text("Go",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18)),
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 10),
                                      child: Icon(Icons.send_rounded,
                                          size: 20, color: Colors.white)),
                                ],
                              )
                            ],
                          )),
                    ))
          ],
        ));
  }
}
