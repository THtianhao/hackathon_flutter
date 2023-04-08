import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class MetisServer {
  static final MetisServer _instance = MetisServer._();

  late Dio dio;
  String host = 'http://192.168.50.65:8000';

  factory MetisServer() => _instance;

  MetisServer._() {
    // logger.i("charles123456 kDebugMode = ${kDebugMode} Global deviceid ${Global.deviceID} ");
    dio = Dio(
      BaseOptions(
          baseUrl: host,
          // headers: getHeader(),
          connectTimeout: const Duration(milliseconds: 100000),
          receiveTimeout: const Duration(milliseconds: 100000),
          contentType: "application/json"),
    );
    // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (client) {
    //   client.findProxy = (uri) {
    //     var proxyInfo = 'PROXY 192.168.50.65:8888';
    //     return proxyInfo;
    //   };
    //   client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    //   return null;
    // };
  }

  Future<Map<String, dynamic>?> post(String path, Map<String, dynamic> map) async {
    Response response;
    try {
      response = await dio.post(path, data: map);
      return response.data;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {}
    }
    return null;
  }

  Future<String> get(String path) async {
    Response response;
    try {
      response = await dio.get(path);
      return response.data;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {}
    }
    return "";
  }
}
