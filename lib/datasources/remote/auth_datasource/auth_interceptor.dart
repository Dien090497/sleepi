import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';

@Injectable()
class AuthInterceptor extends Interceptor {
  final SecureStorage _secureStorage;
  final Dio dio;
  final DeviceInfoPlugin _deviceInfoPlugin;

  AuthInterceptor(this._secureStorage, this.dio, this._deviceInfoPlugin);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final deviceInfo = Platform.isIOS
        ? await _deviceInfoPlugin.iosInfo
        : await _deviceInfoPlugin.androidInfo;
    final token = await _secureStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    if (deviceInfo is AndroidDeviceInfo) {
      options.headers['Device-Id'] = '${deviceInfo.id}';
    } else if (deviceInfo is IosDeviceInfo) {
      options.headers['Device-Id'] = '${deviceInfo.identifierForVendor}';
    }

    return handler.next(options);
  }
}
