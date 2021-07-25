import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/services/user_services.dart';

class AdminHomePage extends StatefulWidget {
  final String title;
  const AdminHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late final UserServices userServices;
  @override
  void initState() {
    super.initState();
    userServices = new UserServices();
  }

  // Future<List<Map<String, Object?>>> fetchUsers() async {
  //   final data = await userServices.getNormalUsers();
  //   return data;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      body: Center(child: Text("Dashboard"),),
    );
  }
}
