import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:macvon_flutter/signin/signin.dart';
import 'package:macvon_flutter/utils/event_bus.dart';
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
  var tabImages;
  var appBarTitles = ['Wallet', 'Transaction', 'Budget', 'More'];
  var _loginSubscription;
  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void dispose() {
    super.dispose();
    //取消订阅
    _loginSubscription.cancel();
  }

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _currentIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _currentIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff1296db)));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: const Color(0xff515151)));
    }
  }

  void initData() {
    tabImages = [
      [
        getTabImage('assets/tab_icon/tab_icon_budgets_d.png'),
        getTabImage('assets/tab_icon/tab_icon_budgets_s.png')
      ],
      [
        getTabImage('assets/tab_icon/tab_icon_more_d.png'),
        getTabImage('assets/tab_icon/tab_icon_more_s.png')
      ],
      [
        getTabImage('assets/tab_icon/tab_icon_transactions_d.png'),
        getTabImage('assets/tab_icon/tab_icon_transactions_s.png')
      ],
      [
        getTabImage('assets/tab_icon/tab_icon_wallet_d.png'),
        getTabImage('assets/tab_icon/tab_icon_wallet_s.png')
      ]
    ];
  }

  @override
  void initState() {
    list..add(Wallet())..add(Transaction())..add(Budget())..add(More());
    super.initState();
    _subscribeEventBus();
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: getTabIcon(0), title: getTabTitle(0)),
          new BottomNavigationBarItem(
              icon: getTabIcon(1), title: getTabTitle(1)),
          new BottomNavigationBarItem(
              icon: getTabIcon(2), title: getTabTitle(2)),
          new BottomNavigationBarItem(
              icon: getTabIcon(3), title: getTabTitle(3)),
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

  _subscribeEventBus() {
    //订阅login event
    _loginSubscription = eventBus.on<LoginEvent>().listen((event) {
      _goLoginPage();
    });
  }

  _goLoginPage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return Login();
    }));
  }
}
