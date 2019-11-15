import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';
void main()=> runApp(MacvonApp());

class MacvonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Macvon home',
      theme: ThemeData.light(),
      home: BottomNavigationWidget(),
    );
  }
}