import 'package:facebook_clone/Screens/authenticate/signup/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:provider/provider.dart';

class DateOfBirth extends StatefulWidget {
  final String fname;
  final String lname;

  const DateOfBirth({Key key, this.fname, this.lname}) : super(key: key);
  @override
  State<DateOfBirth> createState() => _DateOfBirthState();
}

class _DateOfBirthState extends State<DateOfBirth> {
  DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "What's your date of birth?",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Material(
              color: Colors.transparent,
              child: DatePickerWidget(
                looping: false,
                firstDate: DateTime(1900, 1, 1),
                lastDate: DateTime.now(),
                //initialDate: DateTime.now(), // DateTime(1994),
                dateFormat: "yyyy-MM-dd",
                onChange: (DateTime newDate, _) {

                  selectedDate = newDate;
                  //print(_selectedDate);
                },
                pickerTheme: DateTimePickerTheme(
                  itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                  dividerColor: Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: Colors.blue,
              height: 50,
              width: 315,
              child: FlatButton(
                onPressed: () {
                  //print(Provider.of<String>(context, listen: false));
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Gender(fname: widget.fname, lname: widget.lname,selectedDate: selectedDate,)));
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
