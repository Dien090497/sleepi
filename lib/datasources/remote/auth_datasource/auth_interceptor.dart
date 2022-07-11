import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';

@Injectable()
class AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage;
  final Dio dio;

  AuthInterceptor(this._secureStorage, this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('### ${options.uri}');
    final token = await _secureStorage.getAccessToken();
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }
}
