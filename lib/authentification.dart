import 'dart:async';
import 'package:flutter/material.dart';

class AuthService with ChangeNotifier {
  var currentUser;

  Future getUser() {
    return Future.value(currentUser);
  }

  Future createUser(
      {String firstName,
      String lastName,
      String email,
      String password}) async {}

  Future loginUser(String email, String password) {
    if (password == '1') {
      this.currentUser = {'e': email};
      //  print("ok");
      notifyListeners();
      return Future.value(currentUser);
    } else {
      this.currentUser = null;
      return Future.value(currentUser);
    }
  }
}
