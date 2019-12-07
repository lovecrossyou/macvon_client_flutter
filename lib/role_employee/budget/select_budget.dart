import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macvon_flutter/common/loading.dart';
import 'package:macvon_flutter/role_employee/budget/budget_list.dart';
import 'package:macvon_flutter/utils/Api.dart';

class HeaderItemBean {
  final String labelTitle;
  HeaderItemBean(this.labelTitle);
}

class SelectBudget extends StatefulWidget {
  @override
  _SelectBudget createState() => _SelectBudget();
}

class _SelectBudget extends State<SelectBudget> {
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

  _renderBody() {
    if (budgets == null) return Loading();
    return Container(
      child: BudgetList(budgets),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'select budget',
        home: new Scaffold(
            appBar: AppBar(
              title: Text('Select budget'),
            ),
            body: _renderBody()));
  }
}
