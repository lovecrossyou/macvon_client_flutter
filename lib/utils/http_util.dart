import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:macvon_flutter/utils/address.dart';
import 'package:macvon_flutter/utils/event_bus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpUtlis {
  static Dio _dio;
  static BaseOptions _options = new BaseOptions(
    connectTimeout: 5000,
    receiveTimeout: 3000,
    baseUrl: Address.BASE_URL
  );

  static get(String url, {options, Function success, Function failure}) async {
    Dio dio = buildDio();
    try {
      Response response = await dio.get(url, options: options);
      success(response.data);
    } catch (exception) {
      failure(exception);
    }
  }

  static post(String url,
      {params, options, Function success, Function failure}) async {
    Dio dio = buildDio();
    try {
      Response response = await dio.post(url, data: params, options: options);
      success(response.data);
    } catch (exception) {
      failure(exception);
    }
  }

  static Dio buildDio() {
    if (_dio == null) {
      _dio = new Dio(_options);
    }
    _dio.interceptors.add(tokenInterceptor());
    _dio.interceptors.add(responseInterceptor());
    return _dio;
  }

  static tokenInterceptor() {
    return InterceptorsWrapper(onRequest: (RequestOptions options) {
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
    });
  }

  static responseInterceptor(){
    return InterceptorsWrapper(onResponse: (response){
      // println('responseInterceptor ${response}');
    });
  }
}
