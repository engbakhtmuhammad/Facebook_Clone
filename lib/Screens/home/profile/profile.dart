import 'package:facebook_clone/Screens/home/profile/addstory.dart';
import 'package:facebook_clone/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/Constants.dart';
import 'editprofile.dart';

class ProfileScreen extends StatefulWidget {
  final String currentUserId;

  const ProfileScreen({Key key, this.currentUserId}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: usersRef.doc(widget.currentUserId).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.amber),
            ),
          );
        }
        UserModel userModel = UserModel.fromDoc(snapshot.data);
        return SingleChildScrollView(
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
                      child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            userModel.coverImage,
                          ))),
                  Positioned(
                    top: 100,
                    left: 120,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(userModel.profilePicture),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                userModel.fname + " " + userModel.lname,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(userModel.bio),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddStory(),
                          ),
                        );
                        setState(() {});
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Container(
                          width: 230,
                          height: 50,
                          color: Colors.blueGrey,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  child: Icon(Icons.add)),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Add to story",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfile(
                              currentUserId: userModel,
                            ),
                          ),
                        );
                        setState(() {});
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: Container(
                          width: 150,
                          height: 50,
                          color: Colors.grey,
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 15,
                                  child: Icon(Icons.edit)),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Edit Profile",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 15,
              ),
              ListTile(
                leading: Icon(Icons.whatshot),
                title: Text(
                  "Studied BS SE at UMT",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  "Lives in Multan",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              ListTile(
                leading: Icon(Icons.access_time),
                title: Text(
                  "joined since 2016",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
