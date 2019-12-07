import 'package:dio/dio.dart';
import 'http_manager.dart';
import 'address.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static Future<String> getPrefix() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var et = prefs.getString("et");
    if (et == 'h0*6wr') return 'owner';
    if (et == r'W16j$P') return 'employee';
    return '';
  }

  static Future<bool> isOwner() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var et = prefs.getString("et");
    return et == 'h0*6wr';
  }

  // user
  static Future<bool> doLogin(Map<String, String> params) async {
    var response = await HttpManager.getInstance().post(Address.LOGIN, params);
    var headers = response.headers;
    var authorization = headers['authorization'][0];
    var et = headers['et'][0];

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", authorization);
    prefs.setString("et", et);
    return Api.isOwner();
  }

  static Future<dynamic> loadUserSetting() async {
    var preFix = await getPrefix();
    Response<dynamic> userResponse = await HttpManager.getInstance()
        .post(preFix + Address.OWNER_USER_SETTING, {});
    return userResponse.data;
  }

// card
  static Future<dynamic> loadAllCards() async {
    var preFix = await getPrefix();

    Response<dynamic> cardResponse = await HttpManager.getInstance()
        .post(preFix + Address.OWNER_LOAD_ALL_CARDS, {});
    return cardResponse.data;
  }

  static Future<dynamic> loadVCards() async {
    var preFix = await getPrefix();

    Response<dynamic> cardResponse = await HttpManager.getInstance()
        .post(preFix + Address.OWNER_LOAD_VCARDS, {});
    return cardResponse.data;
  }

  static Future<dynamic> loadPhysicalCard() async {
    var preFix = await getPrefix();
    print('preFix $preFix');
    Response<dynamic> cardResponse = await HttpManager.getInstance()
        .post(preFix + Address.OWNER_LOAD_ALL_CARDS, {});
    var card = cardResponse.data.first;
    var cardInfo = await loadVCardInfo({"id": "${card['id']}"});
    return cardInfo;
  }

  static Future<dynamic> loadVCardInfo(params) async {
    var preFix = await getPrefix();

    Response<dynamic> cardInfoResponse = await HttpManager.getInstance()
        .get(preFix + Address.OWNER_GET_CARD_INFO, params);
    return cardInfoResponse.data;
  }

// transaction
  static Future<dynamic> loadTxn() async {
    var preFix = await getPrefix();

    Response<dynamic> txnResponse = await HttpManager.getInstance()
        .post(preFix + Address.OWNER_PENGING_CLEAR_TXN, {});
    return txnResponse.data;
  }

// budget
  static Future<dynamic> getCompanyActiveBudgets() async {
    var preFix = await getPrefix();

    Map<String, dynamic> queryParameters = new Map<String, dynamic>();
    Response<dynamic> budgetResponse = await HttpManager.getInstance()
        .get(preFix + Address.OWNER_ACTIVE_BUDGETS, queryParameters);
    return budgetResponse.data;
  }

  //
  static Future<dynamic> getMyActiveMemberBudgets() async {
    var preFix = await getPrefix();

    Map<String, dynamic> queryParameters = new Map<String, dynamic>();
    Response<dynamic> budgetResponse = await HttpManager.getInstance()
        .get(preFix + Address.getMyActiveMemberBudgets, queryParameters);
    return budgetResponse.data;
  }
}
