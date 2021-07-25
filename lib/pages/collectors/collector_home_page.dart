// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_firestore_example/model/user.dart';
import 'package:flutter_firestore_example/services/user_services.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserServices userServices;

  Future<List<Map<String, Object?>>> fetchUsers() async {
    final data = await userServices.getNormalUsers();
    return data;
  }

  late List<Widget> pages;
  late Widget currentPage;

  @override
  void initState() {
    super.initState();
    userServices = new UserServices();
    pages = [];

    currentPage = pages[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: CurvedNavigationBar(
        height: 50.0,
        items: <Widget>[
          Icon(
            Icons.near_me,
            size: 20.0,
            color: Colors.black,
          ),
          Icon(
            Icons.shopping_cart,
            size: 20.0,
            color: Colors.black,
          ),
          Icon(
            Icons.home,
            size: 20.0,
            color: Colors.black,
          ),
          Icon(
            Icons.edit,
            size: 20.0,
            color: Colors.black,
          ),
          Icon(
            Icons.person,
            size: 20.0,
            color: Colors.black,
          ),
        ],
        onTap: (index) {
          setState(() {
            // currentPage = pages[index];
          });
        },
        index: 2,
        animationDuration: Duration(milliseconds: 190),
        animationCurve: Curves.bounceInOut,
      ),
    );
  }
}