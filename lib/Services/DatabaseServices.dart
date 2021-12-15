import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_clone/Constants.dart';
import 'package:facebook_clone/Screens/home/newsfeed/CreatePost.dart';
import 'package:facebook_clone/models/post.dart';
import 'package:facebook_clone/models/user.dart';

class DatabaseServices {
  static void updateUserData(UserModel user) {
    usersRef.doc(user.uid).update({
      'fname': user.fname,
      'lname': user.lname,
      'bio': user.bio,
      'profilePicture': user.profilePicture,
      'coverImage': user.coverImage,
    });
  }

  static void createPosts(Post post) {
    postsRef.doc(post.authorId).set({'postTime': post.timestamp});
    postsRef.doc(post.authorId).collection('userPosts').add({
      'text': post.text,
      'image': post.image,
      "authorId": post.authorId,
      "timestamp": post.timestamp,
      'likes': post.likes,
      'comments': post.comments,
    }).then((doc) async {
      QuerySnapshot followerSnapshot =
          await followersRef.doc(post.authorId).collection('Followers').get();
      for (var docSnapshot in followerSnapshot.docs) {
        feedRefs.doc(docSnapshot.id).collection('userFeed').doc(doc.id).set({
          'text': post.text,
          'image': post.image,
          "authorId": post.authorId,
          "timestamp": post.timestamp,
          'likes': post.likes,
          'comments': post.comments,
        });
      }
    });
  }

  static Future<List> getUserTweets(String userId) async {
    QuerySnapshot userTweetsSnap = await postsRef
        .doc(userId)
        .collection('userPosts')
        .orderBy('timestamp', descending: true)
        .get();
    List<Post> userTweets =
        userTweetsSnap.docs.map((doc) => Post.fromDoc(doc)).toList();
    return userTweets;
  }
}
