// import 'package:flutter/material.dart';
// import 'package:flutter_firestore_example/pages/profile/profile.dart';
// import 'package:titled_navigation_bar/titled_navigation_bar.dart';

// import 'NormalUser/Comments.dart';
// import 'NormalUser/Hacks.dart';
// import 'NormalUser/Tips.dart';
// import 'collectors/map.dart';

// class UserNavigator extends StatefulWidget {
//   @override
//   _UserNavigatorState createState() => _UserNavigatorState();
// }

// var _currentIndex = 0;
// final List<Widget> _children = [
//   Comments(),
//   Hacks(),
//   RecycleTips(),
//   MapPage(),
//   ProfilePage()
// ];

// class _UserNavigatorState extends State<UserNavigator> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: _children[_currentIndex],
//         bottomNavigationBar: TitledBottomNavigationBar(
//             currentIndex:
//                 _currentIndex, // Use this to update the Bar giving a position
//             onTap: (index) {
//               setState(() {
//                 _currentIndex = index;
//               });
//             },
//             activeColor: Colors.blueAccent,
//             reverse: true,
//             items: [
//               TitledNavigationBarItem(
//                   title: Text('Home'), icon: Icon(Icons.home)),
//               TitledNavigationBarItem(
//                   title: Text('Search'), icon: Icon(Icons.search)),
//               TitledNavigationBarItem(
//                   title: Text('Bag'), icon: Icon(Icons.card_travel)),
//               TitledNavigationBarItem(
//                   title: Text('Orders'), icon: Icon(Icons.shopping_cart)),
//               TitledNavigationBarItem(
//                   title: Text('Profile'), icon: Icon(Icons.person_outline)),
//             ]));
//   }
// }
