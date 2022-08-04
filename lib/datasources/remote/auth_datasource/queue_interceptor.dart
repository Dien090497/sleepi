import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/app.dart';
import 'package:slee_fi/common/widgets/phoenix.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/access_token_expire_model/access_token_expire_model.dart';
import 'package:slee_fi/usecase/get_network_connection_usecase.dart';
import 'package:slee_fi/usecase/logout_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

@Injectable()
class QueueInterceptor extends QueuedInterceptor {
  final Dio dio;

  QueueInterceptor(this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final context = navKey.currentContext;
    final checkConnection = getIt<GetNetworkConnectionUseCase>();
    final result = await checkConnection.call(NoParams());
    result.fold(
            (l) => debugPrint("$l"),
            (r) {
          if(context != null && r != ConnectivityResult.mobile && r != ConnectivityResult.wifi)  {
            showMessageDialog(context, "You need to connect Wifi or Mobile Data");
            return handler.reject(err);
          }
        });
    if (err.response?.statusCode == 401) {
      final model = AccessTokenExpireModel.fromJson(err.response!.data);

      //Token expired
      if (model.error.message?.toLowerCase().contains('jwt'.toLowerCase()) ??
          false) {
        final context = navKey.currentContext;
        if (context != null) {
          showWarningDialog(
            context,
            LocaleKeys.you_have_been_logged_out,
            buttonText: LocaleKeys.confirm,
            barrierDismissible: false,
            closeTap: () async {
              await getIt<LogOutUseCase>().call(NoParams());
              Phoenix.rebirth(context);
            },
            () async {
              await getIt<LogOutUseCase>().call(NoParams());
              Phoenix.rebirth(context);
            },
          );
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
    await getIt<LogOutUseCase>().call(NoParams());
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
