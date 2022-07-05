// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _NftApi implements NftApi {
  _NftApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://dev.sleefi.com/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ListNftDataModel> getListNft(
      {page, limit, required tokenIds, required nftType}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'limit': limit,
      r'tokenIds': tokenIds,
      r'nftType': nftType.toJson()
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListNftDataModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/nft',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListNftDataModel.fromJson(_result.data!);
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