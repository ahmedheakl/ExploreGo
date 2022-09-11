import 'package:explorego/resources/auth_methods.dart';
import 'package:flutter/foundation.dart';
import 'package:explorego/models/user_model.dart' as model;

class UserProvider extends ChangeNotifier {
  model.User? _user;
  final AuthMethods _authMethods = AuthMethods();

  model.User get getUser => _user!;

  Future<void> refreshUser() async {
    model.User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
