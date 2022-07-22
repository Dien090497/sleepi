import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_interceptor.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/refresh_token_interceptor.dart';
import 'package:slee_fi/models/activation_code_response/activation_code_response.dart';
import 'package:slee_fi/models/active_code_response/active_code_response.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/models/create_password_reponse/create_password_response.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/models/fetch_bed_response/fetch_bed_response.dart';
import 'package:slee_fi/models/gacha_history_response/gacha_history_response.dart';
import 'package:slee_fi/models/gacha_probability_config_response/gacha_probability_config_response.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';
import 'package:slee_fi/models/get_repair_response/get_repair_response.dart';
import 'package:slee_fi/models/global_config_response/global_config_response.dart';
import 'package:slee_fi/models/home_bed_response/home_bed_response.dart';
import 'package:slee_fi/models/item_owner_response/item_owner_response.dart';
import 'package:slee_fi/models/list_jewel_resoponse/list_jewel_response.dart';
import 'package:slee_fi/models/list_market_place/list_market_place_model.dart';
import 'package:slee_fi/models/lucky_box/lucky_box.dart';
import 'package:slee_fi/models/market_place/result_buy_model.dart';
import 'package:slee_fi/models/nft_sell_response/nft_sell_response.dart';
import 'package:slee_fi/models/point_of_owner/point_of_owner_model.dart';
import 'package:slee_fi/models/refresh_token_model/refresh_token_model.dart';
import 'package:slee_fi/models/response_model/response_model.dart';
import 'package:slee_fi/models/send_email_response/send_email_response.dart';
import 'package:slee_fi/models/setting_active_code_response/setting_active_code_response.dart';
import 'package:slee_fi/models/sign_in_response/sign_in_response.dart';
import 'package:slee_fi/models/staking_info_response/staking_info_response.dart';
import 'package:slee_fi/models/staking_response/staking_response.dart';
import 'package:slee_fi/models/swap_token_to_wallet_response/swap_token_to_wallet_response.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/models/tracking_result_chart/tracking_result_chart.dart';
import 'package:slee_fi/models/tracking_result_chart/tracking_result_chart_data.dart';
import 'package:slee_fi/models/upgrade_jewel_info_response/upgrade_info_response.dart';
import 'package:slee_fi/models/upgrade_jewel_response/upgrade_jewel_response.dart';
import 'package:slee_fi/models/user_response/user_response.dart';
import 'package:slee_fi/models/users_response/users_response.dart';
import 'package:slee_fi/models/verify_response/verify_response.dart';
import 'package:slee_fi/models/withdraw_history_response/withdraw_history_response.dart';
import 'package:slee_fi/schema/add_jewel_schema/add_jewel_schema.dart';
import 'package:slee_fi/schema/buy_nft_schema/buy_nft_schema.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';
import 'package:slee_fi/schema/create_password_schema/create_password_schema.dart';
import 'package:slee_fi/schema/gacha/gacha_spin_schema.dart';
import 'package:slee_fi/schema/market/market_schema.dart';
import 'package:slee_fi/schema/nft_sell_schema/nft_sell_schema.dart';
import 'package:slee_fi/schema/param_filler_item_fetch/filter_item_schema.dart';
import 'package:slee_fi/schema/refresh_token_schema/refresh_token_schema.dart';
import 'package:slee_fi/schema/repair_schema/repair_schema.dart';
import 'package:slee_fi/schema/sign_in_schema/sign_in_schema.dart';
import 'package:slee_fi/schema/sign_up_schema/sign_up_schema.dart';
import 'package:slee_fi/schema/speed_up_lucky_box_schema/speed_up_lucky_box_schema.dart';
import 'package:slee_fi/schema/stacking_schema/stacking_schema.dart';
import 'package:slee_fi/schema/update_point/update_point_schema.dart';
import 'package:slee_fi/schema/upgrade_jewel_schame/upgrade_jewel_schema.dart';
import 'package:slee_fi/schema/verify_schema/verify_schema.dart';
import 'package:slee_fi/schema/verify_user_schema/verify_user_schema.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/schema/with_draw_nft_schema/with_draw_nft_schema.dart';

part 'auth_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kDebugMode ? Const.baseApiDev : Const.baseApiDev)
abstract class AuthDataSource {
  @factoryMethod
  factory AuthDataSource(Dio dio, AuthInterceptor authInterceptor,
      RefreshTokenInterceptor refreshInterceptor) {
    dio.interceptors.addAll([
      authInterceptor,
      refreshInterceptor,
    ]);
    return _AuthDataSource(dio);
  }

