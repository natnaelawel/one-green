import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_firestore_example/model/user.dart';
import 'package:flutter_firestore_example/services/user_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum Status { Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  User? _authenticatedUser;
  Status _status = Status.Unauthenticated;

  Status get status => _status;
  User? get authenticatedUser => _authenticatedUser;

  Future<bool> signIn(String phone, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      UserServices _userService = new UserServices();
      final user = await _userService.signIn(phone, password);
      if (user != null) {
        _status = Status.Authenticated;
        _authenticatedUser = user;
        storeUserToStorage(user);
        notifyListeners();
      } else {
        _status = Status.Unauthenticated;
        notifyListeners();
      }

      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    clearStorage();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future getUserFromStorage() async {
    final user = await getUserDataFromStorage();
    if (user != null) {
      this._authenticatedUser = user;
      this._status = Status.Authenticated;
      print("hello world");
    }
    print("json data ${jsonEncode(user)}");
  }

  Future<User?> getUserDataFromStorage() async {
    final storage = new FlutterSecureStorage();
    var userData = await storage.read(key: "logged_in_user");
    if (userData != null) {
      var data = jsonDecode(userData) as Map<String, dynamic>;
      // try {
      //   final result = User(
      //       uid: "",
      //       name: data["name"],
      //       password: data["password"],
      //       phone: data["phone"],
      //       role: data["role"],
      //       comments: data["comments"],
      //       profile: data["profile"]);
      //   print("below the trycatch");
      // } catch (error) {
      //   print("the error is $error");
      // }
      // return result;
      return User.fromJson(data, data["uid"]);
    } else {
      return null;
    }
  }

  User? getUserFromJson(payload) {
    var id = payload['uid'];
    var name = payload['name'];
    var phone = payload['phone'];
    var password = payload['password'];
    var comments = payload['comments'];
    var profile = payload['profile'];
    var role = payload['role'];
    User result = User(
        uid: id,
        name: name,
        password: password,
        phone: phone,
        role: role,
        comments: comments,
        profile: profile);
    print("hello user from storagge ${result.toJson()}");
    return result;
  }

  Future<void> clearStorage() async {
    final storage = new FlutterSecureStorage();
    await storage.delete(
      key: 'logged_in_user',
    );
  }

  void storeUserToStorage(User user) async {
    final storage = new FlutterSecureStorage();
    String encoded = json.encode(user);
    print("encoded string $encoded");
    print("encoded uid ${user.uid}");
    await storage.write(key: 'logged_in_user', value: jsonEncode(user));

    await getUserDataFromStorage();
  }
}
