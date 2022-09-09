import 'package:flutter/material.dart';
import 'package:explorego/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:explorego/models/favourite.dart';
import 'package:explorego/models/userprovider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: const MaterialApp(
        home: HomePage(),
      )));
}
