// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _NftApi implements NftApi {
  _NftApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ListNftDataModel> getListNft(
      {required tokenIds, required nftType}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'tokenIds': tokenIds,
      r'nftType': nftType.toJson()
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListNftDataModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListNftDataModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NftFamilyModel> family(bedId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'bedId': bedId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NftFamilyModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/family-nft',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NftFamilyModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<NftLevelUp> getLevelUp(bedId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'bedId': bedId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NftLevelUp>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/get-level-up',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NftLevelUp.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BedModel> levelUp(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BedModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/level-up',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BedModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<InfoMintingModel> getMinting(bedIdParent1, bedIdParent2) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<InfoMintingModel>(Options(
                method: 'GET', headers: _headers, extra: _extra)
            .compose(
                _dio.options, '/get-minting/${bedIdParent1}/${bedIdParent2}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = InfoMintingModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> minting(body) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/minting',
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
