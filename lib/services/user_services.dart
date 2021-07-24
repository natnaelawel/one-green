import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firestore_example/model/user.dart';

class UserServices {
  static final CollectionReference userservice =
      FirebaseFirestore.instance.collection('users').withConverter<User>(
            fromFirestore: (snapshot, _) =>
                User.fromJson(snapshot.data()!, snapshot.reference.id),
            toFirestore: (user, _) => user.toJson(),
          );

  Future<void> deleteUser(String userId) async {
    await userservice.doc(userId).delete();
  }

  Future<void> addUser(User user) async {
    await userservice.add(user);
  }

  Future<void> updateUser(User user) async {
    await userservice.doc(user.uid).update(user.toJson());
  }

  Future<void> getNormalUsers() async {
    await userservice.where("role", isEqualTo: "NORMAL_USER").get();
  }

  Future<void> getCompanies() async {
    await userservice.where("role", isEqualTo: "COMPANY").get();
  }

  Future<void> getCollectors() async {
    await userservice.where("role", isEqualTo: "COLLECTORS").get();
  }
}
