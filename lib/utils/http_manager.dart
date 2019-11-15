import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'code.dart';

// import 'response_interceptor.dart';
import 'result_data.dart';
import 'address.dart';

class HttpManager {
  static HttpManager _instance = HttpManager._internal();
  Dio _dio;

  static const CODE_SUCCESS = 200;
  static const CODE_TIME_OUT = -1;
  factory HttpManager() => _instance;

  ///通用全局单例，第一次使用时初始化
  HttpManager._internal({String baseUrl}) {
    if (null == _dio) {
      _dio = new Dio(
          new BaseOptions(baseUrl: Address.BASE_URL, connectTimeout: 15000));
      tokenInterceptor();
      // _dio.interceptors.add(tokenInterceptor());
    }
  }

  static HttpManager getInstance({String baseUrl}) {
    if (baseUrl == null) {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  tokenInterceptor() {
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      // 在发送请求之前做一些预处理
      //我这边是在发送前到SharedPreferences（本地存储）中取出token的值，然后添加到请求头中
      //dio.lock()是先锁定请求不发送出去，当整个取值添加到请求头后再dio.unlock()解锁发送出去
      _dio.lock();
      Future<dynamic> future = Future(() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        return prefs.getString("token");
      });
      return future.then((value) {
        options.headers["authorization"] = value;
        options.headers["Content-Type"] = 'application/json';
        return options;
      }).whenComplete(() => _dio.unlock()); // unlock the dio
    }, onResponse: (Response response) {
      return response;
    }, onError: (DioError e) {
      return e;
    }));
  }

  //用于指定特定域名，比如cdn和kline首次的http请求
  HttpManager _baseUrl(String baseUrl) {
    if (_dio != null) {
      _dio.options.baseUrl = baseUrl;
    }
    return this;
  }

  //一般请求，默认域名
  HttpManager _normal() {
    if (_dio != null) {
      if (_dio.options.baseUrl != Address.BASE_URL) {
        _dio.options.baseUrl = Address.BASE_URL;
      }
    }
    return this;
  }

  ///通用的GET请求
  get(api, params, {noTip = false}) async {
    Response response;
    try {
      response = await _dio.get(api, queryParameters: params);
    } on DioError catch (e) {
      return resultError(e);
    }

    if (response.data is DioError) {
      return resultError(response.data['code']);
    }

    if (response.data) {
      return response.data;
    }
    return response;
  }

  ///通用的POST请求
  post(api, params, {noTip = false}) async {
    Response response;
    try {
      response = await _dio.post(api, data: params);
    } on DioError catch (e) {
      print('DioError ${e.response.data.toString()}');
      Fluttertoast.showToast(
          msg: e.response.data.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return resultError(e);
    }
    if (response.data is DioError) {
      print('response.data');

      return resultError(response.data['code']);
    }
    print(response.statusCode);
    return response;
  }
}

ResultData resultError(DioError e) {
  Response errorResponse;
  if (e.response != null) {
    errorResponse = e.response;
  } else {
    errorResponse = new Response(statusCode: 666);
  }
  if (e.type == DioErrorType.CONNECT_TIMEOUT ||
      e.type == DioErrorType.RECEIVE_TIMEOUT) {
    errorResponse.statusCode = Code.NETWORK_TIMEOUT;
  }
  return new ResultData(
      errorResponse.statusMessage, false, errorResponse.statusCode);
}
