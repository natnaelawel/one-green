import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/model/user.dart';
import 'package:flutter_firestore_example/services/user_services.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserServices userServices;
  @override
  void initState() {
    super.initState();
    userServices = new UserServices();
  }

  Future<List<Map<String, Object?>>> fetchUsers() async {
    final data = await userServices.getNormalUsers();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      body: FutureBuilder(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data as List<Map<String, dynamic>>;
              print(users[0]['password']);
              print("password");
              return Center(child: Text(users[0]['password']));
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
