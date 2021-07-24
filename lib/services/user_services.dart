import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firestore_example/model/user.dart';

class UserServices {
  static final CollectionReference productss = FirebaseFirestore.instance.collection('products').withConverter<User>(
    fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!, snapshot.reference.id),
    toFirestore: (product, _) => product.toJson(),
  );
}
