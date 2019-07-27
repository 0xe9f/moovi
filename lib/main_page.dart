import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:moovi/ui/library/library.dart';

final PageStorageBucket bucket = PageStorageBucket();


class Main extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MainState();
  }
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  final _navOptions = [
    Library(), Library(), Library(), Library(), 
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(34, 40, 49, 1.0),
      body: Container(child: _navOptions[_currentIndex]),
      /*bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color.fromRGBO(57, 62, 70, 1.0),
        currentIndex: _currentIndex,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
         // _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.white30,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.video_library),
            title: Text('Home'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.white30,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.notifications),
            title: Text('Notifications'),
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.white30,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.account_box),
            title: Text('Profile'),
            activeColor: Colors.amberAccent,
            inactiveColor: Colors.white30,
          ),
        ],
      ),*/
    );
  }
}
