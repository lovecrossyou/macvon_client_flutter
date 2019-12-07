import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:macvon_flutter/common/indicator.dart';
import 'package:macvon_flutter/common/loading.dart';
import 'package:macvon_flutter/role_owner/budget/budget_list.dart';
import 'package:macvon_flutter/utils/Api.dart';

class HeaderItemBean {
  final String labelTitle;
  HeaderItemBean(this.labelTitle);
}

final List<HeaderItemBean> _allPages = <HeaderItemBean>[
  new HeaderItemBean("your budgets"),
  new HeaderItemBean("all budgets"),
];

class Budget extends StatefulWidget {
  @override
  _Budget createState() => _Budget();
}

class _Budget extends State<Budget> with AutomaticKeepAliveClientMixin{
  dynamic budgets;
  @override
  void initState() {
    super.initState();
    _loadBudgets();
  }

  _loadBudgets() async {
    var budgetsData = await Api.getCompanyActiveBudgets();
    setState(() {
      budgets = budgetsData;
    });
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
    if (budgets == null) return Loading();
    return new TabBarView(
      children: <Widget>[
        new BudgetList(budgets),
        new BudgetList(budgets),
      ],
    );
  }

  Widget _renderHeader() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            'Budgets',
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
