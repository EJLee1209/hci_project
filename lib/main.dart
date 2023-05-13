import 'package:flutter/material.dart';

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
    MapScreen(),
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
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8.0,
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 35,
                  ),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: Icon(
                    Icons.location_on_outlined,
                    size: 35,
                  ),
                  onPressed: () => _onItemTapped(1),
                ),
                IconButton(
                  icon: Icon(
                      Icons.person,
                    size: 35,
                  ),
                  onPressed: () => _onItemTapped(2),
                ),
                IconButton(
                  icon: Icon(
                      Icons.more_horiz,
                    size: 35,
                  ),
                  onPressed: () => _onItemTapped(3),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}

// 홈 화면 - Home Screen
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 1'),
    );
  }
}

// 가맹점 찾기 - Map Screen
class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Map Screen'),
    );
  }
}

// 내 정보 - My Screen
class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('My Screen'),
    );
  }
}

// 더 보기 - More Screen
class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('More Screen'),
    );
  }
}