  ///user

  @GET('/users/me')
  Future<UserResponse> getMe();

  @GET('/user-otp')
  Future<SendEmailResponse> sendOTP(
      @Query('email') String email, @Query('otpType') OTPType otpType);

  @GET('/users/balances')
  Future<List<TokenSpending>> fetchBalanceSpending(
      @Query('userId') String userId);

  @GET('/users/get-global-config')
  Future<GlobalConfigResponse> getGlobalConfig();

  @GET('/users')
  Future<UsersResponse> getListUser(
      @Query('limit') int limit, @Query('offset') int offset);

  @GET('/users/{id}')
  Future<UserResponse> getUserByID(@Path('id') String userID);

  @POST('/user-otp/verify-otp')
  Future<dynamic> verifyOTP(@Body() VerifyOTPSchema verifySchema);

  @GET('/users/active-code')
  Future<ActiveCodeResponse> fetchActivationCodes();

  @POST('/users/insert-wallet')
  Future<VerifyResponse> verifyUser(@Body() VerifyUserSchema verifyUserSchema);

  @POST('/users/change-password')
  Future<dynamic> changePassword(
      @Body() ChangePasswordSchema changePasswordSchema);

  /// auth

  @POST('/auth/login')
  Future<SignInResponse> signIn(@Body() SignInSchema signInSchema);

  @POST('/auth/signup')
  Future<UserResponse> signUp(@Body() SignUpSchema signUpSchema);

  @POST('/auth/refresh-token')
  Future<RefreshTokenModel> refreshToken(
      @Body() RefreshTokenSchema refreshTokenSchema);

  @POST('/auth/create-password-step')
  Future<CreatePasswordResponse> createPassword(
      @Body() CreatePasswordSchema createPasswordSchema);

  @GET('/auth/setting-active-code')
  Future<SettingActiveCodeResponse> getSettingActiveCode();

  @GET('/auth/verify-active-code')
  Future<ActivationCodeResponse> verifyActiveCode(
      @Query('activeCode') String activeCode);

  ///stacking
  @POST('/stacking')
  Future<StakingResponse> stacking(@Body() StackingSchema stackingSchema);

  @GET('/stacking')
  Future<StakingInfoResponse> getStakingInfo();

  // @GET('/tx-history/pending')
  // Future<dynamic> fetchSpendingPending(
  //   @Query('userId') int userId,
  //   @Query('limit') int limit,
  //   @Query('page') int page,
  // );
  //
  // @GET('/tx-history/history')
  // Future<dynamic> fetchSpendingHistory(
  //   @Query('userId') int userId,
  //   @Query('limit') int limit,
  //   @Query('page') int page,
  // );

  ///white draw
  @POST('/withdraw/token')
  Future<SwapTokenToWalletResponse> transferTokenToWallet(
      @Body() WhitDrawTokenSchema whitDrawTokenSchema);

  @GET('/withdraw')
  Future<WithdrawHistoryResponse> withdraw(
    @Query('status') AttributeWithdraw attributeWithdraw,
    @Query('limit') int limit,
    @Query('page') int page,
  );

  @GET('/withdraw/estimate-gas')
  Future<String> estimateGasWithdraw(@Query('type') String type,
      @Query('contractAddress') String contractAddress);

  @POST('/withdraw/nft')
  Future<dynamic> withdrawNFT(@Body() WithDrawNFTSchema whitDrawNFTSchema);

  /// market
  @POST('/market-place/buy-nft')
  Future<ResultBuyModel> buyNFT(@Body() BuyNFTSchema buyNFTSchema);

  @POST('/market-place')
  Future<ListMarketPlaceModel> getMarketPlace(@Body() MarketSchema entity);

  ///nft-attributes
  @GET('/nft-attributes/nft-by-owner')
  Future<OwnerNFTResponse> getNftByOwner(
    @Query('limit') int limit,
    @Query('page') int page,
    /***[categoryId] == 1 bed
          [categoryId] == 3 item */
    @Query('categoryId') int categoryId,
    @Query('type') String bedType,
  );

  @GET('/nft-attributes/list-jewels')
  Future<ListJewelResponse> getListJewel(
    @Query('limit') int limit,
    @Query('page') int page,
  );

  @GET('/nft-attributes/list-jewels')
  Future<ListBedResponse> getListJewels(
    @Query('limit') int limit,
    @Query('page') int page,
  );

