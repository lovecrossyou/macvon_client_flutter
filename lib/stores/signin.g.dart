// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Signin on _Signin, Store {
  final _$avatarInfoAtom = Atom(name: '_Signin.avatarInfo');

  @override
  dynamic get avatarInfo {
    _$avatarInfoAtom.context.enforceReadPolicy(_$avatarInfoAtom);
    _$avatarInfoAtom.reportObserved();
    return super.avatarInfo;
  }

  @override
  set avatarInfo(dynamic value) {
    _$avatarInfoAtom.context.conditionallyRunInAction(() {
      super.avatarInfo = value;
      _$avatarInfoAtom.reportChanged();
    }, _$avatarInfoAtom, name: '${_$avatarInfoAtom.name}_set');
  }

  final _$getAvatarAsyncAction = AsyncAction('getAvatar');

  @override
  Future getAvatar() {
    return _$getAvatarAsyncAction.run(() => super.getAvatar());
  }

  final _$_SigninActionController = ActionController(name: '_Signin');

  @override
  void setAvatar(dynamic data) {
    final _$actionInfo = _$_SigninActionController.startAction();
    try {
      return super.setAvatar(data);
    } finally {
      _$_SigninActionController.endAction(_$actionInfo);
    }
  }
}
