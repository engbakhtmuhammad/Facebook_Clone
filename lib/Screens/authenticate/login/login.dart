import 'package:facebook_clone/Services/auth.dart';
import 'package:facebook_clone/Screens/home/Home.dart';
import 'package:facebook_clone/Screens/authenticate/signup/signup.dart';
import 'package:facebook_clone/Screens/authenticate/signup/welcome.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Image.asset("assets/fb.jpg"),
              SizedBox(
                height: 15,
              ),
              Text("English . Arabic . More...."),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Phone or Email"),
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (val) =>
                      val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.blue,
                  height: 50,
                  width: 315,
                  child: FlatButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        //setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() {
                            //loading = false;
                            error = 'Could not sign in with those credentials';
                          });
                        }
                      }
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Forgotten Password ?",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 50,
              ),
              Text("____________________ OR ____________________"),
              SizedBox(
                height: 50,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.green,
                  height: 50,
                  width: 315,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Welcome()));
                    },
                    child: Text(
                      "Create New Facebook Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
