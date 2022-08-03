// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i9;

import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:device_info_plus/device_info_plus.dart' as _i7;
import 'package:dio/dio.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i12;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i20;

import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i6;
import '../common/utils/random_utils.dart' as _i19;
import '../common/utils/toast_utils.dart' as _i21;
import '../datasources/local/get_storage_datasource.dart' as _i13;
import '../datasources/local/history_datasource.dart' as _i23;
import '../datasources/local/isar/isar_datasource.dart' as _i16;
import '../datasources/local/network_connection_datasource.dart' as _i17;
import '../datasources/local/secure_storage.dart' as _i29;
import '../datasources/local/shared_preference_datasource.dart' as _i30;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i43;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i34;
import '../datasources/remote/auth_datasource/queue_interceptor.dart' as _i18;
import '../datasources/remote/network/nft_datasource.dart' as _i26;
import '../datasources/remote/network/spending_datasource.dart' as _i31;
import '../datasources/remote/network/wallet_datasource.dart' as _i32;
import '../datasources/remote/network/web3_datasource.dart' as _i33;
import '../datasources/remote/network/web3_provider.dart' as _i22;
import '../datasources/remote/nft_api/nft_api.dart' as _i38;
import '../datasources/remote/sleep_tracking_api/sleep_tracking_api.dart'
    as _i41;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i42;
import '../repository/auth_repository.dart' as _i46;
import '../repository/gacha_repository.dart' as _i48;
import '../repository/implementations/auth_implementation.dart' as _i47;
import '../repository/implementations/gacha_implementation.dart' as _i49;
import '../repository/implementations/level_up_implementation.dart' as _i68;
import '../repository/implementations/market_place_implementation.dart' as _i51;
import '../repository/implementations/mint_implementation.dart' as _i74;
import '../repository/implementations/network_connection_implementation.dart'
    as _i25;
import '../repository/implementations/nft_implementation.dart' as _i53;
import '../repository/implementations/sleep_tracking_implementation.dart'
    as _i55;
