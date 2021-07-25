import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_example/model/user.dart';
import 'package:flutter_firestore_example/pages/NormalUser/profile_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = "/userProfile";

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = new User(
        uid: "890707",
        name: "Nathaniel Awel",
        phone: "+0923343443",
        password: "password",
        profile: {
          "houseNo": "314",
          "address": "Hawassa, Ethiopia",
          "latLng": new LatLng(9.001392211274675, 38.78237001138305),
          "rating": 4.5,
        },
        comments: [],
        role: "role");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.moon_stars),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath:
                'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80',
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Center(
              child: Text(
            user.profile['rating'].toString(),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          )),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.orange[300],
              ),
              Icon(
                Icons.star,
                color: Colors.orange[300],
              ),
              Icon(
                Icons.star,
                color: Colors.orange[300],
              ),
              Icon(
                Icons.star,
                color: Colors.orange[300],
              ),
              Icon(
                Icons.star,
                color: Colors.orange[300],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      user.phone,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Icon(Icons.map_outlined),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      user.profile['address'],
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 10.0,),
                    Text(
                      user.profile['houseNo'],
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
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
}
