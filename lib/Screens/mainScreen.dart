import 'package:examapp/Screens/sideBar.dart';
import 'package:flutter/material.dart';

import 'DashBoard.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: [
          SideBarScreen(),
          DashBoard()
        ],
      ),
    );
  }
}
