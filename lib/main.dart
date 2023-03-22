import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/closet.dart';
import 'screens/tracker.dart';
import 'screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WearWise',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: Colors.black),
      ),
      home: const MyHomePage(title: 'WearWise'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Home(),
    Closet(),
    Tracker(),
    Profile(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        unselectedItemColor: Color(0x66000000),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xfff2e3d5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checkroom),
            label: 'Closet',
            backgroundColor: Color(0xfff2e3d5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.query_stats),
            label: 'Tracker',
            backgroundColor: Color(0xfff2e3d5),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color(0xfff2e3d5),
          ),
        ],
      ),
    );
  }
}