import '../repository/implementations/spending_implementation.dart' as _i57;
import '../repository/implementations/transaction_implementation.dart' as _i37;
import '../repository/implementations/user_implementations.dart' as _i59;
import '../repository/implementations/wallet_implementation.dart' as _i61;
import '../repository/level_up_repository.dart' as _i67;
import '../repository/market_place_repository.dart' as _i50;
import '../repository/mint_repository.dart' as _i73;
import '../repository/network_connection_repository.dart' as _i24;
import '../repository/nft_repository.dart' as _i52;
import '../repository/sleep_tracking_repository.dart' as _i54;
import '../repository/spending_repository.dart' as _i56;
import '../repository/transaction_repository.dart' as _i36;
import '../repository/user_repository.dart' as _i58;
import '../repository/wallet_repository.dart' as _i60;
import '../usecase/activation_code_setting_usecase.dart' as _i109;
import '../usecase/add_item_to_bed_usecase.dart' as _i110;
import '../usecase/add_jewel_usecase.dart' as _i111;
import '../usecase/approve_trade_token_usecase.dart' as _i112;
import '../usecase/approve_usecase.dart' as _i113;
import '../usecase/bed_detail_usecase.dart' as _i114;
import '../usecase/buy_nft_usecase.dart' as _i115;
import '../usecase/cancel_sell_usecase.dart' as _i76;
import '../usecase/change_password_usecase.dart' as _i116;
import '../usecase/check_activation_code_usecase.dart' as _i117;
import '../usecase/check_allowance_usecase.dart' as _i118;
import '../usecase/compound_usecase.dart' as _i120;
import '../usecase/create_new_mnemonic_usecase.dart' as _i121;
import '../usecase/create_pass_code_usecase.dart' as _i122;
import '../usecase/create_password_usecase.dart' as _i123;
import '../usecase/current_network_explorer_usecase.dart' as _i44;
import '../usecase/current_user_usecase.dart' as _i125;
import '../usecase/estimate_gas_withdraw.dart' as _i127;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i128;
import '../usecase/estimate_token_function_fee_usecase.dart' as _i45;
import '../usecase/estimate_tracking_usecase.dart' as _i129;
import '../usecase/fetch_balance_spending_usecase.dart' as _i130;
import '../usecase/fetch_bed_box_usecase.dart' as _i10;
import '../usecase/fetch_bed_usecase.dart' as _i131;
import '../usecase/fetch_data_chart_day_usecase.dart' as _i133;
import '../usecase/fetch_data_chart_usecase.dart' as _i132;
import '../usecase/fetch_home_bed_usecase.dart' as _i134;
import '../usecase/fetch_item_owner_usecase.dart' as _i135;
import '../usecase/fetch_jewel_usecase.dart' as _i136;
import '../usecase/fetch_lucky_box_usecase.dart' as _i137;
import '../usecase/fetch_upgrade_list.dart' as _i138;
import '../usecase/gacha_get_common_usecase.dart' as _i139;
import '../usecase/gacha_get_special_usecase.dart' as _i140;
import '../usecase/gacha_history_usecase.dart' as _i141;
import '../usecase/gacha_probability_config_usecase.dart' as _i142;
import '../usecase/gacha_spin_usecase.dart' as _i143;
import '../usecase/get_amount_out_min_usecase.dart' as _i144;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i145;
import '../usecase/get_balance_token_usecase.dart' as _i146;
import '../usecase/get_current_network_usecase.dart' as _i148;
import '../usecase/get_global_config.dart' as _i149;
import '../usecase/get_history_transaction_usecase.dart' as _i150;
import '../usecase/get_level_up_usecase.dart' as _i151;
import '../usecase/get_list_nft_detail_usecase.dart' as _i152;
import '../usecase/get_list_token_usecase.dart' as _i153;
import '../usecase/get_market_place_usecase.dart' as _i72;
import '../usecase/get_minting_usecase.dart' as _i154;
import '../usecase/get_network_connection_usecase.dart' as _i35;
import '../usecase/get_nft_addresses_usecase.dart' as _i157;
import '../usecase/get_nft_family_usecase.dart' as _i158;
import '../usecase/get_nfts_balance_usecase.dart' as _i155;
import '../usecase/get_nfts_ids_usecase.dart' as _i156;
import '../usecase/get_point_of_owner_usecase.dart' as _i159;
import '../usecase/get_repair_usecase.dart' as _i160;
import '../usecase/get_sleep_result_usecase.dart' as _i161;
import '../usecase/get_slft_price_usecase.dart' as _i162;
import '../usecase/get_token_addresses_usecase.dart' as _i163;
import '../usecase/get_transaction_fee_usecase.dart' as _i164;
import '../usecase/get_user_status_tracking_usecase.dart' as _i165;
import '../usecase/get_user_usecase.dart' as _i166;
import '../usecase/has_wallet_usecase.dart' as _i167;
import '../usecase/is_first_open_app_usecase.dart' as _i63;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i64;
import '../usecase/is_passcode_created_usecase.dart' as _i65;
import '../usecase/is_token_approved_enough_usecase.dart' as _i66;
import '../usecase/is_valid_wallet_address_usecase.dart' as _i14;
import '../usecase/login_usecase.dart' as _i69;
import '../usecase/logout_usecase.dart' as _i70;
import '../usecase/make_first_open_app_usecase.dart' as _i71;
import '../usecase/minting_usecase.dart' as _i75;
import '../usecase/nft_repair_usecase.dart' as _i77;
import '../usecase/nft_sell_usecase.dart' as _i78;
import '../usecase/on_connection_changed_usecase.dart' as _i27;
import '../usecase/open_bed_box_usecase.dart' as _i79;
import '../usecase/open_lucky_box_usecase.dart' as _i80;
import '../usecase/open_socket_usecase.dart' as _i81;
import '../usecase/post_health_data_usecase.dart' as _i82;
import '../usecase/post_level_up_usecase.dart' as _i83;
import '../usecase/remove_item_from_bed_usecase.dart' as _i84;
import '../usecase/remove_jewel_usecase.dart' as _i85;
import '../usecase/run_app_init_usecase.dart' as _i28;
import '../usecase/send_nft_to_spending_usecase.dart' as _i86;
import '../usecase/send_otp_mail_usecase.dart' as _i87;
import '../usecase/send_to_external_usecase.dart' as _i39;
import '../usecase/send_token_to_external.dart' as _i40;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i88;
import '../usecase/setting_active_code_usecase.dart' as _i89;
import '../usecase/sign_up_usecase.dart' as _i90;
import '../usecase/speed_up_lucky_box_usecase.dart' as _i91;
import '../usecase/staking_info_usecase.dart' as _i92;
import '../usecase/staking_usecase.dart' as _i93;
import '../usecase/start_sleep_tracking_usecase.dart' as _i94;
import '../usecase/swap_token_usecase.dart' as _i95;
import '../usecase/to_spending_usecase.dart' as _i96;
import '../usecase/transfer_nft_usecase.dart' as _i97;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i98;
import '../usecase/unstaking_usecase.dart' as _i99;
import '../usecase/update_attribute_usecase.dart' as _i100;
import '../usecase/upgrade_info_usecase.dart' as _i101;
import '../usecase/upgrade_jewel_usecase.dart' as _i102;
import '../usecase/validate_mnemonic.dart' as _i103;
import '../usecase/validate_passcode_usecase.dart' as _i104;
import '../usecase/verify_otp_usecase.dart' as _i105;
import '../usecase/wake_up_usecase.dart' as _i106;
import '../usecase/wallet/create_wallet_usecase.dart' as _i124;
import '../usecase/wallet/current_wallet_usecase.dart' as _i126;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i119;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i147;
import '../usecase/wallet/import_wallet_usecase.dart' as _i62;
import '../usecase/withdraw_history_usecase.dart' as _i107;
import '../usecase/withdraw_nft_usecase.dart' as _i108;
import 'dev_injection.dart' as _i171;
import 'prod_injection.dart' as _i170;
import 'register_module.dart' as _i168;
import 'stg_injection.dart' as _i169;

