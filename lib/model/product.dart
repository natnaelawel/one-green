import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String uid;
  final String title;
  final double price;


  Product({required this.title, required this.price, required this.uid});

  Product.fromJson(Map<String, Object?> json, String reference)
      : this(
    uid: reference,
    title: json['title']! as String,
    price: (json['price']!  as num) as double,
  );



  Map<String, Object?> toJson() {
    return {
      'title': title,
      'price': price,
    };
  }
}