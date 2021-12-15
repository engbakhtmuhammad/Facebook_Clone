import 'package:facebook_clone/Screens/authenticate/login/login.dart';
import 'package:facebook_clone/Screens/authenticate/signup/dateofbirth.dart';
import 'package:flutter/material.dart';

class Name extends StatefulWidget {
  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  // text field state
  String fname = '';
  String lname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "What's your name?",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "First Name",
                    hintStyle: TextStyle(
                      color: Colors.white54,
                    )),
                validator: (val) => val.isEmpty ? 'Enter first name' : null,
                onChanged: (val) {
                  setState(() => fname = val);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Sur Name",
                    hintStyle: TextStyle(color: Colors.white54)),
                validator: (val) => val.isEmpty ? 'Enter last name' : null,
                onChanged: (val) {
                  setState(() => lname = val);
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.blue,
                height: 50,
                width: 315,
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DateOfBirth(fname: fname, lname: lname)));
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
