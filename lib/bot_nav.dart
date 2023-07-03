import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:medreminder/Profile/profile_page.dart';
import 'package:medreminder/Reminder/ui/theme.dart';
import 'package:medreminder/Settings/setting_page.dart';
import 'package:medreminder/home_page.dart';

void main() => runApp(MaterialApp(home: BotNav()));

class BotNav extends StatefulWidget {
  @override
  _BotNavState createState() => _BotNavState();
}

class _BotNavState extends State<BotNav> {
   int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SettingsPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor.withOpacity(0.2),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: context.theme.backgroundColor.withOpacity(0.2),
        color: Colors.grey.withOpacity(0.3),
        animationDuration: Duration(milliseconds: 450),
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.settings, size: 30),
            Icon(Icons.account_circle, size: 30),
          ],
            onTap: (index) {
              _onItemTapped(index);
            },
        ),
      body: Container(
      child: _widgetOptions.elementAt(_selectedIndex),),
    
    );
  }
}