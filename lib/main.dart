import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/pages/Tips.dart';
import 'package:flutter_firestore_example/pages/home.dart';
import 'package:flutter_firestore_example/pages/product_detail.dart';
import 'package:flutter_firestore_example/pages/products.dart';

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
        backgroundColor: Colors.black54
      ),
      initialRoute: "/",
      onGenerateRoute: generateRoute
    );
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch(settings.name){
      case "/" : {
        return MaterialPageRoute(builder: (context) => RecycleTips());
      }
      case "/products" : {
        return MaterialPageRoute(builder: (context) => ProductPage(title: "Product Page"));
      }
      case "/product-detail": {
        return MaterialPageRoute(builder: (context) => ProductDetailPage(title: "Product Detail Page", productId: settings.arguments as String));

      }
    }
    return null;
  }
}


