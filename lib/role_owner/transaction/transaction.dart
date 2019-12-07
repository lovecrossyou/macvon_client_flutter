import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:macvon_flutter/common/indicator.dart';
import 'package:macvon_flutter/role_owner/transaction/transactionlist.dart';
import 'package:macvon_flutter/stores/transaction.dart';

final transactionStore = TransactionStore();

class HeaderItemBean {
  final String labelTitle;
  HeaderItemBean(this.labelTitle);
}

final List<HeaderItemBean> _allPages = <HeaderItemBean>[
  new HeaderItemBean("your transactions"),
  new HeaderItemBean("all transactions"),
];

class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    transactionStore.loadTxn();
  }

  Widget _renderTabs() {
    return Material(
      color: Colors.white,
      child: new TabBar(
        isScrollable: true,
        indicator: YLStatisticsIndictor(),
        tabs: _allPages
            .map((HeaderItemBean page) => new Tab(
                    child: Text(
                  page.labelTitle,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )))
            .toList(),
      ),
    );
  }

  Widget _renderBody() {
    return Observer(
      builder: (_) => TabBarView(
      children: <Widget>[
        new TransactionList(transactionStore.txns),
        new TransactionList(transactionStore.txns),
      ]),
    );
  }

  Widget _renderHeader() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            'Transaction',
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new DefaultTabController(
        length: _allPages.length,
        child: new Scaffold(
          appBar: new AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            elevation: 0,
            title: _renderHeader(),
          ),
          body: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: _renderTabs(),
                height: 30,
                width: MediaQuery.of(context).size.width,
              ),
              Expanded(
                child: _renderBody(),
              )
            ],
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
