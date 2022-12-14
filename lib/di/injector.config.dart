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
import 'package:package_info_plus/package_info_plus.dart' as _i18;
import 'package:shared_preferences/shared_preferences.dart' as _i21;

import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i6;
import '../common/utils/random_utils.dart' as _i20;
import '../common/utils/toast_utils.dart' as _i22;
import '../datasources/local/get_storage_datasource.dart' as _i13;
import '../datasources/local/history_datasource.dart' as _i24;
import '../datasources/local/isar/isar_datasource.dart' as _i16;
import '../datasources/local/network_connection_datasource.dart' as _i17;
import '../datasources/local/secure_storage.dart' as _i30;
import '../datasources/local/shared_preference_datasource.dart' as _i31;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i44;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i35;
import '../datasources/remote/auth_datasource/queue_interceptor.dart' as _i19;
import '../datasources/remote/network/nft_datasource.dart' as _i27;
import '../datasources/remote/network/spending_datasource.dart' as _i32;
import '../datasources/remote/network/wallet_datasource.dart' as _i33;
import '../datasources/remote/network/web3_datasource.dart' as _i34;
import '../datasources/remote/network/web3_provider.dart' as _i23;
import '../datasources/remote/nft_api/nft_api.dart' as _i39;
import '../datasources/remote/sleep_tracking_api/sleep_tracking_api.dart'
    as _i42;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i43;
import '../repository/auth_repository.dart' as _i48;
import '../repository/gacha_repository.dart' as _i50;
import '../repository/implementations/auth_implementation.dart' as _i49;
import '../repository/implementations/gacha_implementation.dart' as _i51;
import '../repository/implementations/level_up_implementation.dart' as _i70;
import '../repository/implementations/market_place_implementation.dart' as _i53;
import '../repository/implementations/mint_implementation.dart' as _i76;
import '../repository/implementations/network_connection_implementation.dart'
    as _i26;
import '../repository/implementations/nft_implementation.dart' as _i55;
import '../repository/implementations/sleep_tracking_implementation.dart'
    as _i57;
