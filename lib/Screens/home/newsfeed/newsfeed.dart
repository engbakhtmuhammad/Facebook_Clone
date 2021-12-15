import 'package:facebook_clone/Screens/home/newsfeed/AddPost.dart';
import 'package:facebook_clone/Screens/home/newsfeed/Post.dart';
import 'package:facebook_clone/Screens/home/newsfeed/Stories.dart';
import 'package:facebook_clone/Screens/home/newsfeed/CreateRoom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsFeed extends StatefulWidget {
  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AddPost(),
              CreateRoomScreen(),
              Container(
                height: 280,
                child: Card(
                  elevation: 0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      StoriesScreen(
                        StoryImage:
                            "https://firebasestorage.googleapis.com/v0/b/facebook-85805.appspot.com/o/images%2Fusers%2Fmale.png?alt=media&token=f5df83b1-54d7-4bfe-b60f-a3c30c50b525",
                        userImage:
                            "https://firebasestorage.googleapis.com/v0/b/facebook-85805.appspot.com/o/images%2Fusers%2Fmale.png?alt=media&token=f5df83b1-54d7-4bfe-b60f-a3c30c50b525",
                        userName: "Naeem",
                        first: true,
                      ),
                      StoriesScreen(
                          StoryImage:
                              "https://images.unsplash.com/flagged/photo-1556746834-1cb5b8fabd54?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2252&q=80",
                          userImage:
                              "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80",
                          userName: "Saleem",
                          first: false),
                      StoriesScreen(
                          StoryImage:
                              "https://images.unsplash.com/photo-1575997759258-91792eaaf87b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userImage:
                              "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2247&q=80",
                          userName: "Shehryar",
                          first: false),
                      StoriesScreen(
                          StoryImage:
                              "https://images.unsplash.com/photo-1505391847043-8b6e24dd6c28?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userImage:
                              "https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80",
                          userName: "Farooq Horn",
                          first: false),
                      StoriesScreen(
                          StoryImage:
                              "https://images.unsplash.com/photo-1594463750939-ebb28c3f7f75?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userImage:
                              "https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userName: "Asim",
                          first: false),
                      StoriesScreen(
                          StoryImage:
                              "https://images.unsplash.com/photo-1505391847043-8b6e24dd6c28?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userImage:
                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userName: "Maryam",
                          first: false),
                      StoriesScreen(
                          StoryImage:
                              "https://images.unsplash.com/photo-1585128993280-9456c19c987d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1872&q=80",
                          userImage:
                              "https://images.unsplash.com/photo-1544724107-6d5c4caaff30?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                          userName: "Naeem",
                          first: false),
                    ],
                  ),
                ),
              ),
              PostScreen(
                userImage:
                    'https://firebasestorage.googleapis.com/v0/b/facebook-85805.appspot.com/o/images%2Fusers%2Fmale.png?alt=media&token=f5df83b1-54d7-4bfe-b60f-a3c30c50b525',
                username: 'Naeem',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '3hrs',
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/facebook-85805.appspot.com/o/images%2Fusers%2Fmale.png?alt=media&token=f5df83b1-54d7-4bfe-b60f-a3c30c50b525',
                likes: '32',
                comments: '10',
                shares: '9',
              ),
              PostScreen(
                userImage:
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                username: 'Maryam',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '7hrs',
                imageUrl:
                    "https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '432',
                comments: '120',
                shares: '90',
              ),
              PostScreen(
                userImage:
                    'https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                username: 'Shehryar',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '8hrs',
                imageUrl: null,
                likes: '232',
                comments: '110',
                shares: '100',
              ),
              PostScreen(
                userImage:
                    'https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80',
                username: 'Asim',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '10hrs',
                imageUrl:
                    "https://images.unsplash.com/photo-1598225176697-e7fc9857917b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '22',
                comments: '130',
                shares: '30',
              ),
              PostScreen(
                userImage:
                    'https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2247&q=80',
                username: 'Farooq',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '12hrs',
                imageUrl:
                    "https://images.unsplash.com/photo-1558980664-3a031cf67ea8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '522',
                comments: '152',
                shares: '20',
              ),
              PostScreen(
                userImage:
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80',
                username: 'Naeem',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '2 days',
                imageUrl: null,
                likes: '123',
                comments: '12',
                shares: '1',
              ),
              PostScreen(
                userImage:
                    'https://images.unsplash.com/photo-1598211686290-a8ef209d87c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=3334&q=80',
                username: 'Saleem',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '2 days',
                imageUrl:
                    "https://images.unsplash.com/photo-1598259812920-0f409c9d3f14?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '125',
                comments: '13',
                shares: '4',
              ),
              PostScreen(
                userImage:
                    'https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                username: 'javed',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '1 week',
                imageUrl: null,
                likes: '534',
                comments: '423',
                shares: '103',
              ),
              PostScreen(
                userImage:
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                username: 'kaleem',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '2 week',
                imageUrl:
                    "https://images.unsplash.com/photo-1558981033-f5e2ddd9c57e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '23',
                comments: '13',
                shares: '1',
              ),
              PostScreen(
                userImage:
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1600&q=80',
                username: 'jameel',
                caption:
                    'This is a facebook clone app developed only for learning purpose. Thank you.',
                timeAgo: '2 week',
                imageUrl:
                    "https://images.unsplash.com/photo-1593642532781-03e79bf5bec2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60",
                likes: '21',
                comments: '20',
                shares: '23',
              ),
            ],
          ),
        ));
  }
}
