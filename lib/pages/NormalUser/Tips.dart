import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';

class RecycleTips extends StatefulWidget {
  @override
  _RecycleTipsState createState() => _RecycleTipsState();
}

List<String> images = [
  'https://gank.io/images/5ba77f3415b44f6c843af5e149443f94',
  'https://gank.io/images/02eb8ca3297f4931ab64b7ebd7b5b89c',
  'https://gank.io/images/31f92f7845f34f05bc10779a468c3c13',
  'https://gank.io/images/b0f73f9527694f44b523ff059d8a8841',
  'https://gank.io/images/1af9d69bc60242d7aa2e53125a4586ad',
];

class _RecycleTipsState extends State<RecycleTips> {
  List<Widget> cards = List.generate(
    images.length,
    (int index) {
      return Card(
        elevation: 1,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  // boxShadow: [
                  //   BoxShadow(
                  //     offset: Offset(0, 17),
                  //     blurRadius: 23.0,
                  //     spreadRadius: -13.0,
                  //     color: Colors.black54,
                  //   )
                  // ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.fitWidth,
                    height: 800,
                    filterQuality: FilterQuality.low,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 15),
              child: ListTile(
                title: Text(
                  'Put everything away after use.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    'This might seem like an obvious tip, but failing to'
                    ' put away your belongings is the main culprit of untidiness. '
                    'As you move from one room to another, do a quick scan to see '
                    'if there’s anything that you can take with you. Go out of your way '
                    'to make sure that anything you wear, use or move ends up where it belongs. It’s easy to leave a pair of s',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
  );

  TCardController _controller = TCardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height * 0.8,
        child: Center(
          child: TCard(
            cards: cards,
            controller: _controller,
            size: Size(400, 600),
            onEnd: () {
              setState(() {
                _controller.reset();
              });
            },
          ),
        ),
      ),
    );
  }
}
