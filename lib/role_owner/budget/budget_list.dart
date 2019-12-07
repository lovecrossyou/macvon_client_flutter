import 'package:flutter/material.dart';

class BudgetList extends StatelessWidget {
  final List budgets;
  BudgetList(this.budgets);

  _renderAmount(budget) {
    var amountStr = budget['unassigned']?? '-';
    return Text(
      r'$' + amountStr.toString(),
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }


  List<Widget> _renderList() {
    return budgets
        .map((budget) => Card(
              child: ListTile(
                // leading: FlutterLogo(size: 28.0),
                title: Text(budget['name'],style: TextStyle(fontSize: 18),),
                subtitle: Text("${budget['budgetType'].toString().toUpperCase()}",style: TextStyle(fontSize: 12),),
                trailing: this._renderAmount(budget),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: _renderList(),
    );
  }
}
