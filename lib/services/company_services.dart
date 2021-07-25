import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firestore_example/model/company.dart';

class CompanyServices {
  static final CollectionReference collectorservice =
      FirebaseFirestore.instance.collection('companies').withConverter<Company>(
            fromFirestore: (snapshot, _) =>
                Company.fromJson(snapshot.data()!, snapshot.reference.id),
            toFirestore: (product, _) => product.toJson(),
          );

  Future<void> deleteCompany(String collectorId) async {
    await collectorservice.doc(collectorId).delete();
  }

  Future<void> addCompany(Company collector) async {
    await collectorservice.add(Company);
  }

  Future<void> updateCompany(Company collector) async {
    await collectorservice.doc(collector.uid).update(collector.toJson());
  }
}
