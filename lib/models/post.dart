import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String id;
  String authorId;
  String text;
  String image;
  Timestamp timestamp;
  int likes;
  int comments;

  Post(
      {this.id,
      this.authorId,
      this.text,
      this.image,
      this.timestamp,
      this.likes,
      this.comments});

  factory Post.fromDoc(DocumentSnapshot doc) {
    return Post(
      id: doc.id,
      authorId: doc['authorId'],
      text: doc['text'],
      image: doc['image'],
      timestamp: doc['timestamp'],
      likes: doc['likes'],
      comments: doc['comments'],
    );
  }
}
