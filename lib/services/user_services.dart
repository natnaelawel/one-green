import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firestore_example/model/user.dart';

class UserServices {
  static final CollectionReference userservice =
      FirebaseFirestore.instance.collection('users');
  // .withConverter<User>(
  // fromFirestore: (snapshot, _) =>
  // User.fromJson(snapshot.data()!, snapshot.reference.id),
  // toFirestore: (user, _) => user.toJson(),
  // );

  Future<void> deleteUser(String userId) async {
    await userservice.doc(userId).delete();
  }

  Future<void> addUser(Map<String,dynamic> user) async {
    await userservice.add(user);
  }

  Future<void> updateUser(User user) async {
    await userservice.doc(user.uid).update(user.toJson());
  }

  Future<List<Map<String, Object?>>> getNormalUsers() async {
    final data = await userservice
        .where("role", isEqualTo: "NORMAL_USER")
        .get()
        .then((value) => value.docs);
    final result = data.map((value) => value.data() as Map<String, dynamic>).toList();
    return result;
  }

  Future<void> getCompanies() async {
    await userservice.where("role", isEqualTo: "COMPANY").get();
  }

  Future<void> getCollectors() async {
    await userservice.where("role", isEqualTo: "COLLECTORS").get();
  }
}
