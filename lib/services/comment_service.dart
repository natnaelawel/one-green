import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firestore_example/model/Comment.dart';

class CommentServices {
  static final CollectionReference commentservice =
      FirebaseFirestore.instance.collection('comments').withConverter<Comment>(
            fromFirestore: (snapshot, _) =>
                Comment.fromJson(snapshot.data()!, snapshot.reference.id),
            toFirestore: (comment, _) => comment.toJson(),
          );
  Future<dynamic> getComments(String userId) async {
    var data = await commentservice
        .where("userId", isEqualTo: userId)
        .get()
        .then((value) => value.docs);
    return data;
  }

  Future<void> deleteComment(String commentId) async {
    await commentservice.doc(commentId).delete();
  }

  Future<void> addComment(Comment comment) async {
    await commentservice.add(Comment);
  }

  Future<void> updateComment(Comment comment) async {
    await commentservice.doc(comment.uid).update(comment.toJson());
  }
}
