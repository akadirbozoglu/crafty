import 'package:flutter/material.dart';
import 'package:crafty/meeting.dart';
import 'package:crafty/profil.dart';
import 'package:crafty/homepagesupp.dart';

class HomePage1 extends StatefulWidget {
  final int userNO;
  HomePage1({this.userNO});

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      Homepagesupp(),
      meeting(),
      profil(userNo: widget.userNO,),
    ];
    return MaterialApp(
      title: "Crafty Home",
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Crafty Home')),
          backgroundColor: Colors.brown[900],
        ),
        body: _pageOptions[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.brown[100],
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Malzemeler',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: 'Toplantı',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
