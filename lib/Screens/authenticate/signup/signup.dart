import 'package:facebook_clone/Services/auth.dart';
import 'package:facebook_clone/Screens/home/Home.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  final String fname;
  final String lname;
  final DateTime selectedDate;
  final String gender;

  const Signup(
      {Key key, this.fname, this.lname, this.selectedDate, this.gender})
      : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';

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
                  decoration: InputDecoration(hintText: "Email"),
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
                        bool isValid = await _auth.registerWithEmailAndPassword(
                            widget.fname,
                            widget.lname,
                            'Flutter Developer',
                            email,
                            password);
                        /*if (isValid) {
                          print(isValid);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        } else {
                          print('something wrong');
                        }*/
                        //print(email+password);
                        /*if (result == null) {
                          setState(() {
                            //loading = false;
                            error = 'Please supply a valid email';
                          });
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyHomePage()));
                        }*/
                      }
                    },
                    child: Text(
                      "Sign Up",
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