import '../repository/implementations/spending_implementation.dart' as _i59;
import '../repository/implementations/transaction_implementation.dart' as _i38;
import '../repository/implementations/user_implementations.dart' as _i61;
import '../repository/implementations/wallet_implementation.dart' as _i63;
import '../repository/level_up_repository.dart' as _i69;
import '../repository/market_place_repository.dart' as _i52;
import '../repository/mint_repository.dart' as _i75;
import '../repository/network_connection_repository.dart' as _i25;
import '../repository/nft_repository.dart' as _i54;
import '../repository/sleep_tracking_repository.dart' as _i56;
import '../repository/spending_repository.dart' as _i58;
import '../repository/transaction_repository.dart' as _i37;
import '../repository/user_repository.dart' as _i60;
import '../repository/wallet_repository.dart' as _i62;
import '../usecase/activation_code_setting_usecase.dart' as _i111;
import '../usecase/add_item_to_bed_usecase.dart' as _i112;
import '../usecase/add_jewel_usecase.dart' as _i113;
import '../usecase/approve_trade_token_usecase.dart' as _i114;
import '../usecase/approve_usecase.dart' as _i115;
import '../usecase/bed_detail_usecase.dart' as _i116;
import '../usecase/buy_nft_usecase.dart' as _i117;
import '../usecase/cancel_sell_usecase.dart' as _i78;
import '../usecase/change_password_usecase.dart' as _i118;
import '../usecase/check_activation_code_usecase.dart' as _i119;
import '../usecase/check_allowance_usecase.dart' as _i120;
import '../usecase/compound_usecase.dart' as _i122;
import '../usecase/create_new_mnemonic_usecase.dart' as _i123;
import '../usecase/create_pass_code_usecase.dart' as _i124;
import '../usecase/create_password_usecase.dart' as _i125;
import '../usecase/current_network_explorer_usecase.dart' as _i45;
import '../usecase/current_user_usecase.dart' as _i127;
import '../usecase/estimate_gas_deposit_usecase.dart' as _i129;
import '../usecase/estimate_gas_withdraw.dart' as _i130;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i131;
import '../usecase/estimate_token_function_fee_usecase.dart' as _i46;
import '../usecase/estimate_tracking_usecase.dart' as _i132;
import '../usecase/estimate_trade_token_usecase.dart' as _i47;
import '../usecase/fetch_balance_spending_usecase.dart' as _i133;
import '../usecase/fetch_bed_box_usecase.dart' as _i10;
import '../usecase/fetch_bed_usecase.dart' as _i134;
import '../usecase/fetch_data_chart_day_usecase.dart' as _i136;
import '../usecase/fetch_data_chart_usecase.dart' as _i135;
import '../usecase/fetch_home_bed_usecase.dart' as _i137;
import '../usecase/fetch_item_owner_usecase.dart' as _i138;
import '../usecase/fetch_jewel_usecase.dart' as _i139;
import '../usecase/fetch_lucky_box_usecase.dart' as _i140;
import '../usecase/fetch_upgrade_list.dart' as _i141;
import '../usecase/gacha_get_common_usecase.dart' as _i142;
import '../usecase/gacha_get_special_usecase.dart' as _i143;
import '../usecase/gacha_history_usecase.dart' as _i144;
import '../usecase/gacha_probability_config_usecase.dart' as _i145;
import '../usecase/gacha_spin_usecase.dart' as _i146;
import '../usecase/get_amount_out_min_usecase.dart' as _i147;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i148;
import '../usecase/get_balance_token_usecase.dart' as _i149;
import '../usecase/get_current_network_usecase.dart' as _i151;
import '../usecase/get_global_config.dart' as _i152;
import '../usecase/get_history_transaction_usecase.dart' as _i153;
import '../usecase/get_level_up_usecase.dart' as _i154;
import '../usecase/get_list_nft_detail_usecase.dart' as _i155;
import '../usecase/get_list_token_usecase.dart' as _i156;
import '../usecase/get_market_place_usecase.dart' as _i74;
import '../usecase/get_minting_usecase.dart' as _i157;
import '../usecase/get_network_connection_usecase.dart' as _i36;
import '../usecase/get_nft_addresses_usecase.dart' as _i160;
import '../usecase/get_nft_family_usecase.dart' as _i161;
import '../usecase/get_nfts_balance_usecase.dart' as _i158;
import '../usecase/get_nfts_ids_usecase.dart' as _i159;
import '../usecase/get_point_of_owner_usecase.dart' as _i162;
import '../usecase/get_repair_usecase.dart' as _i163;
import '../usecase/get_sleep_result_usecase.dart' as _i164;
import '../usecase/get_slft_price_usecase.dart' as _i165;
import '../usecase/get_token_addresses_usecase.dart' as _i166;
import '../usecase/get_transaction_fee_usecase.dart' as _i167;
import '../usecase/get_user_status_tracking_usecase.dart' as _i168;
import '../usecase/get_user_usecase.dart' as _i169;
import '../usecase/has_wallet_usecase.dart' as _i170;
import '../usecase/is_first_open_app_usecase.dart' as _i65;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i66;
import '../usecase/is_passcode_created_usecase.dart' as _i67;
import '../usecase/is_token_approved_enough_usecase.dart' as _i68;
import '../usecase/is_valid_wallet_address_usecase.dart' as _i14;
import '../usecase/login_usecase.dart' as _i71;
import '../usecase/logout_usecase.dart' as _i72;
import '../usecase/make_first_open_app_usecase.dart' as _i73;
import '../usecase/minting_usecase.dart' as _i77;
import '../usecase/nft_repair_usecase.dart' as _i79;
import '../usecase/nft_sell_usecase.dart' as _i80;
import '../usecase/on_connection_changed_usecase.dart' as _i28;
import '../usecase/open_bed_box_usecase.dart' as _i81;
import '../usecase/open_lucky_box_usecase.dart' as _i82;
import '../usecase/open_socket_usecase.dart' as _i83;
import '../usecase/post_health_data_usecase.dart' as _i84;
import '../usecase/post_level_up_usecase.dart' as _i85;
import '../usecase/remove_item_from_bed_usecase.dart' as _i86;
import '../usecase/remove_jewel_usecase.dart' as _i87;
import '../usecase/run_app_init_usecase.dart' as _i29;
import '../usecase/send_nft_to_spending_usecase.dart' as _i88;
import '../usecase/send_otp_mail_usecase.dart' as _i89;
import '../usecase/send_to_external_usecase.dart' as _i40;
import '../usecase/send_token_to_external.dart' as _i41;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i90;
import '../usecase/setting_active_code_usecase.dart' as _i91;
import '../usecase/sign_up_usecase.dart' as _i92;
import '../usecase/speed_up_lucky_box_usecase.dart' as _i93;
import '../usecase/staking_info_usecase.dart' as _i94;
import '../usecase/staking_usecase.dart' as _i95;
import '../usecase/start_sleep_tracking_usecase.dart' as _i96;
import '../usecase/swap_token_usecase.dart' as _i97;
import '../usecase/to_spending_usecase.dart' as _i98;
import '../usecase/transfer_nft_usecase.dart' as _i99;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i100;
import '../usecase/unstaking_usecase.dart' as _i101;
import '../usecase/update_attribute_usecase.dart' as _i102;
import '../usecase/upgrade_info_usecase.dart' as _i103;
import '../usecase/upgrade_jewel_usecase.dart' as _i104;
import '../usecase/validate_mnemonic.dart' as _i105;
import '../usecase/validate_passcode_usecase.dart' as _i106;
import '../usecase/verify_otp_usecase.dart' as _i107;
import '../usecase/wake_up_usecase.dart' as _i108;
import '../usecase/wallet/create_wallet_usecase.dart' as _i126;
import '../usecase/wallet/current_wallet_usecase.dart' as _i128;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i121;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i150;
import '../usecase/wallet/import_wallet_usecase.dart' as _i64;
import '../usecase/withdraw_history_usecase.dart' as _i109;
import '../usecase/withdraw_nft_usecase.dart' as _i110;
import 'dev_injection.dart' as _i172;
import 'prod_injection.dart' as _i174;
import 'register_module.dart' as _i171;
import 'stg_injection.dart' as _i173;

