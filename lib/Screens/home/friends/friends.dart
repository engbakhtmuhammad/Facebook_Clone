import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Friends'),
            backgroundColor: Colors.white,
            centerTitle: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _getFriendsFiter(),
              Divider(),
              _getFriendRequests(),
              Divider(),
              _getFriendSuggestions(),
            ]),
          )
        ],
      ),
    );
  }

  Widget _getSectionHeader(String _title) {
    return Container(
      child: Text(
        _title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      decoration: BoxDecoration(
          //color: Colors.purple,
          ),
    );
  }

  Widget _getFirendAvatar() {
    return Container(
      child: CircleAvatar(
        backgroundImage: NetworkImage('assets/images/user1.jpeg'),
        radius: 60.0,
      ),
      constraints: BoxConstraints(maxWidth: 100, maxHeight: 100),
      decoration: BoxDecoration(
          // color: Colors.green,
          ),
    );
  }

  Widget _getFriendsFiter() {
    return Container(
        child: Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text('Suggestions', style: TextStyle(color: Colors.black)),
              color: Color(0xffEBECF0),
              splashColor: Color(0xffDCDDDF),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            FlatButton(
              onPressed: () {},
              child: Text('All Friends', style: TextStyle(color: Colors.black)),
              color: Color(0xffEBECF0),
              splashColor: Color(0xffDCDDDF),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
          ],
        ),
        decoration: BoxDecoration(
            //  color: Colors.pink,
            ),
        // height: 100,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0));
  }

  Widget _getFriendRequests() {
    return Container(
      child: Column(
          children: <Widget>[
            _getSectionHeader('Friend Requests'),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            _getFriendRequest(),
            _getFriendRequest(),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start),
      decoration: BoxDecoration(
          //color: Colors.yellow,
          ),
      padding: EdgeInsets.only(left: 12, right: 12),
      //  height: 400,
    );
  }

  Widget _getFriendRequest() {
    return Container(
        padding: new EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: <Widget>[
            _getFirendAvatar(),
            Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Muhammad Naeem',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '6 mutual friends',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            onPressed: () {},
                            child: Text('Confirm',
                                style: TextStyle(color: Colors.white)),
                            color: Theme.of(context).primaryColor,
                            splashColor: Color(0xffDCDDDF),
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                        ),
                        Expanded(
                          child: FlatButton(
                            onPressed: () {},
                            child: Text('Delete',
                                style: TextStyle(color: Colors.black)),
                            color: Color(0xffDCDDDF),
                            splashColor: Color(0xffEBECF0),
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                decoration: BoxDecoration(
                    //color: Colors.pink,
                    ),
                height: 100,
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }

  Widget _getFriendSuggestions() {
    return Container(
      child: Column(
          children: <Widget>[
            _getSectionHeader('People you may know'),
            Padding(
              padding: EdgeInsets.all(5),
            ),
            _getFriendSuggestion(),
            _getFriendSuggestion(),
            _getFriendSuggestion(),
            _getFriendSuggestion(),
            _getFriendSuggestion(),
            _getFriendSuggestion(),
            _getFriendSuggestion(),
            _getFriendSuggestion(),
            _getFriendSuggestion(),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start),
      decoration: BoxDecoration(
          //color: Colors.yellow,
          ),
      padding: EdgeInsets.only(left: 12, right: 12),
     // height: 400,
    );
  }

  Widget _getFriendSuggestion(){
     return Container(
        padding: new EdgeInsets.only(bottom: 10.0),
        child: Row(
          children: <Widget>[
            _getFirendAvatar(),
            Padding(
              padding: EdgeInsets.only(right: 10),
            ),
            Expanded(
              flex: 5,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Muhamad Saleem',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '6 mutual friends',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                            onPressed: () {},
                            child: Text('Add Friend',
                                style: TextStyle(color: Colors.white)),
                            color: Theme.of(context).primaryColor,
                            splashColor: Color(0xffDCDDDF),
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                        ),
                        Expanded(
                          child: FlatButton(
                            onPressed: () {},
                            child: Text('Remove',
                                style: TextStyle(color: Colors.black)),
                            color: Color(0xffDCDDDF),
                            splashColor: Color(0xffEBECF0),
                            textColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                decoration: BoxDecoration(
                    //color: Colors.pink,
                    ),
                height: 100,
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }
}
