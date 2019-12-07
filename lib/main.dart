import 'package:flutter/material.dart';
import 'package:macvon_flutter/signin/signin.dart';

// owner
import 'package:macvon_flutter/role_owner/bottom_navigation_widget.dart'
    as owner;
import 'package:macvon_flutter/role_owner/budget/select_budget.dart' as owner;
import 'package:macvon_flutter/role_owner/wallet/addcard.dart' as owner;

// employee
import 'package:macvon_flutter/role_employee/bottom_navigation_widget.dart'
    as employee;
import 'package:macvon_flutter/role_employee/budget/select_budget.dart'
    as employee;
import 'package:macvon_flutter/role_employee/wallet/addcard.dart' as employee;

void main() => runApp(MacnovApp());

class MacnovApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: MaterialApp(
      title: 'Macnov home',
      theme: ThemeData.light(),
      initialRoute: 'signin',
      routes: <String, WidgetBuilder>{
        '/signin': (BuildContext context) => Login(),
        '/owner': (BuildContext context) => owner.BottomNavigationWidget(),
        '/owner/newcard': (BuildContext context) => owner.AddCard(),
        '/owner/selectbudget': (BuildContext context) => owner.SelectBudget(),
        '/': (BuildContext context) => employee.BottomNavigationWidget(),
        '/employee/newcard': (BuildContext context) => employee.AddCard(),
        '/employee/selectbudget': (BuildContext context) =>
            employee.SelectBudget(),
      },
    ));
  }
}
