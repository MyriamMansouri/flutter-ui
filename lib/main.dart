import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/page/chat_page.dart';
import 'package:flutter_ui/page/content_page.dart';
import 'package:flutter_ui/page/login_page.dart';
import 'package:flutter_ui/page/profile_page.dart';
import 'package:flutter_ui/page/settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Social',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  final _pageOptions = [
    ContentPage(title: "Content"),
    ChatPage(title: "Chat"),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.blueAccent,
        buttonBackgroundColor: Colors.white,
        height: 50,
        items: <Widget>[
          Icon(Icons.play_circle_outline, size: 30),
          Icon(Icons.chat, size: 30),
          Icon(Icons.account_circle, size: 30),
        ],
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.bounceInOut,
        onTap: (int index) {
          setState(() {
            _selectedTab = index;
          });
        },
      ),
    );
  }
}
