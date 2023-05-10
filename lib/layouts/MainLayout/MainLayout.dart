import 'package:flutter/material.dart';
import 'package:my_app/screens/home/home.dart';
import 'package:my_app/screens/settings/settings.dart';
import '../../ui/BottomNavBar/BottomNavBar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedTab = 0;
  void onTabNavBar(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  static const List<Widget> _pages = <Widget>[HomeScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedTab,
        children: _pages,
      ),
      bottomNavigationBar:
          BottomNavBar(selectedTab: selectedTab, onTabNavBar: onTabNavBar),
    );
  }
}
