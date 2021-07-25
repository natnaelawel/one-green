// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_firestore_example/model/user.dart';
import 'package:flutter_firestore_example/services/user_services.dart';

class NormalUserHomePage extends StatefulWidget {
  final String title;
  const NormalUserHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _NormalUserHomePageState createState() => _NormalUserHomePageState();
}

class _NormalUserHomePageState extends State<NormalUserHomePage> {
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
      body: Center(child: Text("Dashboard"),),
     );
  }
}

// FutureBuilder(
//           future: fetchUsers(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final users = snapshot.data as List<Map<String, dynamic>>;
//               print(users[0]['password']);
//               print("password");
//               return Center(child: Text(users[0]['password']));
//             }
//             return Center(child: CircularProgressIndicator());
//           }),
