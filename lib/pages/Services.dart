// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_firestore_example/model/product.dart';

// class MyServices{
//   static final CollectionReference productss = FirebaseFirestore.instance.collection('products').withConverter<Product>(
//     fromFirestore: (snapshot, _) => Product.fromJson(snapshot.data()!, snapshot.reference.id),
//     toFirestore: (product, _) => product.toJson(),
//   );
// }