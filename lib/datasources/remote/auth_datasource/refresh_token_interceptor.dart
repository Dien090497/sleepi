import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/models/access_token_expire_model/access_token_expire_model.dart';
import 'package:slee_fi/models/refresh_token_model/refresh_token_model.dart';
import 'package:slee_fi/schema/refresh_token_schema/refresh_token_schema.dart';

@Injectable()
class RefreshTokenInterceptor extends QueuedInterceptor {
  final SecureStorage _secureStorage;
  final Dio dio;

  RefreshTokenInterceptor(this._secureStorage, this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final model = AccessTokenExpireModel.fromJson(err.response!.data);
      if (model.error.errorName?.toLowerCase() ==
          'UnauthorizedException'.toLowerCase()) {
        return await _refreshToken(err, handler);
      }
    }
    return handler.next(err);
  }

  Future<void> _refreshToken(
      DioError err, ErrorInterceptorHandler handler) async {
    final refreshToken = await _secureStorage.getRefreshToken();
    if (refreshToken != null) {
      try {
        final result = await dio.post(
          '${Const.baseApiDev}/api/v1/auth/refresh-token',
          data: RefreshTokenSchema(refreshToken).toJson(),
        );
        final RefreshTokenModel res = RefreshTokenModel.fromJson(result.data!);
        await Future.wait([
          _secureStorage.setAccessToken(res.data.accessToken),
          _secureStorage.setRefreshToken(res.data.refreshToken),
        ]);
        return _retry(err, handler, res.data.accessToken);
      } catch (e) {
        if (e is DioError) {
          _refreshTokenExpire(e, handler);
        }
      }
    }
    return handler.next(err);
  }

  Future<void> _retry(
      DioError err, ErrorInterceptorHandler handler, String accessToken) async {
    final requestOptions = err.requestOptions;
    requestOptions.headers["Authorization"] = accessToken;
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

  Future<void> _refreshTokenExpire(
      DioError e, ErrorInterceptorHandler handler) async {
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