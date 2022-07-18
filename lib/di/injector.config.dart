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
import '../datasources/remote/nft_api/nft_api.dart' as _i64;
import '../datasources/remote/sleep_tracking_api/sleep_tracking_api.dart'
    as _i39;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i40;
import '../repository/auth_repository.dart' as _i42;
import '../repository/gacha_repository.dart' as _i44;
import '../repository/implementations/auth_implementation.dart' as _i43;
import '../repository/implementations/gacha_implementation.dart' as _i45;
import '../repository/implementations/level_up_implementation.dart' as _i126;
import '../repository/implementations/market_place_implementation.dart' as _i47;
import '../repository/implementations/mint_implementation.dart' as _i128;
import '../repository/implementations/network_connection_implementation.dart'
    as _i24;
import '../repository/implementations/nft_implementation.dart' as _i123;
import '../repository/implementations/sleep_tracking_implementation.dart'
    as _i49;
import '../repository/implementations/spending_implementation.dart' as _i51;
import '../repository/implementations/transaction_implementation.dart' as _i35;
import '../repository/implementations/user_implementations.dart' as _i53;
import '../repository/implementations/wallet_implementation.dart' as _i55;
import '../repository/level_up_repository.dart' as _i125;
import '../repository/market_place_repository.dart' as _i46;
import '../repository/mint_repository.dart' as _i127;
import '../repository/network_connection_repository.dart' as _i23;
import '../repository/nft_repository.dart' as _i122;
import '../repository/sleep_tracking_repository.dart' as _i48;
import '../repository/spending_repository.dart' as _i50;
import '../repository/transaction_repository.dart' as _i34;
import '../repository/user_repository.dart' as _i52;
import '../repository/wallet_repository.dart' as _i54;
import '../usecase/activation_code_setting_usecase.dart' as _i86;
import '../usecase/add_item_to_bed_usecase.dart' as _i87;
import '../usecase/add_jewel_usecase.dart' as _i88;
import '../usecase/approve_usecase.dart' as _i89;
import '../usecase/bed_detail_usecase.dart' as _i90;
import '../usecase/buy_nft_usecase.dart' as _i91;
import '../usecase/change_password_usecase.dart' as _i92;
import '../usecase/check_activation_code_usecase.dart' as _i93;
import '../usecase/check_approve_usecase.dart' as _i94;
import '../usecase/compound_usecase.dart' as _i96;
import '../usecase/create_pass_code_usecase.dart' as _i97;
import '../usecase/create_password_usecase.dart' as _i98;
import '../usecase/current_user_usecase.dart' as _i100;
import '../usecase/estimate_gas_withdraw.dart' as _i102;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i138;
import '../usecase/estimate_tracking_usecase.dart' as _i103;
import '../usecase/fetch_balance_spending_usecase.dart' as _i104;
import '../usecase/fetch_bed_usecase.dart' as _i105;
import '../usecase/fetch_data_chart_day_usecase.dart' as _i107;
import '../usecase/fetch_data_chart_usecase.dart' as _i106;
import '../usecase/fetch_item_owner_usecase.dart' as _i108;
import '../usecase/fetch_lucky_box_usecase.dart' as _i109;
import '../usecase/gacha_spin_usecase.dart' as _i110;
import '../usecase/get_amount_out_min_usecase.dart' as _i111;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i112;
import '../usecase/get_balance_token_usecase.dart' as _i113;
import '../usecase/get_current_network_usecase.dart' as _i115;
import '../usecase/get_global_config.dart' as _i116;
import '../usecase/get_history_transaction_usecase.dart' as _i117;
import '../usecase/get_level_up_usecase.dart' as _i139;
import '../usecase/get_list_nft_detail_usecase.dart' as _i140;
import '../usecase/get_market_place_usecase.dart' as _i63;
import '../usecase/get_minting_usecase.dart' as _i141;
import '../usecase/get_network_connection_usecase.dart' as _i33;
import '../usecase/get_nft_family_usecase.dart' as _i144;
import '../usecase/get_nfts_balance_usecase.dart' as _i142;
import '../usecase/get_nfts_ids_usecase.dart' as _i143;
import '../usecase/get_point_of_owner_usecase.dart' as _i145;
import '../usecase/get_repair_usecase.dart' as _i146;
import '../usecase/get_sleep_result_usecase.dart' as _i118;
import '../usecase/get_transaction_fee_usecase.dart' as _i147;
import '../usecase/get_user_status_tracking_usecase.dart' as _i119;
import '../usecase/get_user_usecase.dart' as _i120;
import '../usecase/has_wallet_usecase.dart' as _i121;
import '../usecase/is_first_open_app_usecase.dart' as _i57;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i124;
import '../usecase/is_passcode_created_usecase.dart' as _i58;
import '../usecase/is_token_approved_enough_usecase.dart' as _i59;
import '../usecase/is_valid_wallet_address_usecase.dart' as _i14;
import '../usecase/login_usecase.dart' as _i60;
import '../usecase/logout_usecase.dart' as _i61;
import '../usecase/make_first_open_app_usecase.dart' as _i62;
import '../usecase/minting_usecase.dart' as _i129;
import '../usecase/nft_repair_usecase.dart' as _i130;
import '../usecase/nft_sell_usecase.dart' as _i131;
import '../usecase/on_connection_changed_usecase.dart' as _i26;
import '../usecase/open_lucky_box_usecase.dart' as _i65;
import '../usecase/open_socket_usecase.dart' as _i66;
import '../usecase/post_health_data_usecase.dart' as _i67;
import '../usecase/post_level_up_usecase.dart' as _i132;
import '../usecase/remove_item_from_bed_usecase.dart' as _i68;
import '../usecase/remove_jewel_usecase.dart' as _i69;
import '../usecase/run_app_init_usecase.dart' as _i27;
import '../usecase/send_nft_to_spending_usecase.dart' as _i133;
import '../usecase/send_otp_mail_usecase.dart' as _i70;
import '../usecase/send_to_external_usecase.dart' as _i37;
import '../usecase/send_token_to_external.dart' as _i38;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i134;
import '../usecase/setting_active_code_usecase.dart' as _i71;
import '../usecase/sign_up_usecase.dart' as _i72;
import '../usecase/speed_up_lucky_box_usecase.dart' as _i73;
import '../usecase/staking_info_usecase.dart' as _i74;
import '../usecase/staking_usecase.dart' as _i75;
import '../usecase/start_sleep_tracking_usecase.dart' as _i76;
import '../usecase/swap_token_usecase.dart' as _i77;
import '../usecase/to_spending_usecase.dart' as _i78;
import '../usecase/transfer_nft_usecase.dart' as _i135;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i79;
import '../usecase/unstaking_usecase.dart' as _i80;
import '../usecase/update_attribute_usecase.dart' as _i136;
import '../usecase/validate_mnemonic.dart' as _i81;
import '../usecase/validate_passcode_usecase.dart' as _i82;
import '../usecase/verify_otp_usecase.dart' as _i83;
import '../usecase/wake_up_usecase.dart' as _i84;
import '../usecase/wallet/create_wallet_usecase.dart' as _i99;
import '../usecase/wallet/current_wallet_usecase.dart' as _i101;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i95;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i114;
import '../usecase/wallet/import_wallet_usecase.dart' as _i56;
import '../usecase/withdraw_history_usecase.dart' as _i85;
import '../usecase/withdraw_nft_usecase.dart' as _i137;
import 'register_module.dart' as _i148; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i44.IGachaRepository>(
      () => _i45.GachaImplementation(get<_i41.AuthDataSource>()));
  gh.factory<_i46.IMarketPlaceRepository>(
      () => _i47.TransactionImplementation(get<_i41.AuthDataSource>()));
  gh.factory<_i48.ISleepTrackingRepository>(
      () => _i49.SleepTrackingImplementation(get<_i39.SleepTrackingApi>()));
  gh.factory<_i50.ISpendingRepository>(() => _i51.SpendingImplementation(
      get<_i30.SpendingDataSource>(), get<_i41.AuthDataSource>()));
  gh.factory<_i52.IUserRepository>(() => _i53.UserImplementation(
      get<_i41.AuthDataSource>(),
      get<_i28.SecureStorage>(),
      get<_i13.GetStorageDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i31.Web3DataSource>()));
  gh.factory<_i54.IWalletRepository>(() => _i55.WalletImplementation(
      get<_i31.Web3DataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i40.TransactionRemoteDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i21.Web3Provider>(),
      get<_i28.SecureStorage>(),
      get<_i41.AuthDataSource>()));
  gh.factory<_i56.ImportWalletUseCase>(
      () => _i56.ImportWalletUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i57.IsFirstOpenAppUseCase>(
      () => _i57.IsFirstOpenAppUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i58.IsPassCodeCreatedUseCase>(
      () => _i58.IsPassCodeCreatedUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i59.IsTokenApprovedEnoughUseCase>(
      () => _i59.IsTokenApprovedEnoughUseCase(get<_i50.ISpendingRepository>()));
  gh.factory<_i60.LogInUseCase>(
      () => _i60.LogInUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i61.LogOutUseCase>(
      () => _i61.LogOutUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i62.MakeFirstOpenAppUseCase>(
      () => _i62.MakeFirstOpenAppUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i63.MarketPlaceUseCase>(
      () => _i63.MarketPlaceUseCase(get<_i46.IMarketPlaceRepository>()));
  gh.factory<_i64.NftApi>(() => _i64.NftApi(get<_i9.Dio>(),
      get<_i32.AuthInterceptor>(), get<_i36.RefreshTokenInterceptor>()));
  gh.factory<_i65.OpenLuckyBoxUseCase>(
      () => _i65.OpenLuckyBoxUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i66.OpenSocketUseCase>(
      () => _i66.OpenSocketUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i67.PostHealthDataUseCase>(
      () => _i67.PostHealthDataUseCase(get<_i48.ISleepTrackingRepository>()));
  gh.factory<_i68.RemoveItemFromBedUseCase>(
      () => _i68.RemoveItemFromBedUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i69.RemoveJewelUseCase>(
      () => _i69.RemoveJewelUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i70.SendOTPMailUseCase>(
      () => _i70.SendOTPMailUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i71.SettingActiveCodeUseCase>(
      () => _i71.SettingActiveCodeUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i72.SignUpUseCase>(
      () => _i72.SignUpUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i73.SpeedUpLuckyBoxUseCase>(
      () => _i73.SpeedUpLuckyBoxUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i74.StakingInfoUseCase>(
      () => _i74.StakingInfoUseCase(get<_i50.ISpendingRepository>()));
  gh.factory<_i75.StakingUseCase>(
      () => _i75.StakingUseCase(get<_i50.ISpendingRepository>()));
  gh.factory<_i76.StartSleepTrackingUseCase>(() =>
      _i76.StartSleepTrackingUseCase(get<_i48.ISleepTrackingRepository>()));
  gh.factory<_i77.SwapTokenUseCase>(
      () => _i77.SwapTokenUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i78.ToSpendingUseCase>(() => _i78.ToSpendingUseCase(
      get<_i50.ISpendingRepository>(), get<_i54.IWalletRepository>()));
  gh.factory<_i79.TransferTokenToMainWalletUseCase>(
      () => _i79.TransferTokenToMainWalletUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i80.UnStakingUseCase>(
      () => _i80.UnStakingUseCase(get<_i50.ISpendingRepository>()));
  gh.factory<_i81.ValidateMnemonicUseCase>(
      () => _i81.ValidateMnemonicUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i82.ValidatePassCodeUseCase>(
      () => _i82.ValidatePassCodeUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i83.VerifyOTPUseCase>(
      () => _i83.VerifyOTPUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i84.WakeUpUseCase>(
      () => _i84.WakeUpUseCase(get<_i48.ISleepTrackingRepository>()));
  gh.factory<_i85.WithdrawHistoryUseCase>(
      () => _i85.WithdrawHistoryUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i86.ActivationCodeSettingUseCase>(
      () => _i86.ActivationCodeSettingUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i87.AddItemToBedUseCase>(
      () => _i87.AddItemToBedUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i88.AddJewelUseCase>(
      () => _i88.AddJewelUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i89.ApproveUseCase>(() => _i89.ApproveUseCase(
      get<_i50.ISpendingRepository>(), get<_i54.IWalletRepository>()));
  gh.factory<_i90.BedDetailUseCase>(
      () => _i90.BedDetailUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i91.BuyNFTUseCase>(
      () => _i91.BuyNFTUseCase(get<_i46.IMarketPlaceRepository>()));
  gh.factory<_i92.ChangePasswordUseCase>(
      () => _i92.ChangePasswordUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i93.CheckActivationCodeUseCase>(
      () => _i93.CheckActivationCodeUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i94.CheckApproveUseCase>(
      () => _i94.CheckApproveUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i95.CheckFirstOpenWallet>(
      () => _i95.CheckFirstOpenWallet(get<_i54.IWalletRepository>()));
  gh.factory<_i96.CompoundUseCase>(
      () => _i96.CompoundUseCase(get<_i50.ISpendingRepository>()));
  gh.factory<_i97.CreatePassCodeUseCase>(
      () => _i97.CreatePassCodeUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i98.CreatePasswordUseCase>(
      () => _i98.CreatePasswordUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i99.CreateWalletUseCase>(
      () => _i99.CreateWalletUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i100.CurrentUserUseCase>(
      () => _i100.CurrentUserUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i101.CurrentWalletUseCase>(
      () => _i101.CurrentWalletUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i102.EstimateGasWithdrawUseCase>(
      () => _i102.EstimateGasWithdrawUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i103.EstimateTrackingUseCase>(() =>
      _i103.EstimateTrackingUseCase(get<_i48.ISleepTrackingRepository>()));
  gh.factory<_i104.FetchBalanceSpendingUseCase>(
      () => _i104.FetchBalanceSpendingUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i105.FetchBedUseCase>(
      () => _i105.FetchBedUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i106.FetchDataChartUseCase>(
      () => _i106.FetchDataChartUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i107.FetchDataDaysChartUseCase>(
      () => _i107.FetchDataDaysChartUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i108.FetchItemOwnerUseCase>(
      () => _i108.FetchItemOwnerUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i109.FetchLuckyBoxUseCase>(
      () => _i109.FetchLuckyBoxUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i110.GachaSpinUseCase>(
      () => _i110.GachaSpinUseCase(get<_i44.IGachaRepository>()));
  gh.factory<_i111.GetAmountOutMinUseCase>(
      () => _i111.GetAmountOutMinUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i112.GetBalanceForTokensUseCase>(
      () => _i112.GetBalanceForTokensUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i113.GetBalanceTokenUseCase>(
      () => _i113.GetBalanceTokenUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i114.GetCurrentMnemonicUsecase>(
      () => _i114.GetCurrentMnemonicUsecase(get<_i54.IWalletRepository>()));
  gh.factory<_i115.GetCurrentNetworkUseCase>(
      () => _i115.GetCurrentNetworkUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i116.GetGlobalConfigUseCase>(
      () => _i116.GetGlobalConfigUseCase(get<_i52.IUserRepository>()));
  gh.factory<_i117.GetHistoryTransactionUseCase>(
      () => _i117.GetHistoryTransactionUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i118.GetSleepResultUseCase>(
      () => _i118.GetSleepResultUseCase(get<_i48.ISleepTrackingRepository>()));
  gh.factory<_i119.GetUserStatusTrackingUseCase>(() =>
      _i119.GetUserStatusTrackingUseCase(get<_i48.ISleepTrackingRepository>()));
  gh.factory<_i120.GetUserUseCase>(
      () => _i120.GetUserUseCase(get<_i42.IAuthRepository>()));
  gh.factory<_i121.HasWalletUseCase>(
      () => _i121.HasWalletUseCase(get<_i54.IWalletRepository>()));
  gh.factory<_i122.INFTRepository>(() => _i123.NFTImplementation(
      get<_i25.NFTDataSource>(),
      get<_i64.NftApi>(),
      get<_i28.SecureStorage>(),
      get<_i41.AuthDataSource>()));
  gh.factory<_i124.IsNftApproveForAllUseCase>(() =>
      _i124.IsNftApproveForAllUseCase(
          get<_i122.INFTRepository>(), get<_i28.SecureStorage>()));
  gh.factory<_i125.LevelUpRepository>(
      () => _i126.LevelUpImplementation(get<_i64.NftApi>()));
  gh.factory<_i127.MintRepository>(
      () => _i128.MintImplementation(get<_i64.NftApi>()));
  gh.factory<_i129.MintingUseCase>(
      () => _i129.MintingUseCase(get<_i127.MintRepository>()));
  gh.factory<_i130.NFTRepairUseCase>(
      () => _i130.NFTRepairUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i131.NFTSellUseCase>(
      () => _i131.NFTSellUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i132.PostLevelUpUseCase>(
      () => _i132.PostLevelUpUseCase(get<_i125.LevelUpRepository>()));
  gh.factory<_i133.SendNftToSpendingUseCase>(() =>
      _i133.SendNftToSpendingUseCase(
          get<_i122.INFTRepository>(), get<_i28.SecureStorage>()));
  gh.factory<_i134.SetNftApprovalForAllUseCase>(() =>
      _i134.SetNftApprovalForAllUseCase(
          get<_i122.INFTRepository>(), get<_i28.SecureStorage>()));
  gh.factory<_i135.TransferNftUseCase>(
      () => _i135.TransferNftUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i136.UpdateAttributeUseCase>(
      () => _i136.UpdateAttributeUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i137.WithdrawNFTUseCase>(
      () => _i137.WithdrawNFTUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i138.EstimateNftFunctionFeeUseCase>(
      () => _i138.EstimateNftFunctionFeeUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i139.GetLevelUpUseCase>(
      () => _i139.GetLevelUpUseCase(get<_i125.LevelUpRepository>()));
  gh.factory<_i140.GetListNftDetailUseCase>(
      () => _i140.GetListNftDetailUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i141.GetMintingUseCase>(
      () => _i141.GetMintingUseCase(get<_i127.MintRepository>()));
  gh.factory<_i142.GetNFTsBalanceUseCase>(
      () => _i142.GetNFTsBalanceUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i143.GetNFTsIDsUseCase>(
      () => _i143.GetNFTsIDsUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i144.GetNftFamilyUseCase>(
      () => _i144.GetNftFamilyUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i145.GetPointOfOwnerUseCase>(
      () => _i145.GetPointOfOwnerUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i146.GetRepairUseCase>(
      () => _i146.GetRepairUseCase(get<_i122.INFTRepository>()));
  gh.factory<_i147.GetTransactionFeeUseCase>(
      () => _i147.GetTransactionFeeUseCase(get<_i122.INFTRepository>()));
  return get;
}

class _$RPCModule extends _i31.RPCModule {}

class _$RegisterModule extends _i148.RegisterModule {}
