import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/pages/feedback.dart';
import 'package:flutter_firestore_example/pages/map.dart';
import 'package:flutter_firestore_example/pages/profile.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      body: MapPage(),
    );
  }
}
