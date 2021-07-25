import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firestore_example/model/Collector.dart';

class CollectorServices {
  static final CollectionReference collectorservice = FirebaseFirestore.instance
      .collection('companies')
      .withConverter<Collector>(
        fromFirestore: (snapshot, _) =>
            Collector.fromJson(snapshot.data()!, snapshot.reference.id),
        toFirestore: (product, _) => product.toJson(),
      );
  
  Future<void> deleteCollector(String collectorId) async {
    await collectorservice.doc(collectorId).delete();
  }

  Future<void> addCollector(Collector collector) async {
    await collectorservice.add(Collector);
  }

  Future<void> updateCollector(Collector collector) async {
    await collectorservice.doc(collector.uid).update(collector.toJson());
  }
}