const String _stg = 'stg';
const String _prod = 'prod';
const String _dev = 'dev';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final rPCModule = _$RPCModule();
  final registerModule = _$RegisterModule();
  final releaseInjection = _$ReleaseInjection();
  final prodInjection = _$ProdInjection();
  final devInjection = _$DevInjection();
  gh.singleton<_i3.AppFlyerCustom>(_i3.AppFlyerCustom());
  gh.factory<_i4.Client>(() => rPCModule.httpClient);
  gh.factory<_i5.Connectivity>(() => registerModule.connectivity);
  gh.factory<_i6.DateTimeUtils>(() => _i6.DateTimeUtils());
  gh.factory<_i7.DeviceInfoPlugin>(() => registerModule.deviceInfoPlugin);
  gh.factory<_i8.Dio>(() => registerModule.dio);
  await gh.factoryAsync<_i9.Directory>(() => registerModule.isarDir,
      preResolve: true);
  gh.factory<_i10.FetchBedBoxUseCase>(() => _i10.FetchBedBoxUseCase());
  gh.factory<_i11.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i12.GetStorage>(() => registerModule.getStorage);
  gh.singleton<_i13.GetStorageDataSource>(
      _i13.GetStorageDataSource(get<_i12.GetStorage>()));
  gh.factory<_i14.IsValidWalletAddressUseCase>(
      () => _i14.IsValidWalletAddressUseCase());
  await gh.factoryAsync<_i15.Isar>(
      () => registerModule.isar(get<_i9.Directory>()),
      preResolve: true);
  gh.singleton<_i16.IsarDataSource>(_i16.IsarDataSource(get<_i15.Isar>()));
  gh.factory<List<dynamic>>(() => releaseInjection.tokens,
      instanceName: 'tokens', registerFor: {_stg});
  gh.factory<List<dynamic>>(() => prodInjection.tokens,
      instanceName: 'tokens', registerFor: {_prod});
  gh.factory<List<dynamic>>(() => devInjection.tokens,
      instanceName: 'tokens', registerFor: {_dev});
  gh.factory<_i17.NetworkConnectionDataSource>(
      () => _i17.NetworkConnectionDataSource(get<_i5.Connectivity>()));
  gh.factory<_i18.QueueInterceptor>(
      () => _i18.QueueInterceptor(get<_i8.Dio>()));
  gh.factory<_i19.RandomUtils>(() => _i19.RandomUtils());
  await gh.factoryAsync<_i20.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i13.StorageKeys>(() => _i13.StorageKeys());
  gh.factory<String>(() => devInjection.baseUrl,
      instanceName: 'baseUrl', registerFor: {_dev});
  gh.factory<String>(() => devInjection.contractRouterDev,
      instanceName: 'contractRouter', registerFor: {_dev});
  gh.factory<String>(() => prodInjection.baseUrl,
      instanceName: 'baseUrl', registerFor: {_prod});
  gh.factory<String>(() => prodInjection.contractRouterDev,
      instanceName: 'contractRouter', registerFor: {_prod});
  gh.factory<String>(() => releaseInjection.baseUrl,
      instanceName: 'baseUrl', registerFor: {_stg});
  gh.factory<String>(() => releaseInjection.contractRouterDev,
      instanceName: 'contractRouter', registerFor: {_stg});
  gh.factory<_i21.ToastUtils>(() => _i21.ToastUtils());
  gh.singleton<_i22.Web3Provider>(_i22.Web3Provider(get<_i4.Client>()));
  gh.factory<_i23.HistoryDataSource>(
      () => _i23.HistoryDataSource(get<_i15.Isar>()));
  gh.factory<_i24.INetworkConnectionRepository>(() =>
      _i25.NetworkConnectionImplementation(
          get<_i17.NetworkConnectionDataSource>()));
  gh.factory<_i26.NFTDataSource>(
      () => _i26.NFTDataSource(get<_i22.Web3Provider>()));
  gh.factory<_i27.OnConnectionChangedUseCase>(() =>
      _i27.OnConnectionChangedUseCase(
          get<_i24.INetworkConnectionRepository>()));
  gh.factory<_i28.RunAppInitUseCase>(() => _i28.RunAppInitUseCase(
      get<_i22.Web3Provider>(),
      get<_i16.IsarDataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.singleton<_i29.SecureStorage>(_i29.SecureStorage(
      get<_i11.FlutterSecureStorage>(), get<_i20.SharedPreferences>()));
  gh.singleton<_i30.SharedPreferenceDataSource>(
      _i30.SharedPreferenceDataSource(get<_i20.SharedPreferences>()));
  gh.factory<_i31.SpendingDataSource>(
      () => _i31.SpendingDataSource(get<_i22.Web3Provider>()));
  gh.factory<_i32.WalletDataSource>(
      () => _i32.WalletDataSource(get<_i22.Web3Provider>()));
  gh.singleton<_i33.Web3DataSource>(
      _i33.Web3DataSource(get<_i22.Web3Provider>(), get<_i29.SecureStorage>()));
  gh.factory<_i34.AuthInterceptor>(() => _i34.AuthInterceptor(
      get<_i29.SecureStorage>(), get<_i8.Dio>(), get<_i7.DeviceInfoPlugin>()));
  gh.factory<_i35.GetNetworkConnectionUseCase>(() =>
      _i35.GetNetworkConnectionUseCase(
          get<_i24.INetworkConnectionRepository>()));
  gh.factory<_i36.ITransactionRepository>(() => _i37.TransactionImplementation(
      get<_i33.Web3DataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i23.HistoryDataSource>(),
      get<_i29.SecureStorage>()));
  gh.factory<_i38.NftApi>(() => _i38.NftApi(
      get<_i8.Dio>(),
      get<_i34.AuthInterceptor>(),
      get<_i18.QueueInterceptor>(),
      get<String>(instanceName: 'baseUrl')));
  gh.factory<_i39.SendToExternalUseCase>(
      () => _i39.SendToExternalUseCase(get<_i36.ITransactionRepository>()));
  gh.factory<_i40.SendTokenToExternalUseCase>(() =>
      _i40.SendTokenToExternalUseCase(get<_i36.ITransactionRepository>()));
  gh.factory<_i41.SleepTrackingApi>(() => _i41.SleepTrackingApi(
      get<_i8.Dio>(),
      get<_i34.AuthInterceptor>(),
      get<_i18.QueueInterceptor>(),
      get<String>(instanceName: 'baseUrl')));
  gh.factory<_i42.TransactionRemoteDataSource>(() =>
      _i42.TransactionRemoteDataSource(
          get<_i23.HistoryDataSource>(),
          get<_i33.Web3DataSource>(),
          get<_i13.GetStorageDataSource>(),
          get<_i16.IsarDataSource>(),
          get<_i8.Dio>()));
  gh.factory<_i43.AuthDataSource>(() => _i43.AuthDataSource(
      get<_i8.Dio>(),
      get<_i34.AuthInterceptor>(),
      get<_i18.QueueInterceptor>(),
      get<String>(instanceName: 'baseUrl')));
  gh.factory<_i44.CurrentNetworkExplorerUseCase>(() =>
      _i44.CurrentNetworkExplorerUseCase(get<_i36.ITransactionRepository>()));
  gh.factory<_i45.EstimateTokenFunctionFeeUseCase>(() =>
      _i45.EstimateTokenFunctionFeeUseCase(get<_i36.ITransactionRepository>()));
  gh.factory<_i46.IAuthRepository>(() => _i47.AuthImplementation(
      get<_i29.SecureStorage>(),
      get<_i43.AuthDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i13.GetStorageDataSource>()));
  gh.factory<_i48.IGachaRepository>(
      () => _i49.GachaImplementation(get<_i43.AuthDataSource>()));
  gh.factory<_i50.IMarketPlaceRepository>(
      () => _i51.TransactionImplementation(get<_i43.AuthDataSource>()));
  gh.factory<_i52.INFTRepository>(() => _i53.NFTImplementation(
      get<_i26.NFTDataSource>(),
      get<_i38.NftApi>(),
      get<_i29.SecureStorage>(),
      get<_i43.AuthDataSource>()));
  gh.factory<_i54.ISleepTrackingRepository>(
      () => _i55.SleepTrackingImplementation(get<_i41.SleepTrackingApi>()));
  gh.factory<_i56.ISpendingRepository>(() => _i57.SpendingImplementation(
      get<_i31.SpendingDataSource>(),
      get<_i43.AuthDataSource>(),
      get<_i29.SecureStorage>(),
      get<_i13.GetStorageDataSource>(),
      get<_i23.HistoryDataSource>()));
  gh.factory<_i58.IUserRepository>(() => _i59.UserImplementation(
      get<_i43.AuthDataSource>(),
      get<_i29.SecureStorage>(),
      get<_i13.GetStorageDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i33.Web3DataSource>()));
  gh.factory<_i60.IWalletRepository>(() => _i61.WalletImplementation(
      get<_i33.Web3DataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i42.TransactionRemoteDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i22.Web3Provider>(),
      get<_i29.SecureStorage>(),
      get<_i43.AuthDataSource>()));
  gh.factory<_i62.ImportWalletUseCase>(
      () => _i62.ImportWalletUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i63.IsFirstOpenAppUseCase>(
      () => _i63.IsFirstOpenAppUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i64.IsNftApproveForAllUseCase>(() =>
      _i64.IsNftApproveForAllUseCase(
          get<_i52.INFTRepository>(), get<_i29.SecureStorage>()));
  gh.factory<_i65.IsPassCodeCreatedUseCase>(
      () => _i65.IsPassCodeCreatedUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i66.IsTokenApprovedEnoughUseCase>(
      () => _i66.IsTokenApprovedEnoughUseCase(get<_i56.ISpendingRepository>()));
  gh.factory<_i67.LevelUpRepository>(
      () => _i68.LevelUpImplementation(get<_i38.NftApi>()));
  gh.factory<_i69.LogInUseCase>(
      () => _i69.LogInUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i70.LogOutUseCase>(
      () => _i70.LogOutUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i71.MakeFirstOpenAppUseCase>(
      () => _i71.MakeFirstOpenAppUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i72.MarketPlaceUseCase>(
      () => _i72.MarketPlaceUseCase(get<_i50.IMarketPlaceRepository>()));
  gh.factory<_i73.MintRepository>(
      () => _i74.MintImplementation(get<_i38.NftApi>()));
  gh.factory<_i75.MintingUseCase>(
      () => _i75.MintingUseCase(get<_i73.MintRepository>()));
  gh.factory<_i76.NFTCancelSellUseCase>(
      () => _i76.NFTCancelSellUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i77.NFTRepairUseCase>(
      () => _i77.NFTRepairUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i78.NFTSellUseCase>(
      () => _i78.NFTSellUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i79.OpenBedBoxUseCase>(
      () => _i79.OpenBedBoxUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i80.OpenLuckyBoxUseCase>(
      () => _i80.OpenLuckyBoxUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i81.OpenSocketUseCase>(
      () => _i81.OpenSocketUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i82.PostHealthDataUseCase>(
      () => _i82.PostHealthDataUseCase(get<_i54.ISleepTrackingRepository>()));
  gh.factory<_i83.PostLevelUpUseCase>(
      () => _i83.PostLevelUpUseCase(get<_i67.LevelUpRepository>()));
  gh.factory<_i84.RemoveItemFromBedUseCase>(
      () => _i84.RemoveItemFromBedUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i85.RemoveJewelUseCase>(
      () => _i85.RemoveJewelUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i86.SendNftToSpendingUseCase>(() => _i86.SendNftToSpendingUseCase(
      get<_i52.INFTRepository>(), get<_i29.SecureStorage>()));
  gh.factory<_i87.SendOTPMailUseCase>(
      () => _i87.SendOTPMailUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i88.SetNftApprovalForAllUseCase>(() =>
      _i88.SetNftApprovalForAllUseCase(
          get<_i52.INFTRepository>(), get<_i29.SecureStorage>()));
  gh.factory<_i89.SettingActiveCodeUseCase>(
      () => _i89.SettingActiveCodeUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i90.SignUpUseCase>(
      () => _i90.SignUpUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i91.SpeedUpLuckyBoxUseCase>(
      () => _i91.SpeedUpLuckyBoxUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i92.StakingInfoUseCase>(
      () => _i92.StakingInfoUseCase(get<_i56.ISpendingRepository>()));
  gh.factory<_i93.StakingUseCase>(
      () => _i93.StakingUseCase(get<_i56.ISpendingRepository>()));
  gh.factory<_i94.StartSleepTrackingUseCase>(() =>
      _i94.StartSleepTrackingUseCase(get<_i54.ISleepTrackingRepository>()));
  gh.factory<_i95.SwapTokenUseCase>(
      () => _i95.SwapTokenUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i96.ToSpendingUseCase>(() => _i96.ToSpendingUseCase(
      get<_i56.ISpendingRepository>(), get<_i60.IWalletRepository>()));
  gh.factory<_i97.TransferNftUseCase>(
      () => _i97.TransferNftUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i98.TransferTokenToMainWalletUseCase>(
      () => _i98.TransferTokenToMainWalletUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i99.UnStakingUseCase>(
      () => _i99.UnStakingUseCase(get<_i56.ISpendingRepository>()));
  gh.factory<_i100.UpdateAttributeUseCase>(
      () => _i100.UpdateAttributeUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i101.UpgradeInfoUseCase>(
      () => _i101.UpgradeInfoUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i102.UpgradeUseCase>(
      () => _i102.UpgradeUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i103.ValidateMnemonicUseCase>(
      () => _i103.ValidateMnemonicUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i104.ValidatePassCodeUseCase>(
      () => _i104.ValidatePassCodeUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i105.VerifyOTPUseCase>(
      () => _i105.VerifyOTPUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i106.WakeUpUseCase>(
      () => _i106.WakeUpUseCase(get<_i54.ISleepTrackingRepository>()));
  gh.factory<_i107.WithdrawHistoryUseCase>(
      () => _i107.WithdrawHistoryUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i108.WithdrawNFTUseCase>(
      () => _i108.WithdrawNFTUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i109.ActivationCodeSettingUseCase>(
      () => _i109.ActivationCodeSettingUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i110.AddItemToBedUseCase>(
      () => _i110.AddItemToBedUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i111.AddJewelUseCase>(
      () => _i111.AddJewelUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i112.ApproveTradeTokenUseCase>(
      () => _i112.ApproveTradeTokenUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i113.ApproveUseCase>(() => _i113.ApproveUseCase(
      get<_i56.ISpendingRepository>(), get<_i60.IWalletRepository>()));
  gh.factory<_i114.BedDetailUseCase>(
      () => _i114.BedDetailUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i115.BuyNFTUseCase>(
      () => _i115.BuyNFTUseCase(get<_i50.IMarketPlaceRepository>()));
  gh.factory<_i116.ChangePasswordUseCase>(
      () => _i116.ChangePasswordUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i117.CheckActivationCodeUseCase>(
      () => _i117.CheckActivationCodeUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i118.CheckAllowanceUseCase>(
      () => _i118.CheckAllowanceUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i119.CheckFirstOpenWallet>(
      () => _i119.CheckFirstOpenWallet(get<_i60.IWalletRepository>()));
  gh.factory<_i120.CompoundUseCase>(
      () => _i120.CompoundUseCase(get<_i56.ISpendingRepository>()));
  gh.factory<_i121.CreateNewMnemonicUseCase>(
      () => _i121.CreateNewMnemonicUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i122.CreatePassCodeUseCase>(
      () => _i122.CreatePassCodeUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i123.CreatePasswordUseCase>(
      () => _i123.CreatePasswordUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i124.CreateWalletUseCase>(
      () => _i124.CreateWalletUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i125.CurrentUserUseCase>(
      () => _i125.CurrentUserUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i126.CurrentWalletUseCase>(
      () => _i126.CurrentWalletUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i127.EstimateGasWithdrawUseCase>(
      () => _i127.EstimateGasWithdrawUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i128.EstimateNftFunctionFeeUseCase>(
      () => _i128.EstimateNftFunctionFeeUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i129.EstimateTrackingUseCase>(() =>
      _i129.EstimateTrackingUseCase(get<_i54.ISleepTrackingRepository>()));
  gh.factory<_i130.FetchBalanceSpendingUseCase>(
      () => _i130.FetchBalanceSpendingUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i131.FetchBedUseCase>(
      () => _i131.FetchBedUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i132.FetchDataChartUseCase>(
      () => _i132.FetchDataChartUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i133.FetchDataDaysChartUseCase>(
      () => _i133.FetchDataDaysChartUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i134.FetchHomeBedUseCase>(
      () => _i134.FetchHomeBedUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i135.FetchItemOwnerUseCase>(
      () => _i135.FetchItemOwnerUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i136.FetchJewelUseCase>(
      () => _i136.FetchJewelUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i137.FetchLuckyBoxUseCase>(
      () => _i137.FetchLuckyBoxUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i138.FetchUpgradeListUseCase>(
      () => _i138.FetchUpgradeListUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i139.GachaGetCommonUseCase>(
      () => _i139.GachaGetCommonUseCase(get<_i48.IGachaRepository>()));
  gh.factory<_i140.GachaGetSpecialUseCase>(
      () => _i140.GachaGetSpecialUseCase(get<_i48.IGachaRepository>()));
  gh.factory<_i141.GachaHistoryUseCase>(
      () => _i141.GachaHistoryUseCase(get<_i48.IGachaRepository>()));
  gh.factory<_i142.GachaProbabilityConfigUseCase>(
      () => _i142.GachaProbabilityConfigUseCase(get<_i48.IGachaRepository>()));
  gh.factory<_i143.GachaSpinUseCase>(
      () => _i143.GachaSpinUseCase(get<_i48.IGachaRepository>()));
  gh.factory<_i144.GetAmountOutMinUseCase>(
      () => _i144.GetAmountOutMinUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i145.GetBalanceForTokensUseCase>(
      () => _i145.GetBalanceForTokensUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i146.GetBalanceTokenUseCase>(
      () => _i146.GetBalanceTokenUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i147.GetCurrentMnemonicUsecase>(
      () => _i147.GetCurrentMnemonicUsecase(get<_i60.IWalletRepository>()));
  gh.factory<_i148.GetCurrentNetworkUseCase>(
      () => _i148.GetCurrentNetworkUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i149.GetGlobalConfigUseCase>(
      () => _i149.GetGlobalConfigUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i150.GetHistoryTransactionUseCase>(
      () => _i150.GetHistoryTransactionUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i151.GetLevelUpUseCase>(
      () => _i151.GetLevelUpUseCase(get<_i67.LevelUpRepository>()));
  gh.factory<_i152.GetListNftDetailUseCase>(
      () => _i152.GetListNftDetailUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i153.GetListTokenUseCase>(
      () => _i153.GetListTokenUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i154.GetMintingUseCase>(
      () => _i154.GetMintingUseCase(get<_i73.MintRepository>()));
  gh.factory<_i155.GetNFTsBalanceUseCase>(
      () => _i155.GetNFTsBalanceUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i156.GetNFTsIDsUseCase>(
      () => _i156.GetNFTsIDsUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i157.GetNftAddressesUseCase>(
      () => _i157.GetNftAddressesUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i158.GetNftFamilyUseCase>(
      () => _i158.GetNftFamilyUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i159.GetPointOfOwnerUseCase>(
      () => _i159.GetPointOfOwnerUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i160.GetRepairUseCase>(
      () => _i160.GetRepairUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i161.GetSleepResultUseCase>(
      () => _i161.GetSleepResultUseCase(get<_i54.ISleepTrackingRepository>()));
  gh.factory<_i162.GetSlftPriceUseCase>(
      () => _i162.GetSlftPriceUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i163.GetTokenAddressesUseCase>(
      () => _i163.GetTokenAddressesUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i164.GetTransactionFeeUseCase>(
      () => _i164.GetTransactionFeeUseCase(get<_i52.INFTRepository>()));
  gh.factory<_i165.GetUserStatusTrackingUseCase>(() =>
      _i165.GetUserStatusTrackingUseCase(get<_i54.ISleepTrackingRepository>()));
  gh.factory<_i166.GetUserUseCase>(
      () => _i166.GetUserUseCase(get<_i46.IAuthRepository>()));
  gh.factory<_i167.HasWalletUseCase>(
      () => _i167.HasWalletUseCase(get<_i60.IWalletRepository>()));
  return get;
}

class _$RPCModule extends _i33.RPCModule {}

class _$RegisterModule extends _i168.RegisterModule {}

class _$ReleaseInjection extends _i169.ReleaseInjection {}

class _$ProdInjection extends _i170.ProdInjection {}

class _$DevInjection extends _i171.DevInjection {}
