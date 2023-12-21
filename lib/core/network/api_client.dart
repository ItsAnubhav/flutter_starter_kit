import 'dart:io';

import '../config/env.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class APIClient {
  final dio = createDio();

  APIClient._internal();

  static final _singleton = APIClient._internal();

  factory APIClient() => _singleton;

  static Dio createDio() {
    String baseUrl = ConfigEnvironments.getEnvironment().url;
    if (baseUrl.isEmpty) {
      throw Exception('Base URL is null');
    }
    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(seconds: 60), // 15 seconds
      connectTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    ));

    if (kDebugMode) {
      (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        final HttpClient client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
    }

    dio.interceptors.addAll({
      AppInterceptors(dio),
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90),
      ErrorInterceptor()
    });
    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // var accessToken = AuthLocalDataSourceImpl().getToken();

    // if (accessToken != null) {
    //   var expiryTime = AuthLocalDataSourceImpl().getExpiryTime();
    //   var expiration = DateTime.now().difference(expiryTime);
    //   if (expiration.inSeconds < 60) {
    //     log("AccessToken is expiring in $expiration");
    //   }

    //   options.headers['Authorization'] = 'Bearer $accessToken';
    // }

    return handler.next(options);
  }
}

class ErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
