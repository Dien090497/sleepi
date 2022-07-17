// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i9;

import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:dio/dio.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i11;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../common/contract_addresses/contract_addresses.dart' as _i6;
import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i7;
import '../common/utils/random_utils.dart' as _i17;
import '../common/utils/toast_utils.dart' as _i19;
import '../datasources/local/get_storage_datasource.dart' as _i12;
import '../datasources/local/history_datasource.dart' as _i21;
import '../datasources/local/isar/isar_datasource.dart' as _i15;
import '../datasources/local/network_connection_datasource.dart' as _i16;
import '../datasources/local/secure_storage.dart' as _i27;
import '../datasources/local/shared_preference_datasource.dart' as _i28;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i40;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i31;
import '../datasources/remote/auth_datasource/refresh_token_interceptor.dart'
    as _i35;
import '../datasources/remote/network/nft_datasource.dart' as _i24;
import '../datasources/remote/network/spending_datasource.dart' as _i29;
import '../datasources/remote/network/web3_datasource.dart' as _i30;
import '../datasources/remote/network/web3_provider.dart' as _i20;
import '../datasources/remote/nft_api/nft_api.dart' as _i62;
import '../datasources/remote/sleep_tracking_api/sleep_tracking_api.dart'
    as _i38;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i39;
import '../repository/auth_repository.dart' as _i41;
import '../repository/gacha_repository.dart' as _i43;
import '../repository/implementations/auth_implementation.dart' as _i42;
import '../repository/implementations/gacha_implementation.dart' as _i44;
import '../repository/implementations/market_place_implementation.dart' as _i46;
import '../repository/implementations/network_connection_implementation.dart'
    as _i23;
import '../repository/implementations/nft_implementation.dart' as _i115;
import '../repository/implementations/sleep_tracking_implementation.dart'
    as _i48;
