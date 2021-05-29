import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:rentcar/screen/login_screen.dart';
import 'package:rentcar/screen/search_screen.dart';
import 'package:rentcar/screen/settings_screen.dart';
import 'package:rentcar/screen/home_screen.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 2;
  GlobalKey _bottomNavigationKey = GlobalKey();
  List<Widget>  screens =[
    SettingsScreen(),
    SearcScreen(),
    HomeScreen(),
    LoginPage()

   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.settings, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.person, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.cyan,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: screens[_page]);
        
  }
}