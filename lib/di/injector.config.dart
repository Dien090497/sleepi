// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i10;

import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:device_info_plus/device_info_plus.dart' as _i8;
import 'package:dio/dio.dart' as _i9;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i12;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../common/contract_addresses/contract_addresses.dart' as _i6;
import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i7;
import '../common/utils/random_utils.dart' as _i18;
import '../common/utils/toast_utils.dart' as _i20;
import '../datasources/local/get_storage_datasource.dart' as _i13;
import '../datasources/local/history_datasource.dart' as _i22;
import '../datasources/local/isar/isar_datasource.dart' as _i16;
import '../datasources/local/network_connection_datasource.dart' as _i17;
import '../datasources/local/secure_storage.dart' as _i28;
import '../datasources/local/shared_preference_datasource.dart' as _i29;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i41;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i32;
import '../datasources/remote/auth_datasource/refresh_token_interceptor.dart'
    as _i36;
import '../datasources/remote/network/nft_datasource.dart' as _i25;
import '../datasources/remote/network/spending_datasource.dart' as _i30;
import '../datasources/remote/network/web3_datasource.dart' as _i31;
import '../datasources/remote/network/web3_provider.dart' as _i21;
import '../datasources/remote/nft_api/nft_api.dart' as _i61;
import '../datasources/remote/sleep_tracking_api/sleep_tracking_api.dart'
    as _i39;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i40;
import '../repository/auth_repository.dart' as _i42;
import '../repository/implementations/auth_implementation.dart' as _i43;
import '../repository/implementations/market_place_implementation.dart' as _i45;
import '../repository/implementations/network_connection_implementation.dart'
    as _i24;
import '../repository/implementations/nft_implementation.dart' as _i118;
import '../repository/implementations/sleep_tracking_implementation.dart'
    as _i47;
