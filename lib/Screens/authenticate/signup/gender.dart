import 'package:facebook_clone/Screens/authenticate/signup/signup.dart';
import 'package:flutter/material.dart';

class Gender extends StatefulWidget {
  final String fname;
  final String lname;
  final DateTime selectedDate;

  const Gender({Key key, this.fname, this.lname, this.selectedDate})
      : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  String _selectedGender = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "What's your gender?",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: ListTile(
              trailing: Radio(
                activeColor: Colors.white,
                value: 'male',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              title: Text(
                'Male',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Divider(
              height: 10,
              color: Colors.white30,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: ListTile(
              trailing: Radio(
                activeColor: Colors.white,
                value: 'female',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              title: Text(
                'Female',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Divider(
              height: 10,
              color: Colors.white30,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: ListTile(
              trailing: Radio(
                activeColor: Colors.white,
                value: 'custom',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              title: Text(
                'Custom',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Divider(
              height: 10,
              color: Colors.white30,
            ),
          ),
          SizedBox(
            height: 60,
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
                          builder: (context) => Signup(
                                fname: widget.fname,
                                lname: widget.lname,
                                selectedDate: widget.selectedDate,
                                gender: _selectedGender,
                              )));
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
    );
  }
}
