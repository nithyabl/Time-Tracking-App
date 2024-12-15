import 'package:flutter/material.dart';
import 'package:time_tracking_app_new/core/constants/color_constants.dart';
import 'package:time_tracking_app_new/core/constants/string_constants.dart';

import 'package:time_tracking_app_new/presentation/screens/home/view/MenuScreen.dart';
import 'package:time_tracking_app_new/presentation/screens/home/view/homeScreen.dart';

class Dashboardscreen extends StatefulWidget {
  const Dashboardscreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Dashboardscreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Homescreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstants.tabBarColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: StringConstants.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: StringConstants.menu,
          ),
        ],
      ),
    );
  }
}