const String _dev = 'dev';
const String _stg = 'stg';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final rPCModule = _$RPCModule();
  final registerModule = _$RegisterModule();
  final devInjection = _$DevInjection();
  final releaseInjection = _$ReleaseInjection();
  final prodInjection = _$ProdInjection();
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
  gh.factory<List<dynamic>>(() => devInjection.tokens,
      instanceName: 'tokens', registerFor: {_dev});
  gh.factory<List<dynamic>>(() => releaseInjection.tokens,
      instanceName: 'tokens', registerFor: {_stg});
  gh.factory<List<dynamic>>(() => prodInjection.tokens,
      instanceName: 'tokens', registerFor: {_prod});
  gh.factory<_i17.NetworkConnectionDataSource>(
      () => _i17.NetworkConnectionDataSource(get<_i5.Connectivity>()));
  await gh.factoryAsync<_i18.PackageInfo>(() => registerModule.packageInfo,
      preResolve: true);
  gh.factory<_i19.QueueInterceptor>(
      () => _i19.QueueInterceptor(get<_i8.Dio>()));
  gh.factory<_i20.RandomUtils>(() => _i20.RandomUtils());
  await gh.factoryAsync<_i21.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i13.StorageKeys>(() => _i13.StorageKeys());
  gh.factory<String>(() => prodInjection.baseUrl,
      instanceName: 'baseUrl', registerFor: {_prod});
  gh.factory<String>(() => devInjection.baseUrl,
      instanceName: 'baseUrl', registerFor: {_dev});
  gh.factory<String>(() => prodInjection.contractRouterDev,
      instanceName: 'contractRouter', registerFor: {_prod});
  gh.factory<String>(() => devInjection.contractRouterDev,
      instanceName: 'contractRouter', registerFor: {_dev});
  gh.factory<String>(() => releaseInjection.baseUrl,
      instanceName: 'baseUrl', registerFor: {_stg});
  gh.factory<String>(() => releaseInjection.contractRouterDev,
      instanceName: 'contractRouter', registerFor: {_stg});
  gh.factory<_i22.ToastUtils>(() => _i22.ToastUtils());
  gh.singleton<_i23.Web3Provider>(_i23.Web3Provider(get<_i4.Client>()));
  gh.factory<_i24.HistoryDataSource>(
      () => _i24.HistoryDataSource(get<_i15.Isar>()));
  gh.factory<_i25.INetworkConnectionRepository>(() =>
      _i26.NetworkConnectionImplementation(
          get<_i17.NetworkConnectionDataSource>()));
  gh.factory<_i27.NFTDataSource>(
      () => _i27.NFTDataSource(get<_i23.Web3Provider>()));
  gh.factory<_i28.OnConnectionChangedUseCase>(() =>
      _i28.OnConnectionChangedUseCase(
          get<_i25.INetworkConnectionRepository>()));
  gh.factory<_i29.RunAppInitUseCase>(() => _i29.RunAppInitUseCase(
      get<_i23.Web3Provider>(),
      get<_i16.IsarDataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.singleton<_i30.SecureStorage>(_i30.SecureStorage(
      get<_i11.FlutterSecureStorage>(), get<_i21.SharedPreferences>()));
  gh.singleton<_i31.SharedPreferenceDataSource>(
      _i31.SharedPreferenceDataSource(get<_i21.SharedPreferences>()));
  gh.factory<_i32.SpendingDataSource>(
      () => _i32.SpendingDataSource(get<_i23.Web3Provider>()));
  gh.factory<_i33.WalletDataSource>(
      () => _i33.WalletDataSource(get<_i23.Web3Provider>()));
  gh.singleton<_i34.Web3DataSource>(
      _i34.Web3DataSource(get<_i23.Web3Provider>(), get<_i30.SecureStorage>()));
  gh.factory<_i35.AuthInterceptor>(() => _i35.AuthInterceptor(
      get<_i30.SecureStorage>(), get<_i8.Dio>(), get<_i7.DeviceInfoPlugin>()));
  gh.factory<_i36.GetNetworkConnectionUseCase>(() =>
      _i36.GetNetworkConnectionUseCase(
          get<_i25.INetworkConnectionRepository>()));
  gh.factory<_i37.ITransactionRepository>(() => _i38.TransactionImplementation(
      get<_i34.Web3DataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i24.HistoryDataSource>(),
      get<_i30.SecureStorage>()));
  gh.factory<_i39.NftApi>(() => _i39.NftApi(
      get<_i8.Dio>(),
      get<_i35.AuthInterceptor>(),
      get<_i19.QueueInterceptor>(),
      get<String>(instanceName: 'baseUrl')));
  gh.factory<_i40.SendToExternalUseCase>(
      () => _i40.SendToExternalUseCase(get<_i37.ITransactionRepository>()));
  gh.factory<_i41.SendTokenToExternalUseCase>(() =>
      _i41.SendTokenToExternalUseCase(get<_i37.ITransactionRepository>()));
  gh.factory<_i42.SleepTrackingApi>(() => _i42.SleepTrackingApi(
      get<_i8.Dio>(),
      get<_i35.AuthInterceptor>(),
      get<_i19.QueueInterceptor>(),
      get<String>(instanceName: 'baseUrl')));
  gh.factory<_i43.TransactionRemoteDataSource>(() =>
      _i43.TransactionRemoteDataSource(
          get<_i24.HistoryDataSource>(),
          get<_i34.Web3DataSource>(),
          get<_i13.GetStorageDataSource>(),
          get<_i16.IsarDataSource>(),
          get<_i8.Dio>()));
  gh.factory<_i44.AuthDataSource>(() => _i44.AuthDataSource(
      get<_i8.Dio>(),
      get<_i35.AuthInterceptor>(),
      get<_i19.QueueInterceptor>(),
      get<String>(instanceName: 'baseUrl')));
  gh.factory<_i45.CurrentNetworkExplorerUseCase>(() =>
      _i45.CurrentNetworkExplorerUseCase(get<_i37.ITransactionRepository>()));
  gh.factory<_i46.EstimateTokenFunctionFeeUseCase>(() =>
      _i46.EstimateTokenFunctionFeeUseCase(get<_i37.ITransactionRepository>()));
  gh.factory<_i47.EstimateTradeTokenUseCase>(
      () => _i47.EstimateTradeTokenUseCase(get<_i37.ITransactionRepository>()));
  gh.factory<_i48.IAuthRepository>(() => _i49.AuthImplementation(
      get<_i30.SecureStorage>(),
      get<_i44.AuthDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i13.GetStorageDataSource>()));
  gh.factory<_i50.IGachaRepository>(
      () => _i51.GachaImplementation(get<_i44.AuthDataSource>()));
  gh.factory<_i52.IMarketPlaceRepository>(
      () => _i53.TransactionImplementation(get<_i44.AuthDataSource>()));
  gh.factory<_i54.INFTRepository>(() => _i55.NFTImplementation(
      get<_i27.NFTDataSource>(),
      get<_i39.NftApi>(),
      get<_i30.SecureStorage>(),
      get<_i44.AuthDataSource>()));
  gh.factory<_i56.ISleepTrackingRepository>(
      () => _i57.SleepTrackingImplementation(get<_i42.SleepTrackingApi>()));
  gh.factory<_i58.ISpendingRepository>(() => _i59.SpendingImplementation(
      get<_i32.SpendingDataSource>(),
      get<_i44.AuthDataSource>(),
      get<_i30.SecureStorage>(),
      get<_i13.GetStorageDataSource>(),
      get<_i24.HistoryDataSource>(),
      get<_i16.IsarDataSource>()));
  gh.factory<_i60.IUserRepository>(() => _i61.UserImplementation(
      get<_i44.AuthDataSource>(),
      get<_i30.SecureStorage>(),
      get<_i13.GetStorageDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i34.Web3DataSource>()));
  gh.factory<_i62.IWalletRepository>(() => _i63.WalletImplementation(
      get<_i34.Web3DataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i43.TransactionRemoteDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i23.Web3Provider>(),
      get<_i30.SecureStorage>(),
      get<_i44.AuthDataSource>()));
  gh.factory<_i64.ImportWalletUseCase>(
      () => _i64.ImportWalletUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i65.IsFirstOpenAppUseCase>(
      () => _i65.IsFirstOpenAppUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i66.IsNftApproveForAllUseCase>(() =>
      _i66.IsNftApproveForAllUseCase(
          get<_i54.INFTRepository>(), get<_i30.SecureStorage>()));
  gh.factory<_i67.IsPassCodeCreatedUseCase>(
      () => _i67.IsPassCodeCreatedUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i68.IsTokenApprovedEnoughUseCase>(
      () => _i68.IsTokenApprovedEnoughUseCase(get<_i58.ISpendingRepository>()));
  gh.factory<_i69.LevelUpRepository>(
      () => _i70.LevelUpImplementation(get<_i39.NftApi>()));
  gh.factory<_i71.LogInUseCase>(
      () => _i71.LogInUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i72.LogOutUseCase>(
      () => _i72.LogOutUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i73.MakeFirstOpenAppUseCase>(
      () => _i73.MakeFirstOpenAppUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i74.MarketPlaceUseCase>(
      () => _i74.MarketPlaceUseCase(get<_i52.IMarketPlaceRepository>()));
  gh.factory<_i75.MintRepository>(
      () => _i76.MintImplementation(get<_i39.NftApi>()));
  gh.factory<_i77.MintingUseCase>(
      () => _i77.MintingUseCase(get<_i75.MintRepository>()));
  gh.factory<_i78.NFTCancelSellUseCase>(
      () => _i78.NFTCancelSellUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i79.NFTRepairUseCase>(
      () => _i79.NFTRepairUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i80.NFTSellUseCase>(
      () => _i80.NFTSellUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i81.OpenBedBoxUseCase>(
      () => _i81.OpenBedBoxUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i82.OpenLuckyBoxUseCase>(
      () => _i82.OpenLuckyBoxUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i83.OpenSocketUseCase>(
      () => _i83.OpenSocketUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i84.PostHealthDataUseCase>(
      () => _i84.PostHealthDataUseCase(get<_i56.ISleepTrackingRepository>()));
  gh.factory<_i85.PostLevelUpUseCase>(
      () => _i85.PostLevelUpUseCase(get<_i69.LevelUpRepository>()));
  gh.factory<_i86.RemoveItemFromBedUseCase>(
      () => _i86.RemoveItemFromBedUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i87.RemoveJewelUseCase>(
      () => _i87.RemoveJewelUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i88.SendNftToSpendingUseCase>(() => _i88.SendNftToSpendingUseCase(
      get<_i54.INFTRepository>(), get<_i30.SecureStorage>()));
  gh.factory<_i89.SendOTPMailUseCase>(
      () => _i89.SendOTPMailUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i90.SetNftApprovalForAllUseCase>(() =>
      _i90.SetNftApprovalForAllUseCase(
          get<_i54.INFTRepository>(), get<_i30.SecureStorage>()));
  gh.factory<_i91.SettingActiveCodeUseCase>(
      () => _i91.SettingActiveCodeUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i92.SignUpUseCase>(
      () => _i92.SignUpUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i93.SpeedUpLuckyBoxUseCase>(
      () => _i93.SpeedUpLuckyBoxUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i94.StakingInfoUseCase>(
      () => _i94.StakingInfoUseCase(get<_i58.ISpendingRepository>()));
  gh.factory<_i95.StakingUseCase>(
      () => _i95.StakingUseCase(get<_i58.ISpendingRepository>()));
  gh.factory<_i96.StartSleepTrackingUseCase>(() =>
      _i96.StartSleepTrackingUseCase(get<_i56.ISleepTrackingRepository>()));
  gh.factory<_i97.SwapTokenUseCase>(
      () => _i97.SwapTokenUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i98.ToSpendingUseCase>(() => _i98.ToSpendingUseCase(
      get<_i58.ISpendingRepository>(), get<_i62.IWalletRepository>()));
  gh.factory<_i99.TransferNftUseCase>(
      () => _i99.TransferNftUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i100.TransferTokenToMainWalletUseCase>(() =>
      _i100.TransferTokenToMainWalletUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i101.UnStakingUseCase>(
      () => _i101.UnStakingUseCase(get<_i58.ISpendingRepository>()));
  gh.factory<_i102.UpdateAttributeUseCase>(
      () => _i102.UpdateAttributeUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i103.UpgradeInfoUseCase>(
      () => _i103.UpgradeInfoUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i104.UpgradeUseCase>(
      () => _i104.UpgradeUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i105.ValidateMnemonicUseCase>(
      () => _i105.ValidateMnemonicUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i106.ValidatePassCodeUseCase>(
      () => _i106.ValidatePassCodeUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i107.VerifyOTPUseCase>(
      () => _i107.VerifyOTPUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i108.WakeUpUseCase>(
      () => _i108.WakeUpUseCase(get<_i56.ISleepTrackingRepository>()));
  gh.factory<_i109.WithdrawHistoryUseCase>(
      () => _i109.WithdrawHistoryUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i110.WithdrawNFTUseCase>(
      () => _i110.WithdrawNFTUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i111.ActivationCodeSettingUseCase>(
      () => _i111.ActivationCodeSettingUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i112.AddItemToBedUseCase>(
      () => _i112.AddItemToBedUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i113.AddJewelUseCase>(
      () => _i113.AddJewelUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i114.ApproveTradeTokenUseCase>(
      () => _i114.ApproveTradeTokenUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i115.ApproveUseCase>(() => _i115.ApproveUseCase(
      get<_i58.ISpendingRepository>(), get<_i62.IWalletRepository>()));
  gh.factory<_i116.BedDetailUseCase>(
      () => _i116.BedDetailUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i117.BuyNFTUseCase>(
      () => _i117.BuyNFTUseCase(get<_i52.IMarketPlaceRepository>()));
  gh.factory<_i118.ChangePasswordUseCase>(
      () => _i118.ChangePasswordUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i119.CheckActivationCodeUseCase>(
      () => _i119.CheckActivationCodeUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i120.CheckAllowanceUseCase>(
      () => _i120.CheckAllowanceUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i121.CheckFirstOpenWallet>(
      () => _i121.CheckFirstOpenWallet(get<_i62.IWalletRepository>()));
  gh.factory<_i122.CompoundUseCase>(
      () => _i122.CompoundUseCase(get<_i58.ISpendingRepository>()));
  gh.factory<_i123.CreateNewMnemonicUseCase>(
      () => _i123.CreateNewMnemonicUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i124.CreatePassCodeUseCase>(
      () => _i124.CreatePassCodeUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i125.CreatePasswordUseCase>(
      () => _i125.CreatePasswordUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i126.CreateWalletUseCase>(
      () => _i126.CreateWalletUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i127.CurrentUserUseCase>(
      () => _i127.CurrentUserUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i128.CurrentWalletUseCase>(
      () => _i128.CurrentWalletUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i129.EstimateGasDepositUseCase>(
      () => _i129.EstimateGasDepositUseCase(get<_i58.ISpendingRepository>()));
  gh.factory<_i130.EstimateGasWithdrawUseCase>(
      () => _i130.EstimateGasWithdrawUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i131.EstimateNftFunctionFeeUseCase>(
      () => _i131.EstimateNftFunctionFeeUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i132.EstimateTrackingUseCase>(() =>
      _i132.EstimateTrackingUseCase(get<_i56.ISleepTrackingRepository>()));
  gh.factory<_i133.FetchBalanceSpendingUseCase>(
      () => _i133.FetchBalanceSpendingUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i134.FetchBedUseCase>(
      () => _i134.FetchBedUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i135.FetchDataChartUseCase>(
      () => _i135.FetchDataChartUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i136.FetchDataDaysChartUseCase>(
      () => _i136.FetchDataDaysChartUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i137.FetchHomeBedUseCase>(
      () => _i137.FetchHomeBedUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i138.FetchItemOwnerUseCase>(
      () => _i138.FetchItemOwnerUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i139.FetchJewelUseCase>(
      () => _i139.FetchJewelUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i140.FetchLuckyBoxUseCase>(
      () => _i140.FetchLuckyBoxUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i141.FetchUpgradeListUseCase>(
      () => _i141.FetchUpgradeListUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i142.GachaGetCommonUseCase>(
      () => _i142.GachaGetCommonUseCase(get<_i50.IGachaRepository>()));
  gh.factory<_i143.GachaGetSpecialUseCase>(
      () => _i143.GachaGetSpecialUseCase(get<_i50.IGachaRepository>()));
  gh.factory<_i144.GachaHistoryUseCase>(
      () => _i144.GachaHistoryUseCase(get<_i50.IGachaRepository>()));
  gh.factory<_i145.GachaProbabilityConfigUseCase>(
      () => _i145.GachaProbabilityConfigUseCase(get<_i50.IGachaRepository>()));
  gh.factory<_i146.GachaSpinUseCase>(
      () => _i146.GachaSpinUseCase(get<_i50.IGachaRepository>()));
  gh.factory<_i147.GetAmountOutMinUseCase>(
      () => _i147.GetAmountOutMinUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i148.GetBalanceForTokensUseCase>(
      () => _i148.GetBalanceForTokensUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i149.GetBalanceTokenUseCase>(
      () => _i149.GetBalanceTokenUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i150.GetCurrentMnemonicUsecase>(
      () => _i150.GetCurrentMnemonicUsecase(get<_i62.IWalletRepository>()));
  gh.factory<_i151.GetCurrentNetworkUseCase>(
      () => _i151.GetCurrentNetworkUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i152.GetGlobalConfigUseCase>(
      () => _i152.GetGlobalConfigUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i153.GetHistoryTransactionUseCase>(
      () => _i153.GetHistoryTransactionUseCase(get<_i62.IWalletRepository>()));
  gh.factory<_i154.GetLevelUpUseCase>(
      () => _i154.GetLevelUpUseCase(get<_i69.LevelUpRepository>()));
  gh.factory<_i155.GetListNftDetailUseCase>(
      () => _i155.GetListNftDetailUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i156.GetListTokenUseCase>(
      () => _i156.GetListTokenUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i157.GetMintingUseCase>(
      () => _i157.GetMintingUseCase(get<_i75.MintRepository>()));
  gh.factory<_i158.GetNFTsBalanceUseCase>(
      () => _i158.GetNFTsBalanceUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i159.GetNFTsIDsUseCase>(
      () => _i159.GetNFTsIDsUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i160.GetNftAddressesUseCase>(
      () => _i160.GetNftAddressesUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i161.GetNftFamilyUseCase>(
      () => _i161.GetNftFamilyUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i162.GetPointOfOwnerUseCase>(
      () => _i162.GetPointOfOwnerUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i163.GetRepairUseCase>(
      () => _i163.GetRepairUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i164.GetSleepResultUseCase>(
      () => _i164.GetSleepResultUseCase(get<_i56.ISleepTrackingRepository>()));
  gh.factory<_i165.GetSlftPriceUseCase>(
      () => _i165.GetSlftPriceUseCase(get<_i60.IUserRepository>()));
  gh.factory<_i166.GetTokenAddressesUseCase>(
      () => _i166.GetTokenAddressesUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i167.GetTransactionFeeUseCase>(
      () => _i167.GetTransactionFeeUseCase(get<_i54.INFTRepository>()));
  gh.factory<_i168.GetUserStatusTrackingUseCase>(() =>
      _i168.GetUserStatusTrackingUseCase(get<_i56.ISleepTrackingRepository>()));
  gh.factory<_i169.GetUserUseCase>(
      () => _i169.GetUserUseCase(get<_i48.IAuthRepository>()));
  gh.factory<_i170.HasWalletUseCase>(
      () => _i170.HasWalletUseCase(get<_i62.IWalletRepository>()));
  return get;
}

class _$RPCModule extends _i34.RPCModule {}

class _$RegisterModule extends _i171.RegisterModule {}

class _$DevInjection extends _i172.DevInjection {}

class _$ReleaseInjection extends _i173.ReleaseInjection {}

class _$ProdInjection extends _i174.ProdInjection {}
