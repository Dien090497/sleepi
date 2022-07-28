import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/app.dart';
import 'package:slee_fi/common/widgets/phoenix.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/models/access_token_expire_model/access_token_expire_model.dart';
import 'package:slee_fi/usecase/logout_usecase.dart';
import 'package:slee_fi/usecase/make_first_open_app_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

@Injectable()
class AuthInterceptor extends QueuedInterceptor {
  final SecureStorage _secureStorage;
  final Dio dio;
  final DeviceInfoPlugin _deviceInfoPlugin;
  final LogOutUseCase _logOutUseCase;

  AuthInterceptor(this._secureStorage, this.dio, this._deviceInfoPlugin,
      this._logOutUseCase);

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
    debugPrint('### ${options.uri}');
    log('### accessToken $token');
    if (deviceInfo is AndroidDeviceInfo) {
      options.headers['Device-Id'] = '${deviceInfo.id}';
    } else if (deviceInfo is IosDeviceInfo) {
      options.headers['Device-Id'] = '${deviceInfo.identifierForVendor}';
    }

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final model = AccessTokenExpireModel.fromJson(err.response!.data);

      //Token expired
      if (model.error.message?.toLowerCase().contains('jwt'.toLowerCase()) ??
          false) {
        final context = navKey.currentContext;
        if (context != null) {
          final String email = (await _secureStorage.readCurrentUser())!.email;
          await getIt<LogOutUseCase>().call(NoParams()).then((value) {
            value.fold((l) => null, (r) async {
              await getIt<MakeFirstOpenAppUseCase>().call(email);
            });
          });
          Phoenix.rebirth(context);
          return handler.reject(err);
        }
        // return _refreshToken(err, handler);
      }

      /// No token provide
      if (model.error.errorName
              ?.toLowerCase()
              .contains('No auth token'.toLowerCase()) ??
          false) {
        return handler.next(err);
      }
    }
    return handler.next(err);
  }

  Future<void> _refreshToken(
      DioError err, ErrorInterceptorHandler handler) async {
    // final refreshToken = await _secureStorage.getRefreshToken();
    // if (refreshToken != null) {
    //   try {
    //     final result = await dio.post(
    //       '${getIt<String>(instanceName: 'baseUrl')}/auth/refresh-token',
    //       data: RefreshTokenSchema(refreshToken).toJson(),
    //     );
    //     final RefreshTokenModel res = RefreshTokenModel.fromJson(result.data!);
    //     await Future.wait([
    //       _secureStorage.setAccessToken(res.data.accessToken),
    //       _secureStorage.setRefreshToken(res.data.refreshToken),
    //     ]);
    //     log('### new tokens ${res.data.accessToken}\n${res.data.refreshToken}');
    //     return _retry(err, handler, res.data.accessToken);
    //   } catch (e) {
    //     return _refreshTokenExpire(err, handler);
    //   }
    // }
    return handler.next(err);
  }

  Future<void> retry(
      DioError err, ErrorInterceptorHandler handler, String accessToken) async {
    final requestOptions = err.requestOptions;
    requestOptions.headers["Authorization"] = 'Bearer $accessToken';
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    try {
      final cloneReq = await dio.request<dynamic>(
        requestOptions.baseUrl + requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
      );
      return handler.resolve(cloneReq);
    } catch (e) {
      if (e is DioError) {
        return _refreshToken(e, handler);
      }
      return handler.next(err);
    }
  }

  Future<void> refreshTokenExpire(
      DioError e, ErrorInterceptorHandler handler) async {
    final String email = (await _secureStorage.readCurrentUser())!.email;
    _logOutUseCase.call(NoParams()).then((value) {
      value.fold((l) => null, (r) async {
        await getIt<MakeFirstOpenAppUseCase>().call(email);
      });
    });
    // if (e.response?.data.toString().toLowerCase().contains('refresh') ??
    //     false) {
    // final ctx = navKey.currentContext;
    // if (ctx != null) {
    //   BlocProvider.of<UserBloc>(ctx).add(const LogOut());
    // }
    // } else {
    return handler.next(e);
    // }
  }
}
