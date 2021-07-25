import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:flutter_firestore_example/pages/home.dart';
import 'package:flutter_firestore_example/pages/login_screen.dart';
import 'package:flutter_firestore_example/pages/map.dart';
import 'package:flutter_firestore_example/pages/profile.dart';
import 'package:flutter_firestore_example/utils/auth_provider.dart';
import 'package:flutter_firestore_example/pages/profile/edit_profile_page.dart';
import 'package:flutter_firestore_example/pages/profile/profile.dart';
import 'package:flutter_firestore_example/pages/register_screen.dart';
import 'utils/auth_provider.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings){
      switch (settings.name) {
      case "/":
        {
          return MaterialPageRoute(builder: (context) {
            final userStatus = Provider.of<UserRepository>(context).status;
            switch (userStatus) {
              case Status.Unauthenticated:
                {
                  return LoginPage();
                }
              case Status.Uninitialized:
                break;
              case Status.Authenticated:
                return HomePage(title: "HomePage");
              case Status.Authenticating:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
            return LoginPage();
          });
        }
      case CollectorProfile.routeName:
        {
          return MaterialPageRoute(builder: (context) {
            final userStatus = Provider.of<UserRepository>(context).status;
            switch (userStatus) {
              case Status.Unauthenticated:
                {
                  return LoginPage();
                }
              case Status.Uninitialized:
                break;
              case Status.Authenticated:
                return CollectorProfile();
              case Status.Authenticating:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
            return LoginPage();
          });
        }
      case MapPage.routeName:
        {
          return MaterialPageRoute(builder: (context) {
            final userStatus = Provider.of<UserRepository>(context).status;
            switch (userStatus) {
              case Status.Unauthenticated:
                {
                  return LoginPage();
                }
              case Status.Uninitialized:
                break;
              case Status.Authenticated:
                return MapPage();
              case Status.Authenticating:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
            return LoginPage();
          });
        }
      case ProfilePage.routeName:
        {
           return MaterialPageRoute(builder: (context) {
            final userStatus = Provider.of<UserRepository>(context).status;
            switch (userStatus) {
              case Status.Unauthenticated:
                {
                  return LoginPage();
                }
              case Status.Uninitialized:
                break;
              case Status.Authenticated:
                return ProfilePage();
              case Status.Authenticating:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
            return LoginPage();
          });
        }
      case EditProfilePage.routeName:
        {
           return MaterialPageRoute(builder: (context) {
            final userStatus = Provider.of<UserRepository>(context).status;
            switch (userStatus) {
              case Status.Unauthenticated:
                {
                  return LoginPage();
                }
              case Status.Uninitialized:
                break;
              case Status.Authenticated:
                return EditProfilePage();
              case Status.Authenticating:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
            return LoginPage();
          });
        }
      case LoginPage.routeName:
        {
          return MaterialPageRoute(builder: (context) {
            final userStatus = Provider.of<UserRepository>(context).status;
            switch (userStatus) {
              case Status.Unauthenticated:
                {
                  return LoginPage();
                }
              case Status.Uninitialized:
                break;
              case Status.Authenticated:
                return HomePage(title: "HomePage");
              case Status.Authenticating:
                return Center(
                  child: CircularProgressIndicator(),
                );
            }
            return LoginPage();
          });
        }
      case SignUpPage.routeName:
        {
          return MaterialPageRoute(builder: (context) => SignUpPage());
        }
    }
    return null;
  }
}
