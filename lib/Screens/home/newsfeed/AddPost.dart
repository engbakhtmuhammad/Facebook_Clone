//import 'package:cached_network_image/cached_network_image.dart';

import 'package:facebook_clone/Screens/home/newsfeed/CreatePost.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(AddPost());
}

class AddPost extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AddPostPage();
  }
}

class AddPostPage extends StatefulWidget {
  AddPostPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPostPage> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Color(0xFF1777F2),
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/facebook-85805.appspot.com/o/images%2Fusers%2Fmale.png?alt=media&token=f5df83b1-54d7-4bfe-b60f-a3c30c50b525"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20.0),
                Expanded(
                  child: TextButton(
                    child: Text('What\'s on your mind?'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreatePost()));
                    },
                  ),
                )
              ],
            ),
            const Divider(height: 20.0, thickness: 0.5),
            Container(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: () => print('Live'),
                    icon: const Icon(
                      MdiIcons.videoImage,
                      color: Colors.red,
                      size: 20,
                    ),
                    label: Text('Live'),
                  ),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  FlatButton.icon(
                    onPressed: () => print('Photo'),
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.lightGreen,
                      size: 20,
                    ),
                    label: Text('Photo'),
                  ),
                  const VerticalDivider(width: 8.0),
                  FlatButton.icon(
                    onPressed: () => print('Room'),
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.deepPurpleAccent,
                      size: 20,
                    ),
                    label: Text('Room'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
