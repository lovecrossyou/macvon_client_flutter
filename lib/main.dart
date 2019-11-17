import 'package:flutter/material.dart';
import 'package:macvon_flutter/budget/select_budget.dart';
import 'package:macvon_flutter/signin/signin.dart';
import 'package:macvon_flutter/wallet/addcard.dart';
import 'bottom_navigation_widget.dart';

void main() =>runApp(MacnovApp());

class MacnovApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Macnov home',
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => BottomNavigationWidget(),
        '/signin': (BuildContext context) => Login(),
        '/newcard': (BuildContext context) => AddCard(),
        '/selectbudget': (BuildContext context) => SelectBudget(),
      },
    );
  }
}
