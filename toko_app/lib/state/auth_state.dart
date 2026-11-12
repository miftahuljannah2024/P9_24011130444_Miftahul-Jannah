import 'package:flutter/foundation.dart';

class AuthState extends ChangeNotifier {
  String? _username;

  bool get isLoggedIn => _username != null;
  String get username => _username ?? '';
  bool get isAdmin => _username == 'admin';

  void login(String username) {
    _username = username;
    notifyListeners();
  }

  void logout() {
    _username = null;
    notifyListeners();
  }
}