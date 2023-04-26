import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
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
  State<MyHomePage> createState() =>
      _MyHomePageState(selectedItems: appState.selectedItems);
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<String> selectedItems;

  _MyHomePageState({required this.selectedItems});

  /* final List<Widget> _children = [
    Home(selectedItems: widget.appState.selectedItems),
    Closet(),
    Tracker(),
    Profile(),
  ];  */
  List<String> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems = widget.appState.selectedItems;
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Navigator(
        onGenerateRoute: (RouteSettings settings) {
          Widget page;
          switch (settings.name) {
            case '/':
              page = Home(selectedItems: widget.appState.selectedItems);
              break;
            case '/closet':
              page = Closet();
              break;
            case '/tracker':
              page = Tracker();
              break;
            case '/profile':
              page = Profile();
              break;
            default:
              page = Home(selectedItems: widget.appState.selectedItems);
              break;
          }
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => page,
            transitionDuration: Duration(seconds: 0),
          );
        },
      ),
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
    ); */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      //body: _children[_currentIndex],
      /* body: _currentIndex == 0
          ? Home(selectedItems: _selectedItems)
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
      ), */
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Home(selectedItems: _selectedItems, currentIndex: _currentIndex),
          Closet(),
          Tracker(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTabTapped: onTabTapped,
      ),
    );
  }
}
