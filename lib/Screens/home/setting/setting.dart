import 'package:facebook_clone/Services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[200],
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Text("Menu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              trailing: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/facebook-85805.appspot.com/o/images%2Fusers%2Fmale.png?alt=media&token=f5df83b1-54d7-4bfe-b60f-a3c30c50b525"),
              ),
              title: Text(
                "Muhammad Naeem \n see your profile",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://pakbrunei.com.pk/wp-content/uploads/2020/04/Coronavirus-CDC-645x645.jpg"),
              ),
              title: Text(
                "COVID-19 Information Center",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://thumbs.dreamstime.com/z/live-stream-isolated-logo-live-stream-isolated-logo-air-recording-breaking-news-134183336.jpg"),
              ),
              title: Text(
                "Live Video",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.lovepik.com/element/45000/7699.png_860.png"),
              ),
              title: Text(
                "Jobs",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    height: 150,
                    width: 200,
                    color: Colors.white,
                    child: Card(
                      elevation: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/fb.jpg"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Update Facebook")
                        ],
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    height: 150,
                    width: 200,
                    color: Colors.white,
                    child: Card(
                      elevation: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://img.lovepik.com/element/45000/7699.png_860.png"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Find Jobs")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    height: 150,
                    width: 200,
                    color: Colors.white,
                    child: Card(
                      elevation: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "data:image/png;base64,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"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("Settings")
                        ],
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: Container(
                    height: 150,
                    width: 200,
                    color: Colors.white,
                    child: Card(
                      elevation: 6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/flutter.jpeg"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("About Us")
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Log out"),
              onTap: () async {
                await _auth.signOut();
              },
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
