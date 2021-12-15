import 'package:flutter/material.dart';

void main() {
  runApp(StoriesScreen());
}

// ignore: must_be_immutable
class StoriesScreen extends StatelessWidget {
  // ignore: non_constant_identifier_names
  String StoryImage;
  String userImage;
  String userName;
  bool first = false;
  // ignore: non_constant_identifier_names
  StoriesScreen(
      {Key key, this.StoryImage, this.userImage, this.userName, this.first})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoriesScreenPage(
      StoryImage: this.StoryImage,
      userImage: this.userImage,
      userName: this.userName,
      first: this.first,
    );
  }
}

// ignore: must_be_immutable
class StoriesScreenPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  StoriesScreenPage(
      {Key key, this.StoryImage, this.userName, this.userImage, this.first})
      : super(key: key);

  // ignore: non_constant_identifier_names
  String StoryImage;
  String userImage;
  String userName;
  bool first = false;
  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: AspectRatio(
        aspectRatio: 1.6 / 2.6,
        child: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: NetworkImage(widget.first
                    ? "https://firebasestorage.googleapis.com/v0/b/facebook-85805.appspot.com/o/images%2Fusers%2Fmale.png?alt=media&token=f5df83b1-54d7-4bfe-b60f-a3c30c50b525"
                    : widget.StoryImage),
                fit: BoxFit.cover),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.1),
                ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                widget.first
                    ? Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF1777F2),
                        ),
                      )
                    : Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            image: DecorationImage(
                                image: NetworkImage(widget.userImage),
                                fit: BoxFit.cover)),
                      ),
                Text(
                  widget.userName,
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
