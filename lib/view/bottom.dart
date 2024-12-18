import 'package:flutter/material.dart';
import 'package:hotstar/view/downloads/download.dart';
import 'package:hotstar/view/home/home.dart';
import 'package:hotstar/view/my_space/myspace.dart';
import 'package:hotstar/view/new&hot/newandhot.dart';
import 'package:hotstar/view/search/search.dart';

class BottomN extends StatefulWidget {
  const BottomN({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNState createState() => _BottomNState();
}

class _BottomNState extends State<BottomN> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const Homepage(),
    const Search(),
   const HotAndNew(),
    const Downloads(),
    const MySpace()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.black, 
        selectedItemColor: Colors.white, 
        unselectedItemColor: Colors.grey, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_rounded),
            label: 'Hot & New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'Downloads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_outlined),
            label: 'My Space',
          ),
        ],
      ),
    );
  }
}
