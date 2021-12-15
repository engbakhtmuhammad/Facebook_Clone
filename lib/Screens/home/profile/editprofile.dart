import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:facebook_clone/Services/DatabaseServices.dart';
import 'package:facebook_clone/Services/StorageService.dart';

class EditProfile extends StatefulWidget {
  final UserModel currentUserId;

  const EditProfile({Key key, this.currentUserId}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool _isLoading = false;
  String fname = '';
  String lname = '';
  String bio = '';
  File profileImage;
  File coverImage;
  String imageType;

  displayCoverImage() {
    if (coverImage == null) {
      if (widget.currentUserId.coverImage.isEmpty) {
        return AssetImage('assets/fb.jpg');
      } else
        return NetworkImage(widget.currentUserId.coverImage);
    } else {
      return FileImage(coverImage);
    }
  }

  displayProfileImage() {
    if (profileImage == null) {
      if (widget.currentUserId.profilePicture.isEmpty) {
        return AssetImage('assets/fb.jpg');
      } else
        return NetworkImage(widget.currentUserId.profilePicture);
    } else {
      return FileImage(profileImage);
    }
  }

  saveProfile() async {
    _formKey.currentState.save();
    if (_formKey.currentState.validate() && !_isLoading) {
      setState(() {
        _isLoading = true;
      });
      String profilePictureUrl = '';
      String coverPictureUrl = '';
      if (profileImage == null) {
        profilePictureUrl = widget.currentUserId.profilePicture;
      } else {
        profilePictureUrl = await StorageService.uploadProfilePicture(
            widget.currentUserId.profilePicture, profileImage);
      }
      if (coverImage == null) {
        coverPictureUrl = widget.currentUserId.coverImage;
      } else {
        coverPictureUrl = await StorageService.uploadProfilePicture(
            widget.currentUserId.coverImage, coverImage);
      }
      UserModel user = UserModel(
        uid: widget.currentUserId.uid,
        fname: fname,
        lname: lname,
        profilePicture: profilePictureUrl,
        bio: bio,
        coverImage: coverPictureUrl,
      );
      DatabaseServices.updateUserData(user);
      Navigator.pop(context);
    }
  }

  handleImageFromGallery() async {
    try {
      final picker = ImagePicker();
      PickedFile pickedFile =
          await picker.getImage(source: ImageSource.gallery);
      //File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        if (imageType == 'profile') {
          setState(() {
            profileImage = File(pickedFile.path);
            //profileImage = imageFile;
          });
        } else if (imageType == 'cover') {
          setState(() {
            coverImage = File(pickedFile.path);
//            coverImage = imageFile;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fname = widget.currentUserId.fname;
    lname = widget.currentUserId.lname;
    bio = widget.currentUserId.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300,
                width: 500,
                color: Colors.white,
              ),
              Container(
                height: 200,
                width: 500,
                child: Image(image: displayCoverImage()),
              ),
              Positioned(
                top: 150,
                left: 350,
                child: GestureDetector(
                  onTap: () {
                    imageType = 'cover';
                    handleImageFromGallery();
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    child: Container(
                      height: 40,
                      width: 50,
                      color: Colors.white,
                      child: Icon(Icons.camera_alt),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 120,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: displayProfileImage(),
                  ),
                ),
              ),
              Positioned(
                top: 210,
                left: 240,
                child: GestureDetector(
                  onTap: () {
                    imageType = 'profile';
                    handleImageFromGallery();
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.camera_enhance,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: fname,
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(color: Colors.blueAccent)),
                    validator: (val) => val.isEmpty ? 'Enter name' : null,
                    onSaved: (val) {
                      setState(() => fname = val);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: lname,
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(color: Colors.blueAccent)),
                    validator: (val) => val.isEmpty ? 'Enter name' : null,
                    onSaved: (val) {
                      setState(() => lname = val);
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    initialValue: bio,
                    decoration: InputDecoration(
                        labelText: 'Bio',
                        labelStyle: TextStyle(color: Colors.blueAccent)),
                    validator: (val) => val.isEmpty ? 'Enter bio' : null,
                    onSaved: (val) {
                      setState(() => bio = val);
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          Material(
            elevation: 5,
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(30),
            child: MaterialButton(
              onPressed: () async {
                setState(() {
                  saveProfile();
                });
              },
              minWidth: 320,
              height: 60,
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