import '../repository/implementations/spending_implementation.dart' as _i49;
import '../repository/implementations/transaction_implementation.dart' as _i35;
import '../repository/implementations/user_implementations.dart' as _i51;
import '../repository/implementations/wallet_implementation.dart' as _i53;
import '../repository/market_place_repository.dart' as _i44;
import '../repository/network_connection_repository.dart' as _i23;
import '../repository/nft_repository.dart' as _i117;
import '../repository/sleep_tracking_repository.dart' as _i46;
import '../repository/spending_repository.dart' as _i48;
import '../repository/transaction_repository.dart' as _i34;
import '../repository/user_repository.dart' as _i50;
import '../repository/wallet_repository.dart' as _i52;
import '../usecase/activation_code_setting_usecase.dart' as _i83;
import '../usecase/add_item_to_bed_usecase.dart' as _i84;
import '../usecase/add_jewel_usecase.dart' as _i85;
import '../usecase/approve_usecase.dart' as _i86;
import '../usecase/bed_detail_usecase.dart' as _i87;
import '../usecase/buy_nft_usecase.dart' as _i88;
import '../usecase/change_password_usecase.dart' as _i89;
import '../usecase/check_activation_code_usecase.dart' as _i90;
import '../usecase/check_approve_usecase.dart' as _i91;
import '../usecase/compound_usecase.dart' as _i93;
import '../usecase/create_pass_code_usecase.dart' as _i94;
import '../usecase/create_password_usecase.dart' as _i95;
import '../usecase/current_user_usecase.dart' as _i97;
import '../usecase/estimate_gas_withdraw.dart' as _i99;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i125;
import '../usecase/estimate_tracking_usecase.dart' as _i100;
import '../usecase/fetch_balance_spending_usecase.dart' as _i101;
import '../usecase/fetch_bed_usecase.dart' as _i102;
import '../usecase/fetch_data_chart_usecase.dart' as _i103;
import '../usecase/fetch_item_owner_usecase.dart' as _i104;
import '../usecase/fetch_lucky_box_usecase.dart' as _i105;
import '../usecase/get_amount_out_min_usecase.dart' as _i106;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i107;
import '../usecase/get_balance_token_usecase.dart' as _i108;
import '../usecase/get_current_network_usecase.dart' as _i110;
import '../usecase/get_global_config.dart' as _i111;
import '../usecase/get_history_transaction_usecase.dart' as _i112;
import '../usecase/get_individual_detail_usecase.dart' as _i126;
import '../usecase/get_list_nft_detail_usecase.dart' as _i127;
import '../usecase/get_market_place_usecase.dart' as _i60;
import '../usecase/get_network_connection_usecase.dart' as _i33;
import '../usecase/get_nfts_balance_usecase.dart' as _i128;
import '../usecase/get_nfts_ids_usecase.dart' as _i129;
import '../usecase/get_sleep_result_usecase.dart' as _i113;
import '../usecase/get_transaction_fee_usecase.dart' as _i130;
import '../usecase/get_user_status_tracking_usecase.dart' as _i114;
import '../usecase/get_user_usecase.dart' as _i115;
import '../usecase/has_wallet_usecase.dart' as _i116;
import '../usecase/is_first_open_app_usecase.dart' as _i55;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i119;
import '../usecase/is_passcode_created_usecase.dart' as _i56;
import '../usecase/is_valid_wallet_address_usecase.dart' as _i14;
import '../usecase/login_usecase.dart' as _i57;
import '../usecase/logout_usecase.dart' as _i58;
import '../usecase/make_first_open_app_usecase.dart' as _i59;
import '../usecase/nft_sell_usecase.dart' as _i120;
import '../usecase/on_connection_changed_usecase.dart' as _i26;
import '../usecase/open_lucky_box_usecase.dart' as _i62;
import '../usecase/open_socket_usecase.dart' as _i63;
import '../usecase/post_health_data_usecase.dart' as _i64;
import '../usecase/remove_item_from_bed_usecase.dart' as _i65;
import '../usecase/remove_jewel_usecase.dart' as _i66;
import '../usecase/run_app_init_usecase.dart' as _i27;
import '../usecase/send_nft_to_spending_usecase.dart' as _i121;
import '../usecase/send_otp_mail_usecase.dart' as _i67;
import '../usecase/send_to_external_usecase.dart' as _i37;
import '../usecase/send_token_to_external.dart' as _i38;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i122;
import '../usecase/setting_active_code_usecase.dart' as _i68;
import '../usecase/sign_up_usecase.dart' as _i69;
import '../usecase/speed_up_lucky_box_usecase.dart' as _i70;
import '../usecase/staking_info_usecase.dart' as _i71;
import '../usecase/staking_usecase.dart' as _i72;
import '../usecase/start_sleep_tracking_usecase.dart' as _i73;
import '../usecase/swap_token_usecase.dart' as _i74;
import '../usecase/to_spending_usecase.dart' as _i75;
import '../usecase/transfer_nft_usecase.dart' as _i123;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i76;
import '../usecase/unstaking_usecase.dart' as _i77;
import '../usecase/validate_mnemonic.dart' as _i78;
import '../usecase/validate_passcode_usecase.dart' as _i79;
import '../usecase/verify_otp_usecase.dart' as _i80;
import '../usecase/wake_up_usecase.dart' as _i81;
import '../usecase/wallet/create_wallet_usecase.dart' as _i96;
import '../usecase/wallet/current_wallet_usecase.dart' as _i98;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i92;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i109;
import '../usecase/wallet/import_wallet_usecase.dart' as _i54;
import '../usecase/withdraw_history_usecase.dart' as _i82;
import '../usecase/withdrawNFT_usecase.dart' as _i124;
import 'register_module.dart' as _i131; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i8.DeviceInfoPlugin>(() => registerModule.deviceInfoPlugin);
  gh.factory<_i9.Dio>(() => registerModule.dio);
  await gh.factoryAsync<_i10.Directory>(() => registerModule.isarDir,
      preResolve: true);
  gh.factory<_i11.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i12.GetStorage>(() => registerModule.getStorage);
  gh.factory<_i13.GetStorageDataSource>(
      () => _i13.GetStorageDataSource(get<_i12.GetStorage>()));
  gh.factory<_i14.IsValidWalletAddressUseCase>(
      () => _i14.IsValidWalletAddressUseCase());
  await gh.factoryAsync<_i15.Isar>(
      () => registerModule.isar(get<_i10.Directory>()),
      preResolve: true);
  gh.singleton<_i16.IsarDataSource>(_i16.IsarDataSource(get<_i15.Isar>()));
  gh.factory<_i17.NetworkConnectionDataSource>(
      () => _i17.NetworkConnectionDataSource(get<_i5.Connectivity>()));
  gh.factory<_i18.RandomUtils>(() => _i18.RandomUtils());
  await gh.factoryAsync<_i19.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i13.StorageKeys>(() => _i13.StorageKeys());
  gh.factory<_i20.ToastUtils>(() => _i20.ToastUtils());
  gh.singleton<_i21.Web3Provider>(_i21.Web3Provider(get<_i4.Client>()));
  gh.factory<_i22.HistoryDataSource>(
      () => _i22.HistoryDataSource(get<_i15.Isar>()));
  gh.factory<_i23.INetworkConnectionRepository>(() =>
      _i24.NetworkConnectionImplementation(
          get<_i17.NetworkConnectionDataSource>()));
  gh.factory<_i25.NFTDataSource>(
      () => _i25.NFTDataSource(get<_i21.Web3Provider>()));
  gh.factory<_i26.OnConnectionChangedUseCase>(() =>
      _i26.OnConnectionChangedUseCase(
          get<_i23.INetworkConnectionRepository>()));
  gh.factory<_i27.RunAppInitUseCase>(() => _i27.RunAppInitUseCase(
      get<_i21.Web3Provider>(),
      get<_i16.IsarDataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i28.SecureStorage>(() => _i28.SecureStorage(
      get<_i11.FlutterSecureStorage>(), get<_i19.SharedPreferences>()));
  gh.factory<_i29.SharedPreferenceDataSource>(
      () => _i29.SharedPreferenceDataSource(get<_i19.SharedPreferences>()));
  gh.factory<_i30.SpendingDataSource>(
      () => _i30.SpendingDataSource(get<_i21.Web3Provider>()));
  gh.factory<_i31.Web3DataSource>(
      () => _i31.Web3DataSource(get<_i21.Web3Provider>()));
  gh.factory<_i32.AuthInterceptor>(() => _i32.AuthInterceptor(
      get<_i28.SecureStorage>(), get<_i9.Dio>(), get<_i8.DeviceInfoPlugin>()));
  gh.factory<_i33.GetNetworkConnectionUseCase>(() =>
      _i33.GetNetworkConnectionUseCase(
          get<_i23.INetworkConnectionRepository>()));
  gh.factory<_i34.ITransactionRepository>(() => _i35.TransactionImplementation(
      get<_i31.Web3DataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i22.HistoryDataSource>()));
  gh.factory<_i36.RefreshTokenInterceptor>(() =>
      _i36.RefreshTokenInterceptor(get<_i28.SecureStorage>(), get<_i9.Dio>()));
  gh.factory<_i37.SendToExternalUseCase>(
      () => _i37.SendToExternalUseCase(get<_i34.ITransactionRepository>()));
  gh.factory<_i38.SendTokenToExternalUseCase>(() =>
      _i38.SendTokenToExternalUseCase(get<_i34.ITransactionRepository>()));
  gh.factory<_i39.SleepTrackingApi>(() => _i39.SleepTrackingApi(get<_i9.Dio>(),
      get<_i32.AuthInterceptor>(), get<_i36.RefreshTokenInterceptor>()));
  gh.factory<_i40.TransactionRemoteDataSource>(() =>
      _i40.TransactionRemoteDataSource(
          get<_i22.HistoryDataSource>(),
          get<_i31.Web3DataSource>(),
          get<_i13.GetStorageDataSource>(),
          get<_i16.IsarDataSource>(),
          get<_i9.Dio>()));
  gh.factory<_i41.AuthDataSource>(() => _i41.AuthDataSource(get<_i9.Dio>(),
      get<_i32.AuthInterceptor>(), get<_i36.RefreshTokenInterceptor>()));
  gh.factory<_i42.IAuthRepository>(() => _i43.AuthImplementation(
      get<_i28.SecureStorage>(),
      get<_i41.AuthDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i13.GetStorageDataSource>()));
  gh.factory<_i44.IMarketPlaceRepository>(
      () => _i45.TransactionImplementation(get<_i41.AuthDataSource>()));
  gh.factory<_i46.ISleepTrackingRepository>(
      () => _i47.SleepTrackingImplementation(get<_i39.SleepTrackingApi>()));
  gh.factory<_i48.ISpendingRepository>(() => _i49.SpendingImplementation(
      get<_i30.SpendingDataSource>(),
      get<_i31.Web3DataSource>(),
      get<_i41.AuthDataSource>()));
  gh.factory<_i50.IUserRepository>(() => _i51.UserImplementation(
      get<_i41.AuthDataSource>(),
      get<_i28.SecureStorage>(),
      get<_i13.GetStorageDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i31.Web3DataSource>()));
  gh.factory<_i52.IWalletRepository>(() => _i53.WalletImplementation(
      get<_i31.Web3DataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i40.TransactionRemoteDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i21.Web3Provider>(),
      get<_i28.SecureStorage>(),
      get<_i41.AuthDataSource>()));
  gh.factory<_i54.ImportWalletUseCase>(
      () => _i54.ImportWalletUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i55.IsFirstOpenAppUseCase>(
      () => _i55.IsFirstOpenAppUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i56.IsPassCodeCreatedUseCase>(
      () => _i56.IsPassCodeCreatedUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i57.LogInUseCase>(
      () => _i57.LogInUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i58.LogOutUseCase>(
      () => _i58.LogOutUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i59.MakeFirstOpenAppUseCase>(
      () => _i59.MakeFirstOpenAppUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i60.MarketPlaceUseCase>(
      () => _i60.MarketPlaceUseCase(get<_i44.IMarketPlaceRepository>()));
  gh.factory<_i61.NftApi>(() => _i61.NftApi(get<_i9.Dio>(),
      get<_i32.AuthInterceptor>(), get<_i36.RefreshTokenInterceptor>()));
  gh.factory<_i62.OpenLuckyBoxUseCase>(
      () => _i62.OpenLuckyBoxUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i63.OpenSocketUseCase>(
      () => _i63.OpenSocketUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i64.PostHealthDataUseCase>(
      () => _i64.PostHealthDataUseCase(get<_i46.ISleepTrackingRepository>()));
  gh.factory<_i65.RemoveItemFromBedUseCase>(
      () => _i65.RemoveItemFromBedUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i66.RemoveJewelUseCase>(
      () => _i66.RemoveJewelUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i67.SendOTPMailUseCase>(
      () => _i67.SendOTPMailUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i68.SettingActiveCodeUseCase>(
      () => _i68.SettingActiveCodeUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i69.SignUpUseCase>(
      () => _i69.SignUpUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i70.SpeedUpLuckyBoxUseCase>(
      () => _i70.SpeedUpLuckyBoxUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i71.StakingInfoUseCase>(
      () => _i71.StakingInfoUseCase(get<_i48.ISpendingRepository>()));
  gh.factory<_i72.StakingUseCase>(
      () => _i72.StakingUseCase(get<_i48.ISpendingRepository>()));
  gh.factory<_i73.StartSleepTrackingUseCase>(() =>
      _i73.StartSleepTrackingUseCase(get<_i46.ISleepTrackingRepository>()));
  gh.factory<_i74.SwapTokenUseCase>(
      () => _i74.SwapTokenUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i75.ToSpendingUseCase>(() => _i75.ToSpendingUseCase(
      get<_i48.ISpendingRepository>(), get<_i52.IWalletRepository>()));
  gh.factory<_i76.TransferTokenToMainWalletUseCase>(
      () => _i76.TransferTokenToMainWalletUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i77.UnStakingUseCase>(
      () => _i77.UnStakingUseCase(get<_i48.ISpendingRepository>()));
  gh.factory<_i78.ValidateMnemonicUseCase>(
      () => _i78.ValidateMnemonicUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i79.ValidatePassCodeUseCase>(
      () => _i79.ValidatePassCodeUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i80.VerifyOTPUseCase>(
      () => _i80.VerifyOTPUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i81.WakeUpUseCase>(
      () => _i81.WakeUpUseCase(get<_i46.ISleepTrackingRepository>()));
  gh.factory<_i82.WithdrawHistoryUseCase>(
      () => _i82.WithdrawHistoryUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i83.ActivationCodeSettingUseCase>(
      () => _i83.ActivationCodeSettingUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i84.AddItemToBedUseCase>(
      () => _i84.AddItemToBedUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i85.AddJewelUseCase>(
      () => _i85.AddJewelUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i86.ApproveUseCase>(() => _i86.ApproveUseCase(
      get<_i48.ISpendingRepository>(), get<_i52.IWalletRepository>()));
  gh.factory<_i87.BedDetailUseCase>(
      () => _i87.BedDetailUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i88.BuyNFTUseCase>(
      () => _i88.BuyNFTUseCase(get<_i44.IMarketPlaceRepository>()));
  gh.factory<_i89.ChangePasswordUseCase>(
      () => _i89.ChangePasswordUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i90.CheckActivationCodeUseCase>(
      () => _i90.CheckActivationCodeUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i91.CheckApproveUseCase>(
      () => _i91.CheckApproveUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i92.CheckFirstOpenWallet>(
      () => _i92.CheckFirstOpenWallet(get<_i52.IWalletRepository>()));
  gh.factory<_i93.CompoundUseCase>(
      () => _i93.CompoundUseCase(get<_i48.ISpendingRepository>()));
  gh.factory<_i94.CreatePassCodeUseCase>(
      () => _i94.CreatePassCodeUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i95.CreatePasswordUseCase>(
      () => _i95.CreatePasswordUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i96.CreateWalletUseCase>(
      () => _i96.CreateWalletUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i97.CurrentUserUseCase>(
      () => _i97.CurrentUserUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i98.CurrentWalletUseCase>(
      () => _i98.CurrentWalletUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i99.EstimateGasWithdrawUseCase>(
      () => _i99.EstimateGasWithdrawUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i100.EstimateTrackingUseCase>(() =>
      _i100.EstimateTrackingUseCase(get<_i46.ISleepTrackingRepository>()));
  gh.factory<_i101.FetchBalanceSpendingUseCase>(
      () => _i101.FetchBalanceSpendingUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i102.FetchBedUseCase>(
      () => _i102.FetchBedUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i103.FetchDataChartUseCase>(
      () => _i103.FetchDataChartUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i104.FetchItemOwnerUseCase>(
      () => _i104.FetchItemOwnerUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i105.FetchLuckyBoxUseCase>(
      () => _i105.FetchLuckyBoxUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i106.GetAmountOutMinUseCase>(
      () => _i106.GetAmountOutMinUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i107.GetBalanceForTokensUseCase>(
      () => _i107.GetBalanceForTokensUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i108.GetBalanceTokenUseCase>(
      () => _i108.GetBalanceTokenUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i109.GetCurrentMnemonicUsecase>(
      () => _i109.GetCurrentMnemonicUsecase(get<_i52.IWalletRepository>()));
  gh.factory<_i110.GetCurrentNetworkUseCase>(
      () => _i110.GetCurrentNetworkUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i111.GetGlobalConfigUseCase>(
      () => _i111.GetGlobalConfigUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i112.GetHistoryTransactionUseCase>(
      () => _i112.GetHistoryTransactionUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i113.GetSleepResultUseCase>(
      () => _i113.GetSleepResultUseCase(get<_i46.ISleepTrackingRepository>()));
  gh.factory<_i114.GetUserStatusTrackingUseCase>(() =>
      _i114.GetUserStatusTrackingUseCase(get<_i46.ISleepTrackingRepository>()));
  gh.factory<_i115.GetUserUseCase>(
      () => _i115.GetUserUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i116.HasWalletUseCase>(
      () => _i116.HasWalletUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i117.INFTRepository>(() => _i118.NFTImplementation(
      get<_i25.NFTDataSource>(),
      get<_i61.NftApi>(),
      get<_i28.SecureStorage>(),
      get<_i41.AuthDataSource>()));
  gh.factory<_i119.IsNftApproveForAllUseCase>(
      () => _i119.IsNftApproveForAllUseCase(get<_i117.INFTRepository>()));
  gh.factory<_i120.NFTSellUseCase>(
      () => _i120.NFTSellUseCase(get<_i117.INFTRepository>()));
  gh.factory<_i121.SendNftToSpendingUseCase>(() =>
      _i121.SendNftToSpendingUseCase(
          get<_i117.INFTRepository>(), get<_i28.SecureStorage>()));
  gh.factory<_i122.SetNftApprovalForAllUseCase>(() =>
      _i122.SetNftApprovalForAllUseCase(
          get<_i117.INFTRepository>(), get<_i28.SecureStorage>()));
  gh.factory<_i123.TransferNftUseCase>(
      () => _i123.TransferNftUseCase(get<_i117.INFTRepository>()));
  gh.factory<_i124.WithdrawNFTUseCase>(
      () => _i124.WithdrawNFTUseCase(get<_i117.INFTRepository>()));
  gh.factory<_i125.EstimateNftFunctionFeeUseCase>(
      () => _i125.EstimateNftFunctionFeeUseCase(get<_i117.INFTRepository>()));
  gh.factory<_i126.GetIndividualDetailUseCase>(
      () => _i126.GetIndividualDetailUseCase(get<_i117.INFTRepository>()));
  gh.factory<_i127.GetListNftDetailUseCase>(
      () => _i127.GetListNftDetailUseCase(get<_i117.INFTRepository>()));
  gh.factory<_i128.GetNFTsBalanceUseCase>(
      () => _i128.GetNFTsBalanceUseCase(get<_i117.INFTRepository>()));
  gh.factory<_i129.GetNFTsIDsUseCase>(
      () => _i129.GetNFTsIDsUseCase(get<_i117.INFTRepository>()));
  gh.factory<_i130.GetTransactionFeeUseCase>(
      () => _i130.GetTransactionFeeUseCase(get<_i117.INFTRepository>()));
  return get;
}

class _$RPCModule extends _i31.RPCModule {}

class _$RegisterModule extends _i131.RegisterModule {}
