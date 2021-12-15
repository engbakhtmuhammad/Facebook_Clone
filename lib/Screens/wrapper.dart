import 'package:facebook_clone/Screens/authenticate/login/login.dart';
import 'package:facebook_clone/Screens/home/Home.dart';
import 'package:facebook_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    // return either the Home or Authenticate widget
  if (user == null){
      return Login();
    } else {
      return MyHomePage(currentUserId: user.uid,);
    }
  }
}
