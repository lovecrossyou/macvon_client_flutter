// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Signin on _Signin, Store {
  final _$apiRolePrefixAtom = Atom(name: '_Signin.apiRolePrefix');

  @override
  String get apiRolePrefix {
    _$apiRolePrefixAtom.context.enforceReadPolicy(_$apiRolePrefixAtom);
    _$apiRolePrefixAtom.reportObserved();
    return super.apiRolePrefix;
  }

  @override
  set apiRolePrefix(String value) {
    _$apiRolePrefixAtom.context.conditionallyRunInAction(() {
      super.apiRolePrefix = value;
      _$apiRolePrefixAtom.reportChanged();
    }, _$apiRolePrefixAtom, name: '${_$apiRolePrefixAtom.name}_set');
  }

  final _$_SigninActionController = ActionController(name: '_Signin');

  @override
  void setApiPrefix(dynamic prefix) {
    final _$actionInfo = _$_SigninActionController.startAction();
    try {
      return super.setApiPrefix(prefix);
    } finally {
      _$_SigninActionController.endAction(_$actionInfo);
    }
  }
}
