import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: currentIndex,
      unselectedItemColor: const Color(0x66000000),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor: Color(0xff4F518C),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.checkroom),
          label: 'Closet',
          backgroundColor: Color(0xff4F518C),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.query_stats),
          label: 'Tracker',
          backgroundColor: Color(0xff4F518C),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
          backgroundColor: Color(0xff4F518C),
        ),
      ],
    );
  }
}
