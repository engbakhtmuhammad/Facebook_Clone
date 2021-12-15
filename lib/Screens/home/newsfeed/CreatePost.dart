import 'package:facebook_clone/models/post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:facebook_clone/constants.dart';
import 'package:facebook_clone/Models/post.dart';
import 'package:facebook_clone/Services/DatabaseServices.dart';
import 'package:facebook_clone/Services/StorageService.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String _postText;
  File _pickedImage;
  bool _loading = false;
  handleImageFromGallery() async {
    /*try {
      File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
      if (imageFile != null) {
        setState(() {
          _pickedImage = imageFile;
        });
      }
    } catch (e) {
      print(e);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          'Post',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            TextField(
              maxLength: 280,
              maxLines: 7,
              decoration: InputDecoration(
                hintText: 'Enter your Post',
              ),
              onChanged: (value) {
                _postText = value;
              },
            ),
            SizedBox(height: 10),
            _pickedImage == null
                ? SizedBox.shrink()
                : Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(_pickedImage),
                            )),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
            GestureDetector(
              onTap: handleImageFromGallery,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 50,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 20),
            Material(
              elevation: 5,
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30),
              child: MaterialButton(
                onPressed: () async {
                  setState(() {
                    _loading = true;
                  });
                  if (_postText != null && _postText.isNotEmpty) {
                    String image;
                    if (_pickedImage == null) {
                      image = '';
                    } else {
                      image =
                          await StorageService.uploadPostPicture(_pickedImage);
                    }
                    /*Post post = Post(
                      text: _postText,
                      image: image,
                      authorId: 2,
                      likes: 0,
                      comments: 0,
                      timestamp: Timestamp.fromDate(
                        DateTime.now(),
                      ),
                    );
                    DatabaseServices.createPosts(post);
                    Navigator.pop(context);*/
                  }
                  setState(() {
                    _loading = false;
                  });
                },
                minWidth: 320,
                height: 60,
                child: Text(
                  'Post',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            _loading ? CircularProgressIndicator() : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
