import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/page/chat_page.dart';
import 'package:flutter_ui/page/content_page.dart';
import 'package:flutter_ui/page/login_page.dart';
import 'package:flutter_ui/page/profile_page.dart';
import 'package:flutter_ui/page/settings_page.dart';
import 'package:flutter_ui/util/SizeConfig.dart';
import 'package:flutter_ui/util/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
        initTheme: kDarkTheme,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Social',
                  theme: ThemeProvider.of(context),
                  home: HomePage(),
                );
              },
            );
          },
        ));
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
    LoginPage(),
    ChatPage(title: "Chat"),
    SettingsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: Colors.blueAccent,
        buttonBackgroundColor: Colors.blue,
        height: 50,
        items: <Widget>[
          Icon(Icons.play_circle_outline, size: 30),
          Icon(Icons.chat, size: 30),
          Icon(Icons.account_circle, size: 30),
          Icon(Icons.settings, size: 30),
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
