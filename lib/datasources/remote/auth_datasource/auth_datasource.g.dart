// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_datasource.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _AuthDataSource implements AuthDataSource {
  _AuthDataSource(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://dev.sleefi.com/api/v1';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<UserResponse> getMe() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users/me',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SendEmailResponse> sendOTP(email, otpType) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'email': email,
      r'otpType': otpType.toJson()
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SendEmailResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/user-otp',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SendEmailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<List<TokenSpending>> fetchBalanceSpending(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': userId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<TokenSpending>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users/balances',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => TokenSpending.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<GlobalConfigResponse> getGlobalConfig() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GlobalConfigResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users/get-global-config',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GlobalConfigResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UsersResponse> getListUser(limit, offset) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'offset': offset
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UsersResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UsersResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserResponse> getUserByID(userID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users/${userID}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> verifyOTP(verifySchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(verifySchema.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/user-otp/verify-otp',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<ActiveCodeResponse> fetchActivationCodes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ActiveCodeResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users/active-code',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ActiveCodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VerifyResponse> verifyUser(verifyUserSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(verifyUserSchema.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VerifyResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/users/insert-wallet',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VerifyResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> changePassword(changePasswordSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(changePasswordSchema.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/users/change-password',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<SignInResponse> signIn(signInSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(signInSchema.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SignInResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/login',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SignInResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UserResponse> signUp(signUpSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(signUpSchema.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UserResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/signup',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UserResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RefreshTokenModel> refreshToken(refreshTokenSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(refreshTokenSchema.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RefreshTokenModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/refresh-token',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RefreshTokenModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CreatePasswordResponse> createPassword(createPasswordSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createPasswordSchema.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CreatePasswordResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/create-password-step',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CreatePasswordResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SettingActiveCodeResponse> getSettingActiveCode() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SettingActiveCodeResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/setting-active-code',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SettingActiveCodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ActivationCodeResponse> verifyActiveCode(activeCode) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'activeCode': activeCode};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ActivationCodeResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/auth/verify-active-code',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ActivationCodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StakingResponse> stacking(stackingSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(stackingSchema.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StakingResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/stacking',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StakingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StakingInfoResponse> getStakingInfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StakingInfoResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/stacking',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StakingInfoResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SwapTokenToWalletResponse> transferTokenToWallet(
      whitDrawTokenSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(whitDrawTokenSchema.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SwapTokenToWalletResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/withdraw/token',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SwapTokenToWalletResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<WithdrawHistoryResponse> withdraw(
      attributeWithdraw, limit, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'status': attributeWithdraw.toJson(),
      r'limit': limit,
      r'page': page
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WithdrawHistoryResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/withdraw',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WithdrawHistoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<String> estimateGasWithdraw(type, contractAddress) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'type': type,
      r'contractAddress': contractAddress
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<String>(_setStreamType<String>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/withdraw/estimate-gas',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data!;
    return value;
  }

  @override
  Future<dynamic> withdrawNFT(whitDrawNFTSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(whitDrawNFTSchema.toJson());
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/withdraw/nft',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<ResultBuyModel> buyNFT(buyNFTSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(buyNFTSchema.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResultBuyModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/market-place/buy-nft',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResultBuyModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ListMarketPlaceModel> getMarketPlace(entity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(entity.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListMarketPlaceModel>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/market-place',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListMarketPlaceModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OwnerNFTResponse> getNftByOwner(
      limit, page, categoryId, itemNFT) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'page': page,
      r'categoryId': categoryId,
      r'item': itemNFT.toJson()
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<OwnerNFTResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/nft-attributes/nft-by-owner',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = OwnerNFTResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ListMarketPlaceModel> getListJewel() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ListMarketPlaceModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/nft-attributes/list-jewels',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ListMarketPlaceModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MarketPlaceModel> bedDetail(bedId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'bedId': bedId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MarketPlaceModel>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/nft-attributes/bed-detail',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MarketPlaceModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> addItemForBed(bedId, itemId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'bedId': bedId,
      r'itemId': itemId
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'PUT', headers: _headers, extra: _extra)
            .compose(_dio.options, '/nft-attributes/add-item-for-bed',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> removeItemFromBed(bedId, itemId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'bedId': bedId,
      r'itemId': itemId
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'PUT', headers: _headers, extra: _extra)
            .compose(_dio.options, '/nft-attributes/remove-item-from-bed',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<ItemOwnerResponse> fetchItemOwner(filterItemSchema) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(filterItemSchema.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ItemOwnerResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/nft-attributes/item-by-owner',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ItemOwnerResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> unStacking() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/stacking/unstacking',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> compound() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/stacking/compound',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<List<LuckyBox>> fetchLuckyBox() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<LuckyBox>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/lucky_box',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => LuckyBox.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<dynamic> openLuckyBox(luckyBoxId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'luckyBoxId': luckyBoxId.toJson()
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/lucky_box/open',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
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
