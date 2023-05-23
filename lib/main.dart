import 'package:app/FindScreen.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'MapScreen.dart';
import 'MoreScreen.dart';
import 'MyScreen.dart';
import 'Util/SalmonBottomBar.dart';




void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MainView createState() => MainView();
}

class MainView extends State<MyApp> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    FindScreen(),
    MyScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Center(
          child: _pages[_selectedIndex]
        ),
        bottomNavigationBar: BottomAppBar(
          child: SalomonBottomBar(
            currentIndex: _selectedIndex,
            onTap: (i) => setState(() => _selectedIndex = i),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                title: Text("홈"),
                selectedColor: Color(0xFF171559),
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.location_on_outlined,
                  size: 30,
                ),
                title: Text("가맹점"),
                selectedColor: Color(0xFF171559),
              ),

              /// Search
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.person_outline_sharp,
                  size: 30,
                ),
                title: Text("내 정보"),
                selectedColor: Color(0xFF171559),
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(
                  Icons.more_horiz_outlined,
                  size: 30,
                ),
                title: Text("더보기"),
                selectedColor: Color(0xFF171559),
              ),
            ],
          ),
        )
      ),
    );
  }
}







