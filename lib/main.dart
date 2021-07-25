// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/pages/collectors/map.dart';
import 'package:flutter_firestore_example/pages/login_screen.dart';
import 'package:flutter_firestore_example/pages/NormalUser/edit_profile_page.dart';
import 'package:flutter_firestore_example/pages/NormalUser/profile.dart';
import 'pages/Navigator.dart';
import 'package:flutter_firestore_example/pages/register_screen.dart';
import 'package:flutter_firestore_example/utils/auth_provider.dart';
import 'package:flutter_firestore_example/utils/my_theme.dart';
import 'package:flutter_firestore_example/utils/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserRepository(),
    ),
    ChangeNotifierProvider(
      create: (context) => MyTheme(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'One Green',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: Provider.of<MyTheme>(context).currentTheme(),
        initialRoute: "/",
        onGenerateRoute: generateRoute);
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return MaterialPageRoute(
              builder: (context) => UserNavigator());
        }
      // case CollectorProfile.routeName:
      //   {
      //     return MaterialPageRoute(builder: (context) => CollectorProfile());
      //   }
      case MapPage.routeName:
        {
          return MaterialPageRoute(builder: (context) => MapPage());
        }
      case ProfilePage.routeName:
        {
          return MaterialPageRoute(builder: (context) => ProfilePage());
        }
      case EditProfilePage.routeName:
        {
          return MaterialPageRoute(builder: (context) => EditProfilePage());
        }
      case LoginPage.routeName:
        {
          return MaterialPageRoute(builder: (context) => LoginPage());
        }
     
      case SignUpPage.routeName:
        {
          return MaterialPageRoute(builder: (context) => SignUpPage());
        }      
    }
    return null;
  }
}
