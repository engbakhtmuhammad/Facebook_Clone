import 'package:flutter/material.dart';
class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Text("Notification",
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            trailing: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.search,color: Colors.black,)),
          ),
          SizedBox(height: 5,),
          Row(
            children: <Widget>[
              SizedBox(width: 15,),
              Text("Earlier",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
            ],
          ),
          ListTile(
            leading: CircleAvatar(
            backgroundImage: AssetImage("assets/g1.jpg"),
            ),
            title: Text("Someonw has reacted to your post"),
            trailing: Icon(Icons.menu),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/dp.jpg"),
            ),
            title: Text("Someonw has reacted to your post"),
            trailing: Icon(Icons.menu),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/fb.jpg"),
            ),
            title: Text("Someonw has reacted to your post"),
            trailing: Icon(Icons.menu),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/flutter.jpeg"),
            ),
            title: Text("Someonw has reacted to your post"),
            trailing: Icon(Icons.menu),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/g1.jpg"),
            ),
            title: Text("Someonw has reacted to your post"),
            trailing: Icon(Icons.menu),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/g1.jpg"),
            ),
            title: Text("Someonw has reacted to your post"),
            trailing: Icon(Icons.menu),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/g1.jpg"),
            ),
            title: Text("Someonw has reacted to your post"),
            trailing: Icon(Icons.menu),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/g1.jpg"),
            ),
            title: Text("Someonw has reacted to your post"),
            trailing: Icon(Icons.menu),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/g1.jpg"),
            ),
            title: Text("Someonw has reacted to your post"),
            trailing: Icon(Icons.menu),
          ), ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/g1.jpg"),
            ),
            title: Text("Someonw has reacted to your post"),
            trailing: Icon(Icons.menu),
          )
        ],
      ),
    );
  }
}
