// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_tracking_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _SleepTrackingApi implements SleepTrackingApi {
  _SleepTrackingApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://dev.sleefi.com/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<String> startTracking(schema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(schema.toJson());
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/tracking',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<EstimateSleepResponse> estimateSleepEarn(
      bedId, itemId, enableInsurance) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'bedUsed': bedId,
      r'itemUsed': itemId,
      r'isEnableInsurance': enableInsurance
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EstimateSleepResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tracking/estimate-tracking',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EstimateSleepResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EstimateSleepResponse> estimateSleepEarns(
      bedId, enableInsurance) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'bedUsed': bedId,
      r'isEnableInsurance': enableInsurance
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EstimateSleepResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tracking/estimate-tracking',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EstimateSleepResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> getResult(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/tracking/tracking-result/${id}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<TrackingResultModel> wakeUp(dataHealthSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dataHealthSchema.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<TrackingResultModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tracking/wake-up',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TrackingResultModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserStatusTrackingModel> userStatusTracking() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserStatusTrackingModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/tracking/user-status-tracking',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserStatusTrackingModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> postHealthData(dataHealthSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(dataHealthSchema.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/health-app',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
