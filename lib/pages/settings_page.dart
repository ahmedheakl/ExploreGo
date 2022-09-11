import 'package:explorego/pages/login_page.dart';
import 'package:explorego/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:explorego/providers/user_provider.dart';
import 'package:explorego/resources/auth_methods.dart';

const Color notActiveColor = Color.fromARGB(255, 106, 111, 141);
const Color activeColor = Color.fromARGB(255, 195, 10, 4);
const Color backgroundColor = Color.fromARGB(255, 248, 249, 252);

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  _promptUserLogoutDialoug(BuildContext parentContext) {
    return showDialog(
        context: parentContext,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("Are you sure?"),
            children: <Widget>[
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Logout"),
                onPressed: () {
                  AuthMethods().signOut();
                  showSnackBar(context, "Logged Out.");
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              title: const Text("Settings",
                  style: TextStyle(fontSize: 20, color: Colors.black)),
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
                            child: Consumer<UserProvider>(
                                builder: (context, userProv, child) => ListTile(
                                      title: Text(userProv.getUser.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      subtitle: Text(userProv.getUser.email,
                                          style: const TextStyle(fontSize: 15)),
                                      dense: true,
                                      leading: CircleAvatar(
                                          radius: 25,
                                          backgroundImage: NetworkImage(
                                              userProv.getUser.photoUrl)),
                                      trailing: Container(
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 210, 255, 195)),
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Icon(Icons.check_circle_outline,
                                                size: 20,
                                                color: Color.fromARGB(
                                                    255, 78, 168, 73)),
                                            Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5),
                                                child: Text("Verified",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Color.fromARGB(
                                                            255, 19, 24, 60))))
                                          ],
                                        ),
                                      ),
                                    ))),
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
                      onPressed: () => _promptUserLogoutDialoug(context),
                      child: const Text("Log Out",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 63, 103, 248))),
                    )))));
  }
}