  @GET('/nft-attributes/nft-in-home-page')
  Future<HomeBedResponse> fetchBedInHomePage(
    @Query('limit') int limit,
    @Query('page') int page,
  );

  @GET('/nft-attributes/bed-detail')
  Future<BedModel> bedDetail(
    @Query('bedId') int bedId,
    @Query('isBase') bool isBase,
  );

  @PUT('/nft-attributes/add-item-for-bed')
  Future<ResponseModel> addItemForBed(
    @Query('bedId') int bedId,
    @Query('itemId') int itemId,
  );

  @PUT('/nft-attributes/remove-item-from-bed')
  Future<ResponseModel> removeItemFromBed(
    @Query('bedId') int bedId,
    @Query('itemId') int itemId,
  );

  @POST('/nft-attributes/item-by-owner')
  Future<ItemOwnerResponse> fetchItemOwner(
      @Body() FilterItemSchema filterItemSchema);

  @POST('/stacking/unstacking')
  Future<dynamic> unStacking();

  @POST('/stacking/compound')
  Future<dynamic> compound();

  //lucky box
  @GET('/lucky_box')
  Future<List<LuckyBox>> fetchLuckyBox();

  @POST('/lucky_box/open')
  Future<VerifyResponse> openLuckyBox(@Query('luckyBoxId') int luckyBoxId);

  @POST('/lucky_box')
  Future<dynamic> speedUpLuckyBox(
      @Body() SpeedUpLuckyBoxSchema speedUpLuckyBoxSchema);

  // sleep tracking
  @GET('/tracking/estimate-tracking')
  Future<EstimateSleepResponse> estimateSleepEarn(
    @Query('bedUsed') int bedId,
    @Query('itemUsed') int itemId,
    @Query('isEnableInsurance') bool enableInsurance,
  );

  @GET('/tracking-result/chart')
  Future<TrackingResultChartData> fetchDataChart(
    @Query('fdate') String fdate,
    @Query('tdate') String tdate,
    @Query('type') String type,
  );

  @GET('/tracking-result/chart')
  Future<TrackingResultDaysChart> fetchDataDaysChart(
    @Query('fdate') String fdate,
    @Query('tdate') String tdate,
    @Query('type') String type,
  );

  //TrackingResultDaysChart

  @POST('/gacha/spin')
  Future<GachaSpinResponse> gachaSpinBonus(
      @Body() GachaSpinSchema gachaSpinSchema);

  @GET('/gacha/history')
  Future<GachaHistoryResponse> gachaHistory();

  @GET('/gacha/get-probability-config')
  Future<GachaProbabilityConfigResponse> gachaProbabilityConfig();

  @POST('/gacha/get-common-bed')
  Future<dynamic> getCommonBed();

  @POST('/gacha/get-special-bed')
  Future<dynamic> getSpecialBed();

  // individual
  @PUT('/nft-attributes/open-socket')
  Future<ResponseModel> openSocket(@Query('bedId') int bedId);

  @PUT('/nft-attributes/add-jewels')
  Future<ResponseModel> addJewel(@Body() AddJewelSchema addJewelSchema);

  @PUT('/nft-attributes/remove-jewels')
  Future<ResponseModel> removeJewel(@Body() AddJewelSchema addJewelSchema);

  @POST('/nft/sell')
  Future<NftSell> nftSell(@Body() NFTSellSchema nftSellSchema);

  @GET('/nft/transaction-fee')
  Future<String> getTransactionFee();

  @GET('/nft/repair')
  Future<GetRepairResponse> getRepair(@Query('bedId') String bedId);

  @POST('/nft/repair')
  Future<dynamic> nftRepair(@Body() RepairSchema repairSchema);

  @GET('/poins/poins-of-owner')
  Future<PointOfOwnerModel> pointOf(@Query('bedId') int bedId);

  @PUT('/poins/add-poin-for-bed')
  Future<ResponseModel> updatePoints(@Body() UpdatePointSchema schema);

  @GET('/stacking/slft-price')
  Future<String> slftPrice();

  /// upgrade jewel nft/upgrade'
  @POST('/nft/upgrade')
  Future<UpgradeJewelResponse> upgradeJewel(
      @Body() UpgradeSchema upgradeJewelSchema);

  @GET('/nft/upgrade')
  Future<UpgradeInfoResponse> upgradeInfo(
    @Query('level') int level,
    @Query('upgradeType') int upgradeType,
  );

  @POST('/nft/cancel-sell')
  Future<NftSell> nftCancelSell(@Query('nftId') num nftId);
}
