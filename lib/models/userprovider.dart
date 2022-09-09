import 'package:flutter/foundation.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _users = [
    User(
        id: 1,
        email: "karim@explogo.co",
        imagePath: "assets/karim.jpeg",
        name: "Karim")
  ];

  List<User> get users => _users;

  void add(User user) {
    _users.add(user);

    notifyListeners();
  }

  bool exists(User user) {
    for (User currentUser in _users) {
      if (currentUser == user) return true;
    }
    return false;
  }

  void remove(User user) {
    _users.remove(user);
    notifyListeners();
  }
}

class User {
  int id;
  String imagePath;
  String name;
  String email;

  User(
      {required this.id,
      required this.imagePath,
      required this.name,
      required this.email});

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is User && other.id == id;
}
