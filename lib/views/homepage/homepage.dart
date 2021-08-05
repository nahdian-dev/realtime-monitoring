import 'package:flutter/material.dart';
import 'package:realtime_monitoring/views/account/account.dart';
import 'package:realtime_monitoring/views/homepage/homepage_content.dart';
import 'package:realtime_monitoring/views/list_queue/list_queue.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = <Widget>[
    HomepageContent(),
    ListQueue(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QUEUING APPS"),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(label: "A", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "A", icon: Icon(Icons.rate_review)),
          BottomNavigationBarItem(label: "A", icon: Icon(Icons.person)),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}