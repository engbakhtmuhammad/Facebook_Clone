import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String fname;
  String lname;
  String profilePicture;
  String email;
  String bio;
  String coverImage;

  UserModel({
    this.uid,
    this.fname,
    this.lname,
    this.profilePicture,
    this.email,
    this.bio,
    this.coverImage,
  });

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(
      uid: doc.id,
      fname: doc['fname'],
      lname: doc['lname'],
      email: doc['email'],
      profilePicture: doc['profilePicture'],
      bio: doc['bio'],
      coverImage: doc['coverImage'],
    );
  }
}

/*
class UserData {

  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({ this.uid, this.sugars, this.strength, this.name });
}*/