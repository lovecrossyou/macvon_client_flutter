// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TransactionStore on _TransactionStore, Store {
  final _$txnsAtom = Atom(name: '_TransactionStore.txns');

  @override
  List get txns {
    _$txnsAtom.context.enforceReadPolicy(_$txnsAtom);
    _$txnsAtom.reportObserved();
    return super.txns;
  }

  @override
  set txns(List value) {
    _$txnsAtom.context.conditionallyRunInAction(() {
      super.txns = value;
      _$txnsAtom.reportChanged();
    }, _$txnsAtom, name: '${_$txnsAtom.name}_set');
  }

  final _$loadTxnAsyncAction = AsyncAction('loadTxn');

  @override
  Future loadTxn() {
    return _$loadTxnAsyncAction.run(() => super.loadTxn());
  }
}
