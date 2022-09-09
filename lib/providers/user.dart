import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String name = "Abdirahman A. Mohamed";

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }
}
