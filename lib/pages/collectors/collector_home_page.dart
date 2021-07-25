// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_firestore_example/model/user.dart';
import 'package:flutter_firestore_example/services/user_services.dart';

class CollectorHomePage extends StatefulWidget {
  final String title;
  const CollectorHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _CollectorHomePageState createState() => _CollectorHomePageState();
}

class _CollectorHomePageState extends State<CollectorHomePage> {
  late final UserServices userServices;

  Future<List<Map<String, Object?>>> fetchUsers() async {
    final data = await userServices.getNormalUsers();
    return data;
  }

  @override
  void initState() {
    super.initState();
    userServices = new UserServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
