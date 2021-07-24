// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/pages/home.dart';
import 'package:flutter_firestore_example/pages/profile.dart';
// import 'package:flutter_firestore_example/pages/home.dart';
import 'package:flutter_firestore_example/pages/login_screen.dart';
import 'package:flutter_firestore_example/pages/profile/edit_profile_page.dart';
import 'package:flutter_firestore_example/pages/profile/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            accentColor: Colors.lightGreenAccent,
            backgroundColor: Colors.black54),
        initialRoute: "/",
        onGenerateRoute: generateRoute);
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return MaterialPageRoute(builder: (context) => LoginPage());
        }
      case "/profile":
        {
          return MaterialPageRoute(builder: (context) => ProfilePage());
        }
      case "/editProfile":
        {
          return MaterialPageRoute(builder: (context) => EditProfilePage());
        }
      case "/products":
        {
          return MaterialPageRoute(
              builder: (context) => ProductPage(title: "Product Page"));
        }
     
    }
    return null;
  }
}
