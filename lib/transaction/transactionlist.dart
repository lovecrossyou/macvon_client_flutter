import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  final List txns;
  TransactionList(this.txns);

  List<Widget> _renderList() {
    return txns
        .map((txn) => Card(
              child: ListTile(
                leading: FlutterLogo(size: 28.0),
                title: Text(txn['merchant']),
                subtitle: Text(txn['txnDate']),
                trailing: Text(txn['amount']),
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
