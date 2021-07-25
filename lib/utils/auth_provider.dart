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

  Future<String> getToken() async {
    final storage = new FlutterSecureStorage();
    var token = await storage.read(key: "jwt_token");
    return "'Bearer $token';";
  }

//  Future<User> getCurrentUser() async {
//     var user = getUserFromToken(await getToken()); // return null for now
//     return user;
//   }

//   Future<String> getToken() async {
//     final storage = new FlutterSecureStorage();
//     String token = await storage.read(key: "jwt_token");
//     return "'Bearer $token';";
//   }


  Future<bool> signIn(String phone, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      UserServices _userService = new UserServices();
      final user = await _userService.signIn(phone, password);
      if (user != null) {
        print('authenticated');
        _status = Status.Authenticated;
        _authenticatedUser = user;
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
    // _auth.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
