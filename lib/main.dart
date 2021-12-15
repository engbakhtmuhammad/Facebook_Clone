import 'dart:async';
import 'package:facebook_clone/Services/auth.dart';
import 'package:facebook_clone/Screens/authenticate/login/login.dart';
import 'package:facebook_clone/Screens/splash/splash.dart';
import 'package:facebook_clone/Screens/wrapper.dart';
import 'package:facebook_clone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
        value: AuthService().user,
        initialData: null,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        ));
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      Timer(Duration(seconds: 5), () {
        setState(() => this.isLoading = false);
      });
      return SplashPage();
    }
    return Login();
  }
}
