import 'package:flutter/material.dart';

class BudgetList extends StatelessWidget {
  final List budgets;
  BudgetList(this.budgets);

  List<Widget> _renderList() {
    return budgets
        .map((budget) => Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text(budget['name']),
                subtitle: Text(budget['budgetType']),
                trailing: Text(budget['unassigned']),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: _renderList(),
    );
  }
}
