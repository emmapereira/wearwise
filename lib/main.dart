import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/closet.dart';
import 'screens/tracker.dart';
import 'screens/profile.dart';
import 'models/app_state.dart';

void main() {
  final appState = AppState();
  appState.init();
  runApp(MyApp(appState: appState));
}

class MyApp extends StatelessWidget {
  final AppState appState;
  const MyApp({Key? key, required this.appState}) : super(key: key);

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
      home: MyHomePage(title: 'WearWise', appState: appState),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title, required this.appState})
      : super(key: key);
  final String title;
  final AppState appState;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  /* final List<Widget> _children = [
    Home(selectedItems: widget.appState.selectedItems),
    Closet(),
    Tracker(),
    Profile(),
  ]; */

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      //body: _children[_currentIndex],
      body: _currentIndex == 0
          ? Home(selectedItems: widget.appState.selectedItems)
          : _currentIndex == 1
              ? Closet()
              : _currentIndex == 2
                  ? Tracker()
                  : Profile(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        unselectedItemColor: const Color(0x66000000),
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
