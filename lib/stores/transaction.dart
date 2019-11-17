import 'package:macvon_flutter/utils/Api.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'transaction.g.dart';

// This is the class used by rest of your codebase
class TransactionStore = _TransactionStore with _$TransactionStore;

// The store-class
abstract class _TransactionStore with Store {
  @observable
  List txns = [];

  @action
  Future loadTxn() async {
    var txnsData = await Api.loadTxn();
    txns = txnsData;
  }
}
