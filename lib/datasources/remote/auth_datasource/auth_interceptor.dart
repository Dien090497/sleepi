import 'package:dio/dio.dart';
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
    final token = await _secureStorage.getAccessToken();
    print(token);
    if (token != null) options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }
}
