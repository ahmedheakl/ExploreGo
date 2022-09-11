import 'package:flutter/material.dart';
import 'package:explorego/pages/settings_page.dart';
import 'package:explorego/components/offer_item.dart';

const Color notActiveColor = Color.fromARGB(255, 106, 111, 141);
const Color activeColor = Color.fromARGB(255, 195, 10, 4);
const Color backgroundColor = Color.fromARGB(255, 248, 249, 252);
const Color greenColor = Color.fromARGB(255, 45, 139, 31);

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

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
    ));
  }
}
