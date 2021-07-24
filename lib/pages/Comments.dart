import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
              child: _comments_cards(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "map"),
          BottomNavigationBarItem(icon: Icon(Icons.file_copy), label: "file")
        ],
        currentIndex: _currentIndex,
        elevation: 10,
      ),
    );
  }
}

const comments_list = [
  {
    "comment":
        'The bottom navigation bar consists of multiple items in the form of text labels, icons, or both, laid out on top of a piece of material. It provides quick navigation between the top-level views of an app. For larger screens, side navigation may be a better fit.',
    "date": "12/04/2021",
    "status": "read"
  },
  {
    "comment":
        'The bottom navigation bar consists of multiple items in the form of text labels, icons, or both, laid out on top of a piece of material. It provides quick navigation between the top-level views of an app. For larger screens, side navigation may be a better fit.',
    "date": "17/12/2021",
    "status": "not-read"
  },
  {
    "comment":
        'The bottom navigation bar consists of multiple items in the form of text labels, icons, or both, laid out on top of a piece of material. It provides quick navigation between the top-level views of an app. For larger screens, side navigation may be a better fit.',
    "date": "12/12/2021",
    "status": "not-read"
  }
];

Widget _comments_cards() {
  return (Card(
    child: Center(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: comments_list
              .map(
                (comment) => Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.check),
                      title: Padding(
                        padding: EdgeInsets.fromLTRB(0, 15, 8, 15),
                        child: Text('Comment'),
                      ),
                      subtitle: Text(
                        comment.values.first,
                        style: TextStyle(color: comment.values.last == 'read' ? Colors.black : Colors.black38),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Container(alignment: Alignment.bottomRight, child: Text(comment.values.elementAt(1))),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.comment),
                          onPressed: () {},
                        ),
                        TextButton(
                          child: const Text('Clear'),
                          onPressed: () {/* ... */},
                        ),
                      ],
                    ),
                  ],
                ),
              )
              .toList(growable: true)),
    ),
  ));
}