import 'package:flutter/material.dart';
import 'package:macvon_flutter/wallet/wallet.dart';
import 'package:macvon_flutter/transaction/transaction.dart';
import 'package:macvon_flutter/more/more.dart';
import 'package:macvon_flutter/budget/budget.dart';

class BottomNavigationWidget extends StatefulWidget {
  BottomNavigationWidget({Key key}) : super(key: key);

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  final _bottomNavigationColor = Colors.blue;

  int _currentIndex = 0;
  List<Widget> list = List();
  @override
  void initState() {
    list..add(Wallet())..add(Transaction())..add(Budget())..add(More());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet,
                  color: _bottomNavigationColor),
              title: Text(
                'Wallet',
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box, color: _bottomNavigationColor),
              title: Text(
                'Transaction',
              )),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance, color: _bottomNavigationColor),
              title: Text('Budget')),
          BottomNavigationBarItem(
              icon: Icon(Icons.more, color: _bottomNavigationColor),
              title: Text(
                'More',
              ))
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
