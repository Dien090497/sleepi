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
import 'package:slee_fi/models/create_password_reponse/create_password_response.dart';
import 'package:slee_fi/models/global_config_response/global_config_response.dart';
import 'package:slee_fi/models/list_market_place/list_market_place_model.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/models/market_place/result_buy_model.dart';
import 'package:slee_fi/models/refresh_token_model/refresh_token_model.dart';
import 'package:slee_fi/models/send_email_response/send_email_response.dart';
import 'package:slee_fi/models/setting_active_code_response/setting_active_code_response.dart';
import 'package:slee_fi/models/sign_in_response/sign_in_response.dart';
import 'package:slee_fi/models/staking_response/staking_response.dart';
import 'package:slee_fi/models/swap_token_to_wallet_response/swap_token_to_wallet_response.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/models/user_response/user_response.dart';
import 'package:slee_fi/models/users_response/users_response.dart';
import 'package:slee_fi/models/verify_response/verify_response.dart';
import 'package:slee_fi/models/withdraw_history_response/withdraw_history_response.dart';
import 'package:slee_fi/schema/buy_nft_schema/buy_nft_schema.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';
import 'package:slee_fi/schema/create_password_schema/create_password_schema.dart';
import 'package:slee_fi/schema/market/market_schema.dart';
import 'package:slee_fi/schema/refresh_token_schema/refresh_token_schema.dart';
import 'package:slee_fi/schema/sign_in_schema/sign_in_schema.dart';
import 'package:slee_fi/schema/sign_up_schema/sign_up_schema.dart';
import 'package:slee_fi/schema/unstacking_schema/unstacking_schema.dart';
import 'package:slee_fi/schema/stacking_schema/stacking_schema.dart';
import 'package:slee_fi/schema/verify_schema/verify_schema.dart';
import 'package:slee_fi/schema/verify_user_schema/verify_user_schema.dart';
import 'package:slee_fi/schema/white_draw_nft_schema/whit_draw_nft_schema.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';

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

  @POST('/users/verify')
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

  @POST('/withdraw/nft')
  Future<dynamic> withdrawNFT(@Body() WhitDrawNFTSchema whitDrawNFTSchema);

  /// market
  @POST('/market-place/buy-nft')
  Future<ResultBuyModel> buyNFT(@Body() BuyNFTSchema buyNFTSchema);

  @POST('/market-place')
  Future<ListMarketPlaceModel> getMarketPlace(@Body() MarketSchema entity);

  @GET('/nft-attributes/nft-by-owner')
  Future<ListMarketPlaceModel> getNftByOwner(
    @Query('limit') int limit,
    @Query('page') int page,
    @Query('categoryId') int categoryId,
    @Query('item') AttributeNFT itemNFT,
  );

  @GET('/nft-attributes/list-jewels')
  Future<ListMarketPlaceModel> getListJewel();

  @GET('/nft-attributes/bed-detail')
  Future<MarketPlaceModel> bedDetail(@Query('bedId') int bedId);

  @POST('/stacking/unstacking')
  Future<ListMarketPlaceModel> unstacking(@Body() UnStackingSchema unStaking);
}
