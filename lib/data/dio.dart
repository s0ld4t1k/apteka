import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Dio dio = Dio();
addInter(Dio dio) {
  dio.interceptors.add(DioInter());
}

class DioInter extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.addAll({
      'Content-Type': 'application/json',
    });
    String? token = await const FlutterSecureStorage().read(key: 'token');
    if (token!.isNotEmpty) {
      options.headers.addAll({
        'Authorization': token,
      });
    }
    super.onRequest(options, handler);
  }
}
