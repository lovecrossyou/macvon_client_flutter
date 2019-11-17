// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WalletStore on _WalletStore, Store {
  final _$physicalCardAtom = Atom(name: '_WalletStore.physicalCard');

  @override
  dynamic get physicalCard {
    _$physicalCardAtom.context.enforceReadPolicy(_$physicalCardAtom);
    _$physicalCardAtom.reportObserved();
    return super.physicalCard;
  }

  @override
  set physicalCard(dynamic value) {
    _$physicalCardAtom.context.conditionallyRunInAction(() {
      super.physicalCard = value;
      _$physicalCardAtom.reportChanged();
    }, _$physicalCardAtom, name: '${_$physicalCardAtom.name}_set');
  }

  final _$physicalCardInfoAtom = Atom(name: '_WalletStore.physicalCardInfo');

  @override
  dynamic get physicalCardInfo {
    _$physicalCardInfoAtom.context.enforceReadPolicy(_$physicalCardInfoAtom);
    _$physicalCardInfoAtom.reportObserved();
    return super.physicalCardInfo;
  }

  @override
  set physicalCardInfo(dynamic value) {
    _$physicalCardInfoAtom.context.conditionallyRunInAction(() {
      super.physicalCardInfo = value;
      _$physicalCardInfoAtom.reportChanged();
    }, _$physicalCardInfoAtom, name: '${_$physicalCardInfoAtom.name}_set');
  }

  final _$vcardsAtom = Atom(name: '_WalletStore.vcards');

  @override
  List get vcards {
    _$vcardsAtom.context.enforceReadPolicy(_$vcardsAtom);
    _$vcardsAtom.reportObserved();
    return super.vcards;
  }

  @override
  set vcards(List value) {
    _$vcardsAtom.context.conditionallyRunInAction(() {
      super.vcards = value;
      _$vcardsAtom.reportChanged();
    }, _$vcardsAtom, name: '${_$vcardsAtom.name}_set');
  }

  final _$loadVCardsAsyncAction = AsyncAction('loadVCards');

  @override
  Future loadVCards() {
    return _$loadVCardsAsyncAction.run(() => super.loadVCards());
  }

  final _$loadPhysicalCardAsyncAction = AsyncAction('loadPhysicalCard');

  @override
  Future loadPhysicalCard() {
    return _$loadPhysicalCardAsyncAction.run(() => super.loadPhysicalCard());
  }
}
