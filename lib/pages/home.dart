import 'package:flutter/material.dart';

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
      appBar: AppBar(title: Text(widget.title),),
      body: Column(children: [
        Center(
        child: ElevatedButton(
          onPressed: () {Navigator.pushNamed(context, "/products"); },
          child: Text("Show Products"),),)
      ],),
    );
  }
}