import '../repository/implementations/spending_implementation.dart' as _i50;
import '../repository/implementations/transaction_implementation.dart' as _i34;
import '../repository/implementations/user_implementations.dart' as _i52;
import '../repository/implementations/wallet_implementation.dart' as _i54;
import '../repository/market_place_repository.dart' as _i45;
import '../repository/network_connection_repository.dart' as _i22;
import '../repository/nft_repository.dart' as _i114;
import '../repository/sleep_tracking_repository.dart' as _i47;
import '../repository/spending_repository.dart' as _i49;
import '../repository/transaction_repository.dart' as _i33;
import '../repository/user_repository.dart' as _i51;
import '../repository/wallet_repository.dart' as _i53;
import '../usecase/activation_code_setting_usecase.dart' as _i81;
import '../usecase/add_item_to_bed_usecase.dart' as _i82;
import '../usecase/approve_usecase.dart' as _i83;
import '../usecase/buy_nft_usecase.dart' as _i84;
import '../usecase/change_password_usecase.dart' as _i85;
import '../usecase/check_activation_code_usecase.dart' as _i86;
import '../usecase/check_approve_usecase.dart' as _i87;
import '../usecase/compound_usecase.dart' as _i89;
import '../usecase/create_pass_code_usecase.dart' as _i90;
import '../usecase/create_password_usecase.dart' as _i91;
import '../usecase/current_user_usecase.dart' as _i93;
import '../usecase/estimate_gas_withdraw.dart' as _i95;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i120;
import '../usecase/estimate_tracking_usecase.dart' as _i96;
import '../usecase/fetch_balance_spending_usecase.dart' as _i97;
import '../usecase/fetch_bed_usecase.dart' as _i98;
import '../usecase/fetch_data_chart_usecase.dart' as _i99;
import '../usecase/fetch_item_owner_usecase.dart' as _i100;
import '../usecase/fetch_lucky_box_usecase.dart' as _i101;
import '../usecase/gacha_spin_usecase.dart' as _i102;
import '../usecase/get_amount_out_min_usecase.dart' as _i103;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i104;
import '../usecase/get_balance_token_usecase.dart' as _i105;
import '../usecase/get_current_network_usecase.dart' as _i107;
import '../usecase/get_global_config.dart' as _i108;
import '../usecase/get_history_transaction_usecase.dart' as _i109;
import '../usecase/get_list_nft_detail_usecase.dart' as _i121;
import '../usecase/get_market_place_usecase.dart' as _i61;
import '../usecase/get_network_connection_usecase.dart' as _i32;
import '../usecase/get_nfts_balance_usecase.dart' as _i122;
import '../usecase/get_nfts_ids_usecase.dart' as _i123;
import '../usecase/get_sleep_result_usecase.dart' as _i110;
import '../usecase/get_user_status_tracking_usecase.dart' as _i111;
import '../usecase/get_user_usecase.dart' as _i112;
import '../usecase/has_wallet_usecase.dart' as _i113;
import '../usecase/is_first_open_app_usecase.dart' as _i56;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i116;
import '../usecase/is_passcode_created_usecase.dart' as _i57;
import '../usecase/is_valid_wallet_address_usecase.dart' as _i13;
import '../usecase/login_usecase.dart' as _i58;
import '../usecase/logout_usecase.dart' as _i59;
import '../usecase/make_first_open_app_usecase.dart' as _i60;
import '../usecase/on_connection_changed_usecase.dart' as _i25;
import '../usecase/open_lucky_box_usecase.dart' as _i63;
import '../usecase/remove_item_from_bed_usecase.dart' as _i64;
import '../usecase/run_app_init_usecase.dart' as _i26;
import '../usecase/send_nft_to_spending_usecase.dart' as _i117;
import '../usecase/send_otp_mail_usecase.dart' as _i65;
import '../usecase/send_to_external_usecase.dart' as _i36;
import '../usecase/send_token_to_external.dart' as _i37;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i118;
import '../usecase/setting_active_code_usecase.dart' as _i66;
import '../usecase/sign_up_usecase.dart' as _i67;
import '../usecase/speed_up_lucky_box_usecase.dart' as _i68;
import '../usecase/staking_info_usecase.dart' as _i69;
import '../usecase/staking_usecase.dart' as _i70;
import '../usecase/start_sleep_tracking_usecase.dart' as _i71;
import '../usecase/swap_token_usecase.dart' as _i72;
import '../usecase/to_spending_usecase.dart' as _i73;
import '../usecase/transfer_nft_usecase.dart' as _i119;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i74;
import '../usecase/unstaking_usecase.dart' as _i75;
import '../usecase/validate_mnemonic.dart' as _i76;
import '../usecase/validate_passcode_usecase.dart' as _i77;
import '../usecase/verify_otp_usecase.dart' as _i78;
import '../usecase/wake_up_usecase.dart' as _i79;
import '../usecase/wallet/create_wallet_usecase.dart' as _i92;
import '../usecase/wallet/current_wallet_usecase.dart' as _i94;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i88;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i106;
import '../usecase/wallet/import_wallet_usecase.dart' as _i55;
import '../usecase/withdraw_history_usecase.dart' as _i80;
import 'register_module.dart' as _i124; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final rPCModule = _$RPCModule();
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppFlyerCustom>(_i3.AppFlyerCustom());
  gh.factory<_i4.Client>(() => rPCModule.httpClient);
  gh.factory<_i5.Connectivity>(() => registerModule.connectivity);
  gh.factory<_i6.ContractAddresses>(() => _i6.ContractAddresses());
  gh.factory<_i7.DateTimeUtils>(() => _i7.DateTimeUtils());
  gh.factory<_i8.Dio>(() => registerModule.dio);
  await gh.factoryAsync<_i9.Directory>(() => registerModule.isarDir,
      preResolve: true);
  gh.factory<_i10.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i11.GetStorage>(() => registerModule.getStorage);
  gh.factory<_i12.GetStorageDataSource>(
      () => _i12.GetStorageDataSource(get<_i11.GetStorage>()));
  gh.factory<_i13.IsValidWalletAddressUseCase>(
      () => _i13.IsValidWalletAddressUseCase());
  await gh.factoryAsync<_i14.Isar>(
      () => registerModule.isar(get<_i9.Directory>()),
      preResolve: true);
  gh.singleton<_i15.IsarDataSource>(_i15.IsarDataSource(get<_i14.Isar>()));
  gh.factory<_i16.NetworkConnectionDataSource>(
      () => _i16.NetworkConnectionDataSource(get<_i5.Connectivity>()));
  gh.factory<_i17.RandomUtils>(() => _i17.RandomUtils());
  await gh.factoryAsync<_i18.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i12.StorageKeys>(() => _i12.StorageKeys());
  gh.factory<_i19.ToastUtils>(() => _i19.ToastUtils());
  gh.singleton<_i20.Web3Provider>(_i20.Web3Provider(get<_i4.Client>()));
  gh.factory<_i21.HistoryDataSource>(
      () => _i21.HistoryDataSource(get<_i14.Isar>()));
  gh.factory<_i22.INetworkConnectionRepository>(() =>
      _i23.NetworkConnectionImplementation(
          get<_i16.NetworkConnectionDataSource>()));
  gh.factory<_i24.NFTDataSource>(
      () => _i24.NFTDataSource(get<_i20.Web3Provider>()));
  gh.factory<_i25.OnConnectionChangedUseCase>(() =>
      _i25.OnConnectionChangedUseCase(
          get<_i22.INetworkConnectionRepository>()));
  gh.factory<_i26.RunAppInitUseCase>(() => _i26.RunAppInitUseCase(
      get<_i20.Web3Provider>(),
      get<_i15.IsarDataSource>(),
      get<_i12.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i27.SecureStorage>(() => _i27.SecureStorage(
      get<_i10.FlutterSecureStorage>(), get<_i18.SharedPreferences>()));
  gh.factory<_i28.SharedPreferenceDataSource>(
      () => _i28.SharedPreferenceDataSource(get<_i18.SharedPreferences>()));
  gh.factory<_i29.SpendingDataSource>(
      () => _i29.SpendingDataSource(get<_i20.Web3Provider>()));
  gh.factory<_i30.Web3DataSource>(
      () => _i30.Web3DataSource(get<_i20.Web3Provider>()));
  gh.factory<_i31.AuthInterceptor>(
      () => _i31.AuthInterceptor(get<_i27.SecureStorage>(), get<_i8.Dio>()));
  gh.factory<_i32.GetNetworkConnectionUseCase>(() =>
      _i32.GetNetworkConnectionUseCase(
          get<_i22.INetworkConnectionRepository>()));
  gh.factory<_i33.ITransactionRepository>(() => _i34.TransactionImplementation(
      get<_i30.Web3DataSource>(),
      get<_i12.GetStorageDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i21.HistoryDataSource>()));
  gh.factory<_i35.RefreshTokenInterceptor>(() =>
      _i35.RefreshTokenInterceptor(get<_i27.SecureStorage>(), get<_i8.Dio>()));
  gh.factory<_i36.SendToExternalUseCase>(
      () => _i36.SendToExternalUseCase(get<_i33.ITransactionRepository>()));
  gh.factory<_i37.SendTokenToExternalUseCase>(() =>
      _i37.SendTokenToExternalUseCase(get<_i33.ITransactionRepository>()));
  gh.factory<_i38.SleepTrackingApi>(() => _i38.SleepTrackingApi(get<_i8.Dio>(),
      get<_i31.AuthInterceptor>(), get<_i35.RefreshTokenInterceptor>()));
  gh.factory<_i39.TransactionRemoteDataSource>(() =>
      _i39.TransactionRemoteDataSource(
          get<_i21.HistoryDataSource>(),
          get<_i30.Web3DataSource>(),
          get<_i12.GetStorageDataSource>(),
          get<_i15.IsarDataSource>(),
          get<_i8.Dio>()));
  gh.factory<_i40.AuthDataSource>(() => _i40.AuthDataSource(get<_i8.Dio>(),
      get<_i31.AuthInterceptor>(), get<_i35.RefreshTokenInterceptor>()));
  gh.factory<_i41.IAuthRepository>(() => _i42.AuthImplementation(
      get<_i27.SecureStorage>(),
      get<_i40.AuthDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i12.GetStorageDataSource>()));
  gh.factory<_i43.IGachaRepository>(
      () => _i44.GachaImplementation(get<_i40.AuthDataSource>()));
  gh.factory<_i45.IMarketPlaceRepository>(
      () => _i46.TransactionImplementation(get<_i40.AuthDataSource>()));
  gh.factory<_i47.ISleepTrackingRepository>(
      () => _i48.SleepTrackingImplementation(get<_i38.SleepTrackingApi>()));
  gh.factory<_i49.ISpendingRepository>(() => _i50.SpendingImplementation(
      get<_i29.SpendingDataSource>(),
      get<_i30.Web3DataSource>(),
      get<_i40.AuthDataSource>()));
  gh.factory<_i51.IUserRepository>(() => _i52.UserImplementation(
      get<_i40.AuthDataSource>(),
      get<_i27.SecureStorage>(),
      get<_i12.GetStorageDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i30.Web3DataSource>()));
  gh.factory<_i53.IWalletRepository>(() => _i54.WalletImplementation(
      get<_i30.Web3DataSource>(),
      get<_i12.GetStorageDataSource>(),
      get<_i39.TransactionRemoteDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i20.Web3Provider>(),
      get<_i27.SecureStorage>(),
      get<_i40.AuthDataSource>()));
  gh.factory<_i55.ImportWalletUseCase>(
      () => _i55.ImportWalletUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i56.IsFirstOpenAppUseCase>(
      () => _i56.IsFirstOpenAppUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i57.IsPassCodeCreatedUseCase>(
      () => _i57.IsPassCodeCreatedUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i58.LogInUseCase>(
      () => _i58.LogInUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i59.LogOutUseCase>(
      () => _i59.LogOutUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i60.MakeFirstOpenAppUseCase>(
      () => _i60.MakeFirstOpenAppUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i61.MarketPlaceUseCase>(
      () => _i61.MarketPlaceUseCase(get<_i45.IMarketPlaceRepository>()));
  gh.factory<_i62.NftApi>(() => _i62.NftApi(get<_i8.Dio>(),
      get<_i31.AuthInterceptor>(), get<_i35.RefreshTokenInterceptor>()));
  gh.factory<_i63.OpenLuckyBoxUseCase>(
      () => _i63.OpenLuckyBoxUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i64.RemoveItemFromBedUseCase>(
      () => _i64.RemoveItemFromBedUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i65.SendOTPMailUseCase>(
      () => _i65.SendOTPMailUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i66.SettingActiveCodeUseCase>(
      () => _i66.SettingActiveCodeUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i67.SignUpUseCase>(
      () => _i67.SignUpUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i68.SpeedUpLuckyBoxUseCase>(
      () => _i68.SpeedUpLuckyBoxUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i69.StakingInfoUseCase>(
      () => _i69.StakingInfoUseCase(get<_i49.ISpendingRepository>()));
  gh.factory<_i70.StakingUseCase>(
      () => _i70.StakingUseCase(get<_i49.ISpendingRepository>()));
  gh.factory<_i71.StartSleepTrackingUseCase>(() =>
      _i71.StartSleepTrackingUseCase(get<_i47.ISleepTrackingRepository>()));
  gh.factory<_i72.SwapTokenUseCase>(
      () => _i72.SwapTokenUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i73.ToSpendingUseCase>(() => _i73.ToSpendingUseCase(
      get<_i49.ISpendingRepository>(), get<_i53.IWalletRepository>()));
  gh.factory<_i74.TransferTokenToMainWalletUseCase>(
      () => _i74.TransferTokenToMainWalletUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i75.UnStakingUseCase>(
      () => _i75.UnStakingUseCase(get<_i49.ISpendingRepository>()));
  gh.factory<_i76.ValidateMnemonicUseCase>(
      () => _i76.ValidateMnemonicUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i77.ValidatePassCodeUseCase>(
      () => _i77.ValidatePassCodeUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i78.VerifyOTPUseCase>(
      () => _i78.VerifyOTPUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i79.WakeUpUseCase>(
      () => _i79.WakeUpUseCase(get<_i47.ISleepTrackingRepository>()));
  gh.factory<_i80.WithdrawHistoryUseCase>(
      () => _i80.WithdrawHistoryUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i81.ActivationCodeSettingUseCase>(
      () => _i81.ActivationCodeSettingUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i82.AddItemToBedUseCase>(
      () => _i82.AddItemToBedUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i83.ApproveUseCase>(() => _i83.ApproveUseCase(
      get<_i49.ISpendingRepository>(), get<_i53.IWalletRepository>()));
  gh.factory<_i84.BuyNFTUseCase>(
      () => _i84.BuyNFTUseCase(get<_i45.IMarketPlaceRepository>()));
  gh.factory<_i85.ChangePasswordUseCase>(
      () => _i85.ChangePasswordUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i86.CheckActivationCodeUseCase>(
      () => _i86.CheckActivationCodeUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i87.CheckApproveUseCase>(
      () => _i87.CheckApproveUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i88.CheckFirstOpenWallet>(
      () => _i88.CheckFirstOpenWallet(get<_i53.IWalletRepository>()));
  gh.factory<_i89.CompoundUseCase>(
      () => _i89.CompoundUseCase(get<_i49.ISpendingRepository>()));
  gh.factory<_i90.CreatePassCodeUseCase>(
      () => _i90.CreatePassCodeUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i91.CreatePasswordUseCase>(
      () => _i91.CreatePasswordUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i92.CreateWalletUseCase>(
      () => _i92.CreateWalletUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i93.CurrentUserUseCase>(
      () => _i93.CurrentUserUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i94.CurrentWalletUseCase>(
      () => _i94.CurrentWalletUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i95.EstimateGasWithdrawUseCase>(
      () => _i95.EstimateGasWithdrawUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i96.EstimateTrackingUseCase>(
      () => _i96.EstimateTrackingUseCase(get<_i47.ISleepTrackingRepository>()));
  gh.factory<_i97.FetchBalanceSpendingUseCase>(
      () => _i97.FetchBalanceSpendingUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i98.FetchBedUseCase>(
      () => _i98.FetchBedUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i99.FetchDataChartUseCase>(
      () => _i99.FetchDataChartUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i100.FetchItemOwnerUseCase>(
      () => _i100.FetchItemOwnerUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i101.FetchLuckyBoxUseCase>(
      () => _i101.FetchLuckyBoxUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i102.GachaSpinUseCase>(
      () => _i102.GachaSpinUseCase(get<_i43.IGachaRepository>()));
  gh.factory<_i103.GetAmountOutMinUseCase>(
      () => _i103.GetAmountOutMinUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i104.GetBalanceForTokensUseCase>(
      () => _i104.GetBalanceForTokensUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i105.GetBalanceTokenUseCase>(
      () => _i105.GetBalanceTokenUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i106.GetCurrentMnemonicUsecase>(
      () => _i106.GetCurrentMnemonicUsecase(get<_i53.IWalletRepository>()));
  gh.factory<_i107.GetCurrentNetworkUseCase>(
      () => _i107.GetCurrentNetworkUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i108.GetGlobalConfigUseCase>(
      () => _i108.GetGlobalConfigUseCase(get<_i51.IUserRepository>()));
  gh.factory<_i109.GetHistoryTransactionUseCase>(
      () => _i109.GetHistoryTransactionUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i110.GetSleepResultUseCase>(
      () => _i110.GetSleepResultUseCase(get<_i47.ISleepTrackingRepository>()));
  gh.factory<_i111.GetUserStatusTrackingUseCase>(() =>
      _i111.GetUserStatusTrackingUseCase(get<_i47.ISleepTrackingRepository>()));
  gh.factory<_i112.GetUserUseCase>(
      () => _i112.GetUserUseCase(get<_i41.IAuthRepository>()));
  gh.factory<_i113.HasWalletUseCase>(
      () => _i113.HasWalletUseCase(get<_i53.IWalletRepository>()));
  gh.factory<_i114.INFTRepository>(() => _i115.NFTImplementation(
      get<_i24.NFTDataSource>(),
      get<_i62.NftApi>(),
      get<_i27.SecureStorage>()));
  gh.factory<_i116.IsNftApproveForAllUseCase>(
      () => _i116.IsNftApproveForAllUseCase(get<_i114.INFTRepository>()));
  gh.factory<_i117.SendNftToSpendingUseCase>(() =>
      _i117.SendNftToSpendingUseCase(
          get<_i114.INFTRepository>(), get<_i27.SecureStorage>()));
  gh.factory<_i118.SetNftApprovalForAllUseCase>(() =>
      _i118.SetNftApprovalForAllUseCase(
          get<_i114.INFTRepository>(), get<_i27.SecureStorage>()));
  gh.factory<_i119.TransferNftUseCase>(
      () => _i119.TransferNftUseCase(get<_i114.INFTRepository>()));
  gh.factory<_i120.EstimateNftFunctionFeeUseCase>(
      () => _i120.EstimateNftFunctionFeeUseCase(get<_i114.INFTRepository>()));
  gh.factory<_i121.GetListNftDetailUseCase>(
      () => _i121.GetListNftDetailUseCase(get<_i114.INFTRepository>()));
  gh.factory<_i122.GetNFTsBalanceUseCase>(
      () => _i122.GetNFTsBalanceUseCase(get<_i114.INFTRepository>()));
  gh.factory<_i123.GetNFTsIDsUseCase>(
      () => _i123.GetNFTsIDsUseCase(get<_i114.INFTRepository>()));
  return get;
}

class _$RPCModule extends _i30.RPCModule {}

class _$RegisterModule extends _i124.RegisterModule {}
