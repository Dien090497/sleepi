// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i8;

import 'package:dio/dio.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i10;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../common/contract_addresses/contract_addresses.dart' as _i5;
import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i6;
import '../common/utils/random_utils.dart' as _i15;
import '../common/utils/toast_utils.dart' as _i18;
import '../datasources/local/get_storage_datasource.dart' as _i11;
import '../datasources/local/history_datasource.dart' as _i20;
import '../datasources/local/isar/isar_datasource.dart' as _i13;
import '../datasources/local/secure_storage.dart' as _i23;
import '../datasources/local/shared_preference_datasource.dart' as _i24;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i42;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i27;
import '../datasources/remote/auth_datasource/refresh_token_interceptor.dart'
    as _i35;
import '../datasources/remote/network/nft_datasource.dart' as _i21;
import '../datasources/remote/network/spending_datasource.dart' as _i25;
import '../datasources/remote/network/web3_datasource.dart' as _i26;
import '../datasources/remote/network/web3_provider.dart' as _i19;
import '../datasources/remote/nft_api/nft_api.dart' as _i14;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i40;
import '../repository/auth_repository.dart' as _i47;
import '../repository/implementations/auth_implementation.dart' as _i48;
import '../repository/implementations/market_place_implementation.dart' as _i50;
import '../repository/implementations/nft_implementation.dart' as _i29;
import '../repository/implementations/spending_implementation.dart' as _i31;
import '../repository/implementations/transaction_implementation.dart' as _i33;
import '../repository/implementations/user_implementations.dart' as _i52;
import '../repository/implementations/wallet_implementation.dart' as _i54;
import '../repository/market_place_repository.dart' as _i49;
import '../repository/nft_repository.dart' as _i28;
import '../repository/spending_repository.dart' as _i30;
import '../repository/transaction_repository.dart' as _i32;
import '../repository/user_repository.dart' as _i51;
import '../repository/wallet_repository.dart' as _i53;
import '../usecase/activation_code_setting_usecase.dart' as _i72;
import '../usecase/approve_usecase.dart' as _i73;
import '../usecase/buy_nft_usecase.dart' as _i74;
import '../usecase/change_password_usecase.dart' as _i75;
import '../usecase/check_activation_code_usecase.dart' as _i76;
import '../usecase/check_approve_usecase.dart' as _i77;
import '../usecase/create_pass_code_usecase.dart' as _i79;
import '../usecase/create_password_usecase.dart' as _i80;
import '../usecase/current_user_usecase.dart' as _i82;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i43;
import '../usecase/fetch_balance_spending_usecase.dart' as _i84;
import '../usecase/get_amount_out_min_usecase.dart' as _i85;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i86;
import '../usecase/get_balance_token_usecase.dart' as _i87;
import '../usecase/get_current_network_usecase.dart' as _i89;
import '../usecase/get_global_config.dart' as _i90;
import '../usecase/get_history_transaction_usecase.dart' as _i91;
import '../usecase/get_list_nft_detail_usecase.dart' as _i44;
import '../usecase/get_market_place_usecase.dart' as _i61;
import '../usecase/get_nfts_balance_usecase.dart' as _i45;
import '../usecase/get_nfts_ids_usecase.dart' as _i46;
import '../usecase/get_user_usecase.dart' as _i92;
import '../usecase/is_first_open_app_usecase.dart' as _i56;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i34;
import '../usecase/is_passcode_created_usecase.dart' as _i57;
import '../usecase/login_usecase.dart' as _i58;
import '../usecase/logout_usecase.dart' as _i59;
import '../usecase/make_first_open_app_usecase.dart' as _i60;
import '../usecase/run_app_init_usecase.dart' as _i22;
import '../usecase/send_nft_to_spending_usecase.dart' as _i36;
import '../usecase/send_otp_mail_usecase.dart' as _i62;
import '../usecase/send_to_external_usecase.dart' as _i37;
import '../usecase/send_token_to_external.dart' as _i38;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i39;
import '../usecase/setting_active_code_usecase.dart' as _i63;
import '../usecase/sign_up_usecase.dart' as _i64;
import '../usecase/spending_load_history_usecase.dart' as _i65;
import '../usecase/spending_load_pending_usecase.dart' as _i17;
import '../usecase/swap_token_usecase.dart' as _i66;
import '../usecase/to_spending_usecase.dart' as _i67;
import '../usecase/transfer_nft_usecase.dart' as _i41;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i68;
import '../usecase/validate_mnemonic.dart' as _i69;
import '../usecase/validate_passcode_usecase.dart' as _i70;
import '../usecase/verify_otp_usecase.dart' as _i71;
import '../usecase/wallet/create_wallet_usecase.dart' as _i81;
import '../usecase/wallet/current_wallet_usecase.dart' as _i83;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i78;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i88;
import '../usecase/wallet/import_wallet_usecase.dart' as _i55;
import 'register_module.dart' as _i93; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final rPCModule = _$RPCModule();
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppFlyerCustom>(_i3.AppFlyerCustom());
  gh.factory<_i4.Client>(() => rPCModule.httpClient);
  gh.factory<_i5.ContractAddresses>(() => _i5.ContractAddresses());
  gh.factory<_i6.DateTimeUtils>(() => _i6.DateTimeUtils());
  gh.factory<_i7.Dio>(() => registerModule.dio);
  await gh.factoryAsync<_i8.Directory>(() => registerModule.isarDir,
      preResolve: true);
  gh.factory<_i9.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i10.GetStorage>(() => registerModule.getStorage);
  gh.factory<_i11.GetStorageDataSource>(
      () => _i11.GetStorageDataSource(get<_i10.GetStorage>()));
  await gh.factoryAsync<_i12.Isar>(
      () => registerModule.isar(get<_i8.Directory>()),
      preResolve: true);
  gh.singleton<_i13.IsarDataSource>(_i13.IsarDataSource(get<_i12.Isar>()));
  gh.factory<_i14.NftApi>(() => _i14.NftApi(get<_i7.Dio>()));
  gh.factory<_i15.RandomUtils>(() => _i15.RandomUtils());
  await gh.factoryAsync<_i16.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i17.SpendingLoadPendingUseCase>(
      () => _i17.SpendingLoadPendingUseCase());
  gh.factory<_i11.StorageKeys>(() => _i11.StorageKeys());
  gh.factory<_i18.ToastUtils>(() => _i18.ToastUtils());
  gh.singleton<_i19.Web3Provider>(_i19.Web3Provider(get<_i4.Client>()));
  gh.factory<_i20.HistoryDataSource>(
      () => _i20.HistoryDataSource(get<_i12.Isar>()));
  gh.factory<_i21.NFTDataSource>(
      () => _i21.NFTDataSource(get<_i19.Web3Provider>()));
  gh.factory<_i22.RunAppInitUseCase>(() => _i22.RunAppInitUseCase(
      get<_i19.Web3Provider>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i23.SecureStorage>(() => _i23.SecureStorage(
      get<_i9.FlutterSecureStorage>(), get<_i16.SharedPreferences>()));
  gh.factory<_i24.SharedPreferenceDataSource>(
      () => _i24.SharedPreferenceDataSource(get<_i16.SharedPreferences>()));
  gh.factory<_i25.SpendingDataSource>(
      () => _i25.SpendingDataSource(get<_i19.Web3Provider>()));
  gh.factory<_i26.Web3DataSource>(
      () => _i26.Web3DataSource(get<_i19.Web3Provider>()));
  gh.factory<_i27.AuthInterceptor>(
      () => _i27.AuthInterceptor(get<_i23.SecureStorage>(), get<_i7.Dio>()));
  gh.factory<_i28.INFTRepository>(() => _i29.NFTImplementation(
      get<_i21.NFTDataSource>(),
      get<_i14.NftApi>(),
      get<_i23.SecureStorage>()));
  gh.factory<_i30.ISpendingRepository>(() => _i31.SpendingImplementation(
      get<_i25.SpendingDataSource>(), get<_i26.Web3DataSource>()));
  gh.factory<_i32.ITransactionRepository>(() => _i33.TransactionImplementation(
      get<_i26.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i20.HistoryDataSource>()));
  gh.factory<_i34.IsNftApproveForAllUseCase>(
      () => _i34.IsNftApproveForAllUseCase(get<_i28.INFTRepository>()));
  gh.factory<_i35.RefreshTokenInterceptor>(() =>
      _i35.RefreshTokenInterceptor(get<_i23.SecureStorage>(), get<_i7.Dio>()));
  gh.factory<_i36.SendNftToSpendingUseCase>(
      () => _i36.SendNftToSpendingUseCase(get<_i28.INFTRepository>()));
  gh.factory<_i37.SendToExternalUseCase>(
      () => _i37.SendToExternalUseCase(get<_i32.ITransactionRepository>()));
  gh.factory<_i38.SendTokenToExternalUseCase>(() =>
      _i38.SendTokenToExternalUseCase(get<_i32.ITransactionRepository>()));
  gh.factory<_i39.SetNftApprovalForAllUseCase>(
      () => _i39.SetNftApprovalForAllUseCase(get<_i28.INFTRepository>()));
  gh.factory<_i40.TransactionRemoteDataSource>(() =>
      _i40.TransactionRemoteDataSource(
          get<_i20.HistoryDataSource>(),
          get<_i26.Web3DataSource>(),
          get<_i11.GetStorageDataSource>(),
          get<_i13.IsarDataSource>(),
          get<_i7.Dio>()));
  gh.factory<_i41.TransferNftUseCase>(
      () => _i41.TransferNftUseCase(get<_i28.INFTRepository>()));
  gh.factory<_i42.AuthDataSource>(() => _i42.AuthDataSource(get<_i7.Dio>(),
      get<_i27.AuthInterceptor>(), get<_i35.RefreshTokenInterceptor>()));
  gh.factory<_i43.EstimateNftFunctionFeeUseCase>(
      () => _i43.EstimateNftFunctionFeeUseCase(get<_i28.INFTRepository>()));
  gh.factory<_i44.GetListNftDetailUseCase>(
      () => _i44.GetListNftDetailUseCase(get<_i28.INFTRepository>()));
  gh.factory<_i45.GetNFTsBalanceUseCase>(
      () => _i45.GetNFTsBalanceUseCase(get<_i28.INFTRepository>()));
  gh.factory<_i46.GetNFTsIDsUseCase>(
      () => _i46.GetNFTsIDsUseCase(get<_i28.INFTRepository>()));
  gh.factory<_i47.IAuthRepository>(() => _i48.AuthImplementation(
      get<_i23.SecureStorage>(),
      get<_i42.AuthDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>()));
  gh.factory<_i49.IMarketPlaceRepository>(
      () => _i50.TransactionImplementation(get<_i42.AuthDataSource>()));
  gh.factory<_i51.IUserRepository>(() => _i52.UserImplementation(
      get<_i42.AuthDataSource>(), get<_i23.SecureStorage>()));
  gh.factory<_i53.IWalletRepository>(() => _i54.WalletImplementation(
      get<_i26.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i20.HistoryDataSource>(),
      get<_i40.TransactionRemoteDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i19.Web3Provider>(),
      get<_i23.SecureStorage>(),
      get<_i42.AuthDataSource>()));
  gh.factory<_i55.ImportWalletUseCase>(
      () => _i55.ImportWalletUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i56.IsFirstOpenAppUseCase>(
      () => _i56.IsFirstOpenAppUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i57.IsPassCodeCreatedUseCase>(
      () => _i57.IsPassCodeCreatedUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i58.LogInUseCase>(
      () => _i58.LogInUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i59.LogOutUseCase>(
      () => _i59.LogOutUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i60.MakeFirstOpenAppUseCase>(
      () => _i60.MakeFirstOpenAppUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i61.MarketPlaceUseCase>(
      () => _i61.MarketPlaceUseCase(get<_i49.IMarketPlaceRepository>()));
  gh.factory<_i62.SendOTPMailUseCase>(
      () => _i62.SendOTPMailUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i63.SettingActiveCodeUseCase>(
      () => _i63.SettingActiveCodeUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i64.SignUpUseCase>(
      () => _i64.SignUpUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i65.SpendingLoadHistoryUseCase>(
      () => _i65.SpendingLoadHistoryUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i66.SwapTokenUseCase>(
      () => _i66.SwapTokenUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i67.ToSpendingUseCase>(() => _i67.ToSpendingUseCase(
      get<_i30.ISpendingRepository>(), get<_i53.IWalletRepository>()));
  gh.factory<_i68.TransferTokenToMainWalletUseCase>(
      () => _i68.TransferTokenToMainWalletUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i69.ValidateMnemonicUseCase>(
      () => _i69.ValidateMnemonicUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i70.ValidatePassCodeUseCase>(
      () => _i70.ValidatePassCodeUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i71.VerifyOTPUseCase>(
      () => _i71.VerifyOTPUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i72.ActivationCodeSettingUseCase>(
      () => _i72.ActivationCodeSettingUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i73.ApproveUseCase>(() => _i73.ApproveUseCase(
      get<_i30.ISpendingRepository>(), get<_i53.IWalletRepository>()));
  gh.factory<_i74.BuyNFTUseCase>(
      () => _i74.BuyNFTUseCase(get<_i49.IMarketPlaceRepository>()));
  gh.factory<_i75.ChangePasswordUseCase>(
      () => _i75.ChangePasswordUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i76.CheckActivationCodeUseCase>(
      () => _i76.CheckActivationCodeUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i77.CheckApproveUseCase>(
      () => _i77.CheckApproveUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i78.CheckFirstOpenWallet>(
      () => _i78.CheckFirstOpenWallet(get<_i53.IWalletRepository>()));
  gh.factory<_i79.CreatePassCodeUseCase>(
      () => _i79.CreatePassCodeUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i80.CreatePasswordUseCase>(
      () => _i80.CreatePasswordUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i81.CreateWalletUseCase>(
      () => _i81.CreateWalletUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i82.CurrentUserUseCase>(
      () => _i82.CurrentUserUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i83.CurrentWalletUseCase>(
      () => _i83.CurrentWalletUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i84.FetchBalanceSpendingUseCase>(
      () => _i84.FetchBalanceSpendingUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i85.GetAmountOutMinUseCase>(
      () => _i85.GetAmountOutMinUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i86.GetBalanceForTokensUseCase>(
      () => _i86.GetBalanceForTokensUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i87.GetBalanceTokenUseCase>(
      () => _i87.GetBalanceTokenUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i88.GetCurrentMnemonicUsecase>(
      () => _i88.GetCurrentMnemonicUsecase(get<_i53.IWalletRepository>()));
  gh.factory<_i89.GetCurrentNetworkUseCase>(
      () => _i89.GetCurrentNetworkUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i90.GetGlobalConfigUseCase>(
      () => _i90.GetGlobalConfigUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i91.GetHistoryTransactionUseCase>(
      () => _i91.GetHistoryTransactionUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i92.GetUserUseCase>(
      () => _i92.GetUserUseCase(get<_i47.IAuthRepository>()));
  return get;
}

class _$RPCModule extends _i26.RPCModule {}

class _$RegisterModule extends _i93.RegisterModule {}
