import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedBackPage extends StatefulWidget {
  FeedBackPage({Key? key}) : super(key: key);

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  Map<String, dynamic> _formData = <String, dynamic>{
    'title': '???',
    'description': "",
    'price': 0,
    'itemType': 0,
    'timeType': ""
  };
  final _commentTextController = TextEditingController();
  late bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Form(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  _buildRatingBar(),
                  SizedBox(
                    height: 20.0,
                  ),
                  buildCommentBox(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _submitButton(context),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  void handleSubmit() {
    print('submit clicked');
  }

  Widget _submitButton(BuildContext context) {
    return InkWell(
      focusColor: Colors.blue,
      hoverColor: Colors.blue,
      onTap: () => handleSubmit(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xff4064f3),
                  Color(0xff9607c1),
                ])),
        child:
            // _isLoading == true
            // ? Dialog().loading(context)
            // :
            Text('Submit',
                // style: TextStyle(fontSize: 20, color: Colors.white),
                style: TextStyle(color: Colors.white, fontSize: 18.0)),
      ),
    );
  }

  buildCommentBox() {
    return TextFormField(
      // controller: _descTextController,
      textCapitalization: TextCapitalization.sentences,
      maxLines: 5,
      maxLength: 100,
      decoration: InputDecoration(
          fillColor: Colors.blue,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.blue,
            ),
            onPressed: () {
              _commentTextController.clear();
            },
          ),
          hintText: "Enter the description",
          labelText: "Description"),
    );
  }

  Widget _buildRatingBar() {
    return RatingBar.builder(
      itemSize: 50.0,
      initialRating: 3.4,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}
