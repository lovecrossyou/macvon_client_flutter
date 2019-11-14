import 'http_manager.dart';
import 'address.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jose/jose.dart';

class Api {
  static doLogin(Map<String, String> params) async {
    var response = await HttpManager.getInstance().post(Address.LOGIN, params);
    var headers = response.headers;
    var authorization = headers['authorization'][0];
    var token = authorization.replaceFirst("Bearer ", "");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    var jwt = new JsonWebToken.unverified(token);
    print("claims: ${jwt.claims}");
  }
}
