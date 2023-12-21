import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkUtils {
  static Future<bool> hasInternet() async {
    try {
      final result = await InternetAddress.lookup('care.tres.in');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future downloadFile(
      String url, String savePath, Function(double progress) progress) async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
        url,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            progress((received / total * 100));
          }
        },
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status != null && status < 500;
            }),
      );
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
