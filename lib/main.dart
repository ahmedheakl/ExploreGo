import 'package:flutter/material.dart';

const Color notActiveColor = Color.fromARGB(255, 106, 111, 141);
const Color activeColor = Color.fromARGB(255, 195, 10, 4);
const Color backgroundColor = Color.fromARGB(255, 248, 249, 252);

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

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
                          setState(() {
                            _active = 1;
                          });
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

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const Center(
                  child: Text("Settings",
                      style: TextStyle(fontSize: 20, color: Colors.black))),
              backgroundColor: backgroundColor,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_rounded,
                      size: 30, color: notActiveColor)),
              actions: const [
                Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.search_rounded,
                        size: 30, color: notActiveColor)),
              ],
            ),
            body: Container(
                decoration: const BoxDecoration(color: backgroundColor),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Card(
                            child: ListTile(
                          title: const Text("Dmutro",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: const Text("to***@***.com",
                              style: TextStyle(fontSize: 15)),
                          dense: true,
                          leading: const CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage("assets/girl_avatar_test.webp")),
                          trailing: Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 210, 255, 195)),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.check_circle_outline,
                                    size: 20,
                                    color: Color.fromARGB(255, 78, 168, 73)),
                                Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Text("Verified",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                255, 19, 24, 60))))
                              ],
                            ),
                          ),
                        )),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 10),
                            child: Text("Privacy",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Color.fromARGB(255, 106, 111, 141)))),
                        Card(
                            child: Column(children: const [
                          ListTile(
                            leading: Icon(Icons.account_circle_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 106, 111, 141)),
                            title: Text("Profile",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.chevron_right_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 106, 111, 141)),
                          ),
                          Divider(
                            color: Color.fromARGB(255, 217, 219, 229),
                            height: 2,
                            thickness: 2,
                          ),
                          ListTile(
                            leading: Icon(Icons.verified_user_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 106, 111, 141)),
                            title: Text("Security",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.chevron_right_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 106, 111, 141)),
                          )
                        ])),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 10),
                            child: Text("Finance",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Color.fromARGB(255, 106, 111, 141)))),
                        const Card(
                          child: ListTile(
                            leading: Icon(Icons.description_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 106, 111, 141)),
                            title: Text("History",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.chevron_right_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 106, 111, 141)),
                          ),
                        ),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 10),
                            child: Text("Account",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Color.fromARGB(255, 106, 111, 141)))),
                        Card(
                            child: Column(children: const [
                          ListTile(
                            leading: Icon(Icons.collections_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 106, 111, 141)),
                            title: Text("Theme",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.chevron_right_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 106, 111, 141)),
                          ),
                          Divider(
                            color: Color.fromARGB(255, 217, 219, 229),
                            height: 2,
                            thickness: 2,
                          ),
                          ListTile(
                            leading: Icon(Icons.notifications_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 106, 111, 141)),
                            title: Text("Notifications",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.chevron_right_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 106, 111, 141)),
                          )
                        ])),
                        const Padding(
                            padding:
                                EdgeInsets.only(top: 10, bottom: 5, left: 10),
                            child: Text("More",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Color.fromARGB(255, 106, 111, 141)))),
                        Card(
                            child: Column(children: const [
                          ListTile(
                            leading: Icon(Icons.card_giftcard_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 106, 111, 141)),
                            title: Text("My bonus",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.chevron_right_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 106, 111, 141)),
                          ),
                          Divider(
                            color: Color.fromARGB(255, 217, 219, 229),
                            height: 2,
                            thickness: 2,
                          ),
                          ListTile(
                            leading: Icon(Icons.person_add_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 106, 111, 141)),
                            title: Text("Share with friends",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.chevron_right_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 106, 111, 141)),
                          ),
                          Divider(
                            color: Color.fromARGB(255, 217, 219, 229),
                            height: 2,
                            thickness: 2,
                          ),
                          ListTile(
                            leading: Icon(Icons.contact_support_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 106, 111, 141)),
                            title: Text("Support",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            trailing: Icon(Icons.chevron_right_outlined,
                                size: 20,
                                color: Color.fromARGB(255, 106, 111, 141)),
                          )
                        ])),
                      ],
                    ),
                  )
                ])),
            bottomNavigationBar: BottomAppBar(
                child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 63, 103, 248), width: 2),
                        primary: Colors.white,
                      ),
                      child: const Text("Log Out",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 63, 103, 248))),
                      onPressed: () {
                        print("hey");
                      },
                    )))));
  }
}
