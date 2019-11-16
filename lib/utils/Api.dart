import 'package:dio/dio.dart';
import 'http_manager.dart';
import 'address.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static Future<Null> doLogin(
      Map<String, String> params, Function callback) async {
    var response = await HttpManager.getInstance().post(Address.LOGIN, params);
    print(response.toString());
    var headers = response.headers;
    var authorization = headers['authorization'][0];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", authorization);
    callback();
  }

  static Future<dynamic> loadAllCards() async {
    Response<dynamic> cardResponse =
        await HttpManager.getInstance().post(Address.OWNER_LOAD_ALL_CARDS, {});
    return cardResponse.data;
  }

  static Future<dynamic> loadVCards() async {
    Response<dynamic> cardResponse =
        await HttpManager.getInstance().post(Address.OWNER_LOAD_VCARDS, {});
    return cardResponse.data;
  }

  static Future<dynamic> loadPhysicalCard() async {
    Response<dynamic> cardResponse =
        await HttpManager.getInstance().post(Address.OWNER_LOAD_ALL_CARDS, {});
    var card = cardResponse.data.first;
    var cardInfo = await loadVCardInfo({"id": "${card['id']}"});
    return cardInfo;
  }

  static Future<dynamic> loadVCardInfo(params) async {
    Response<dynamic> cardInfoResponse = await HttpManager.getInstance()
        .get(Address.OWNER_GET_CARD_INFO, params);
    return cardInfoResponse.data;
  }

  static Future<dynamic> loadTxn() async {
    Response<dynamic> txnResponse = await HttpManager.getInstance()
        .post(Address.OWNER_PENGING_CLEAR_TXN, {});
    return txnResponse.data;
  }

  static Future<dynamic> getCompanyActiveBudgets() async {
    Map<String, dynamic> queryParameters = new Map<String, dynamic>();
    Response<dynamic> budgetResponse = await HttpManager.getInstance()
        .get(Address.OWNER_ACTIVE_BUDGETS, queryParameters);
    return budgetResponse.data;
  }
}
