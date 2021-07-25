// import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/pages/collectors/map.dart';
import 'package:flutter_firestore_example/pages/login_screen.dart';
import 'package:flutter_firestore_example/pages/NormalUser/edit_profile_page.dart';
import 'package:flutter_firestore_example/pages/NormalUser/profile.dart';
import 'package:flutter_firestore_example/pages/register_screen.dart';
import 'package:flutter_firestore_example/routes.dart';
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
        onGenerateRoute: PageRouter.generateRoute);
  }
}
