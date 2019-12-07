import 'package:mobx/mobx.dart';

// Include generated file
part 'signin.g.dart';

// This is the class used by rest of your codebase
class Signin = _Signin with _$Signin;

// The store-class
abstract class _Signin with Store {
  @observable
  String apiRolePrefix = '';
  @action
  void setApiPrefix(prefix) {
    apiRolePrefix = prefix;
  }
}

final Signin signInStore = new Signin();
