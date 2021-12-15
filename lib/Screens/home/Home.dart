import 'package:facebook_clone/Screens/home/newsfeed/AppBarButton.dart';
import 'package:facebook_clone/Screens/home/notification/notification.dart';
import 'package:facebook_clone/Screens/home/profile/profile.dart';
import 'package:facebook_clone/Screens/home/setting/setting.dart';
import 'package:facebook_clone/Screens/home/video/OnDemandPostScreen.dart';
import 'package:facebook_clone/Screens/home/newsfeed/newsfeed.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'friends/friends.dart';

class MyHomePage extends StatefulWidget {
  final String currentUserId;

  const MyHomePage({Key key, this.currentUserId}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final TrackingScrollController scrollController = TrackingScrollController();
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 6, vsync: this);
    print('ye hai id ' + widget.currentUserId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new SafeArea(
        child: DefaultTabController(
          length: 4,
          child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  PreferredSize(
                    preferredSize: Size.fromHeight(50.0),
                    child: SliverAppBar(
                      pinned: false,
                      brightness: Brightness.light,
                      backgroundColor: Colors.white,
                      title: Text(
                        'facebook',
                        style: const TextStyle(
                          color: Color(0xFF1777F2),
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -1.2,
                        ),
                      ),
                      centerTitle: false,
                      floating: true,
                      actions: [
                        AppBarButton(
                          icon: Icons.search,
                          iconSize: 25.0,
                          onPressed: () => print('Search'),
                        ),
                        AppBarButton(
                          icon: MdiIcons.facebookMessenger,
                          iconSize: 25.0,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        controller: controller,
                        labelColor: Color(0xFF1777F2),
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(
                              icon: Icon(
                            Icons.home,
                            size: 25,
                          )),
                          Tab(icon: Icon(Icons.group, size: 25)),
                          Tab(icon: Icon(MdiIcons.bellOutline,size: 25)),
                          Tab(icon: Icon(Icons.ondemand_video, size: 25)),
                          Tab(icon: Icon(Icons.person, size: 25)),
                          Tab(icon: Icon(Icons.menu, size: 25)),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                controller: controller,
                children: [
                  NewsFeed(),
                  Friends(),
                  NotificationScreen(),
                  OnDemaindPostScreen(),
                  ProfileScreen(currentUserId: widget.currentUserId,),
                  SettingScreen()
                ],
              )),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
