import 'package:flutter/material.dart';

enum bottomTabs { home, settings }

class BottomNavBar extends StatelessWidget {
  int selectedTab = 0;
  final Function(int) onTabNavBar;
  BottomNavBar({Key? key, this.selectedTab = 0, required this.onTabNavBar})
      : super(key: key);

  // void onTabNavBar(int index) {
  //   setState(() {
  //     selectedTab = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      selectedItemColor: Colors.amber[800],
      currentIndex: selectedTab,
      onTap: onTabNavBar,
    );
  }
}
