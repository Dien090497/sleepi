import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';

@Injectable()
class RefreshTokenInterceptor extends QueuedInterceptor {
  final SecureStorage _secureStorage;
  final Dio dio;

  RefreshTokenInterceptor(this._secureStorage, this.dio);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final accessTokenOutDate =
          err.response?.data.toString().toLowerCase().contains('unauth') ??
              false;
      if (accessTokenOutDate) {
        // return await _refreshToken(err, handler);
      }
    }
    return handler.next(err);
  }


  Future<void> _refreshToken(
      DioError err, ErrorInterceptorHandler handler) async {
    final refreshToken = await _secureStorage.getRefreshToken();
    if (refreshToken != null) {
      try {
        // final result = await dio.post(
        //   '${Const.baseApi}/api/auth/refresh-token',
        //   data: RefreshTokenSchema(refreshToken).toJson(),
        //   // queryParameters: RefreshTokenSchema(refreshToken).toJson(),
        // );
        // final SignInResponse res = SignInResponse.fromJson(result.data!);
        // await Future.wait([
        //   _secureStorage.setAccessToken(res.accessToken),
        //   _secureStorage.setRefreshToken(res.refreshToken),
        // ]);
        // return _retry(err, handler, res.accessToken);
      } catch (e) {
        if (e is DioError) {
          _refreshTokenExpire(e);
        }
      }
    }
    return handler.next(err);
  }

  Future<void> _retry(
      DioError err, ErrorInterceptorHandler handler, String accessToken) async {
    // final newAccessToken = await _secureStorage.getAccessToken();
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
        return _refreshTokenExpire(e);
      }
      return handler.next(err);
    }
  }

  Future<void> _refreshTokenExpire(DioError e) async {
    if (e.response?.data.toString().toLowerCase().contains('refresh') ??
        false) {
      // final ctx = navKey.currentContext;
      // if (ctx != null) {
      //   BlocProvider.of<UserBloc>(ctx).add(const LogOut());
      // }
    }
  }
}
