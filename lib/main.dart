import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:explorego/models/favourite.dart';
import 'package:explorego/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:explorego/pages/login_page.dart';
import 'package:explorego/pages/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "ExploreGo",
        home: StreamBuilder(
            stream: FirebaseAuth.instance.userChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const MainPage();
                } else if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.red));
              }
              return const LoginPage();
            }),
      )));
}

// void main() {
//   runApp(const MaterialApp(
//     home: ,
//   ));
// }
