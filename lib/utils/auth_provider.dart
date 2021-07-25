import 'package:flutter/foundation.dart';
import 'package:flutter_firestore_example/services/user_services.dart';

enum Status {  Authenticated, Authenticating, Unauthenticated }

class UserRepository with ChangeNotifier {
  Map<String, dynamic>  _authenticatedUser = {};
  Status _status = Status.Unauthenticated;


   Status get status => _status;
   Map<String, dynamic> get authenticatedUser => _authenticatedUser;

  Future<bool> signIn(String phone, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      UserServices _userService = new UserServices();
      if(_userService.signIn(phone, password) != null){
        print('authenticated');
        _status = Status.Authenticated;
        notifyListeners();
      }else{
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
