import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/model/user.dart';
import 'package:flutter_firestore_example/pages/profile/appbar_widget.dart';
import 'package:flutter_firestore_example/pages/profile/button_widget.dart';
import 'package:flutter_firestore_example/pages/profile/numbers_widget.dart';
import 'package:flutter_firestore_example/pages/profile/profile_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/userProfile";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user =  new User(
        uid: "890707",
        name: "Nathaniel Awel",
        phone: "+0923343443",
        password: "password",
        houseNo: "314",
        address: "Hawassa, Ethiopia",
        latLng: new LatLng(9.001392211274675, 38.78237001138305),
        rating: 4.5,
        comments: "comments",
        role: "role");

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: "assets/images/avatar.jpeg",
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/editProfile");
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            "user",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {},
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              "user",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
