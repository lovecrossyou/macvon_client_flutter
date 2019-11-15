import 'http_manager.dart';
import 'address.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:jose/jose.dart';

class Api {
  static Future<Null> doLogin(Map<String, String> params, Function callback) async {
    var response = await HttpManager.getInstance().post(Address.LOGIN, params);
    print(response.toString());
    var headers = response.headers;
    var authorization = headers['authorization'][0];
    var token = authorization.replaceFirst("Bearer ", "");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", authorization);
    callback();
  }
}
