class Comment {
  final String uid;
  final String body;
  final String commentBy;
  final DateTime createdAt;

  Comment(
      {required this.uid,
      required this.body,
      required this.commentBy,
      required this.createdAt});

  Comment.fromJson(Map<String, Object?> json, String referenceId)
      : this(
          uid: referenceId,
          body: json['body']! as String,
          commentBy: json['commentBy']! as String,
          createdAt: json['createdAt']! as DateTime,
        );

  Map<String, Object?> toJson() {
    return {
      'body': body,
      'commentBy': commentBy,
      'createdAt': createdAt,
    };
  }
}
