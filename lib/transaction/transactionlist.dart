import 'package:flutter/material.dart';
import 'package:macvon_flutter/common/loading.dart';

class TransactionList extends StatelessWidget {
  final List txns;
  TransactionList(this.txns);

  _renderAmount(txn) {
    return Text(
      r'$' + txn['amount'],
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  List<Widget> _renderList() {
    if (txns == null || txns.length == 0) return <Widget>[Loading()];
    return txns
        .map((txn) => Card(
              child: ListTile(
                // leading: FlutterLogo(size: 28.0),
                title: Text(txn['merchant']),
                subtitle: Text(txn['txnDate'],style: TextStyle(fontSize: 12),),
                trailing: this._renderAmount(txn),
              ),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: txns == null ? Loading() : _renderList(),
    );
  }
}
