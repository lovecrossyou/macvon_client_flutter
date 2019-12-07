import 'package:macvon_flutter/utils/Api.dart';
import 'package:mobx/mobx.dart';

// Include generated file
part 'signin.g.dart';

// This is the class used by rest of your codebase
class Signin = _Signin with _$Signin;

// The store-class
abstract class _Signin with Store {
  @observable
  dynamic avatarInfo;

  @action
  void setAvatar(data) {
    avatarInfo = data;
  }

  @action
  Future getAvatar() async {
    var avatarInfoJson = await Api.getAvatar();
    avatarInfo = avatarInfoJson;
  }
}

final Signin signInStore = new Signin();
