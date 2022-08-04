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
import '../repository/auth_repository.dart' as _i47;
import '../repository/gacha_repository.dart' as _i49;
import '../repository/implementations/auth_implementation.dart' as _i48;
import '../repository/implementations/gacha_implementation.dart' as _i50;
import '../repository/implementations/level_up_implementation.dart' as _i69;
import '../repository/implementations/market_place_implementation.dart' as _i52;
import '../repository/implementations/mint_implementation.dart' as _i75;
import '../repository/implementations/network_connection_implementation.dart'
    as _i25;
import '../repository/implementations/nft_implementation.dart' as _i54;
import '../repository/implementations/sleep_tracking_implementation.dart'
    as _i56;
import '../repository/implementations/spending_implementation.dart' as _i58;
import '../repository/implementations/transaction_implementation.dart' as _i37;
import '../repository/implementations/user_implementations.dart' as _i60;
import '../repository/implementations/wallet_implementation.dart' as _i62;
import '../repository/level_up_repository.dart' as _i68;
import '../repository/market_place_repository.dart' as _i51;
import '../repository/mint_repository.dart' as _i74;
import '../repository/network_connection_repository.dart' as _i24;
import '../repository/nft_repository.dart' as _i53;
import '../repository/sleep_tracking_repository.dart' as _i55;
import '../repository/spending_repository.dart' as _i57;
import '../repository/transaction_repository.dart' as _i36;
import '../repository/user_repository.dart' as _i59;
import '../repository/wallet_repository.dart' as _i61;
import '../usecase/activation_code_setting_usecase.dart' as _i110;
import '../usecase/add_item_to_bed_usecase.dart' as _i111;
import '../usecase/add_jewel_usecase.dart' as _i112;
import '../usecase/approve_trade_token_usecase.dart' as _i113;
import '../usecase/approve_usecase.dart' as _i114;
import '../usecase/bed_detail_usecase.dart' as _i115;
import '../usecase/buy_nft_usecase.dart' as _i116;
import '../usecase/cancel_sell_usecase.dart' as _i77;
import '../usecase/change_password_usecase.dart' as _i117;
import '../usecase/check_activation_code_usecase.dart' as _i118;
import '../usecase/check_allowance_usecase.dart' as _i119;
import '../usecase/compound_usecase.dart' as _i121;
import '../usecase/create_new_mnemonic_usecase.dart' as _i122;
import '../usecase/create_pass_code_usecase.dart' as _i123;
import '../usecase/create_password_usecase.dart' as _i124;
import '../usecase/current_network_explorer_usecase.dart' as _i44;
import '../usecase/current_user_usecase.dart' as _i126;
import '../usecase/estimate_gas_deposit_usecase.dart' as _i128;
import '../usecase/estimate_gas_withdraw.dart' as _i129;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i130;
import '../usecase/estimate_token_function_fee_usecase.dart' as _i45;
import '../usecase/estimate_tracking_usecase.dart' as _i131;
import '../usecase/estimate_trade_token_usecase.dart' as _i46;
import '../usecase/fetch_balance_spending_usecase.dart' as _i132;
import '../usecase/fetch_bed_box_usecase.dart' as _i10;
import '../usecase/fetch_bed_usecase.dart' as _i133;
import '../usecase/fetch_data_chart_day_usecase.dart' as _i135;
import '../usecase/fetch_data_chart_usecase.dart' as _i134;
import '../usecase/fetch_home_bed_usecase.dart' as _i136;
import '../usecase/fetch_item_owner_usecase.dart' as _i137;
import '../usecase/fetch_jewel_usecase.dart' as _i138;
import '../usecase/fetch_lucky_box_usecase.dart' as _i139;
import '../usecase/fetch_upgrade_list.dart' as _i140;
import '../usecase/gacha_get_common_usecase.dart' as _i141;
import '../usecase/gacha_get_special_usecase.dart' as _i142;
import '../usecase/gacha_history_usecase.dart' as _i143;
import '../usecase/gacha_probability_config_usecase.dart' as _i144;
import '../usecase/gacha_spin_usecase.dart' as _i145;
import '../usecase/get_amount_out_min_usecase.dart' as _i146;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i147;
import '../usecase/get_balance_token_usecase.dart' as _i148;
import '../usecase/get_current_network_usecase.dart' as _i150;
import '../usecase/get_global_config.dart' as _i151;
import '../usecase/get_history_transaction_usecase.dart' as _i152;
import '../usecase/get_level_up_usecase.dart' as _i153;
import '../usecase/get_list_nft_detail_usecase.dart' as _i154;
import '../usecase/get_list_token_usecase.dart' as _i155;
import '../usecase/get_market_place_usecase.dart' as _i73;
import '../usecase/get_minting_usecase.dart' as _i156;
import '../usecase/get_network_connection_usecase.dart' as _i35;
import '../usecase/get_nft_addresses_usecase.dart' as _i159;
import '../usecase/get_nft_family_usecase.dart' as _i160;
import '../usecase/get_nfts_balance_usecase.dart' as _i157;
import '../usecase/get_nfts_ids_usecase.dart' as _i158;
import '../usecase/get_point_of_owner_usecase.dart' as _i161;
import '../usecase/get_repair_usecase.dart' as _i162;
import '../usecase/get_sleep_result_usecase.dart' as _i163;
import '../usecase/get_slft_price_usecase.dart' as _i164;
import '../usecase/get_token_addresses_usecase.dart' as _i165;
import '../usecase/get_transaction_fee_usecase.dart' as _i166;
import '../usecase/get_user_status_tracking_usecase.dart' as _i167;
import '../usecase/get_user_usecase.dart' as _i168;
import '../usecase/has_wallet_usecase.dart' as _i169;
import '../usecase/is_first_open_app_usecase.dart' as _i64;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i65;
import '../usecase/is_passcode_created_usecase.dart' as _i66;
import '../usecase/is_token_approved_enough_usecase.dart' as _i67;
import '../usecase/is_valid_wallet_address_usecase.dart' as _i14;
import '../usecase/login_usecase.dart' as _i70;
import '../usecase/logout_usecase.dart' as _i71;
import '../usecase/make_first_open_app_usecase.dart' as _i72;
import '../usecase/minting_usecase.dart' as _i76;
import '../usecase/nft_repair_usecase.dart' as _i78;
import '../usecase/nft_sell_usecase.dart' as _i79;
import '../usecase/on_connection_changed_usecase.dart' as _i27;
import '../usecase/open_bed_box_usecase.dart' as _i80;
import '../usecase/open_lucky_box_usecase.dart' as _i81;
import '../usecase/open_socket_usecase.dart' as _i82;
import '../usecase/post_health_data_usecase.dart' as _i83;
import '../usecase/post_level_up_usecase.dart' as _i84;
import '../usecase/remove_item_from_bed_usecase.dart' as _i85;
import '../usecase/remove_jewel_usecase.dart' as _i86;
import '../usecase/run_app_init_usecase.dart' as _i28;
import '../usecase/send_nft_to_spending_usecase.dart' as _i87;
import '../usecase/send_otp_mail_usecase.dart' as _i88;
import '../usecase/send_to_external_usecase.dart' as _i39;
import '../usecase/send_token_to_external.dart' as _i40;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i89;
import '../usecase/setting_active_code_usecase.dart' as _i90;
import '../usecase/sign_up_usecase.dart' as _i91;
import '../usecase/speed_up_lucky_box_usecase.dart' as _i92;
import '../usecase/staking_info_usecase.dart' as _i93;
import '../usecase/staking_usecase.dart' as _i94;
import '../usecase/start_sleep_tracking_usecase.dart' as _i95;
import '../usecase/swap_token_usecase.dart' as _i96;
import '../usecase/to_spending_usecase.dart' as _i97;
import '../usecase/transfer_nft_usecase.dart' as _i98;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i99;
import '../usecase/unstaking_usecase.dart' as _i100;
import '../usecase/update_attribute_usecase.dart' as _i101;
import '../usecase/upgrade_info_usecase.dart' as _i102;
import '../usecase/upgrade_jewel_usecase.dart' as _i103;
import '../usecase/validate_mnemonic.dart' as _i104;
import '../usecase/validate_passcode_usecase.dart' as _i105;
import '../usecase/verify_otp_usecase.dart' as _i106;
import '../usecase/wake_up_usecase.dart' as _i107;
import '../usecase/wallet/create_wallet_usecase.dart' as _i125;
import '../usecase/wallet/current_wallet_usecase.dart' as _i127;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i120;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i149;
import '../usecase/wallet/import_wallet_usecase.dart' as _i63;
import '../usecase/withdraw_history_usecase.dart' as _i108;
import '../usecase/withdraw_nft_usecase.dart' as _i109;
import 'dev_injection.dart' as _i173;
import 'prod_injection.dart' as _i172;
import 'register_module.dart' as _i170;
import 'stg_injection.dart' as _i171;

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
  gh.factory<String>(() => devInjection.contractRouterDev,
      instanceName: 'contractRouter', registerFor: {_dev});
  gh.factory<String>(() => prodInjection.contractRouterDev,
      instanceName: 'contractRouter', registerFor: {_prod});
  gh.factory<String>(() => devInjection.baseUrl,
      instanceName: 'baseUrl', registerFor: {_dev});
  gh.factory<String>(() => releaseInjection.baseUrl,
      instanceName: 'baseUrl', registerFor: {_stg});
  gh.factory<String>(() => prodInjection.baseUrl,
      instanceName: 'baseUrl', registerFor: {_prod});
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
  gh.factory<_i46.EstimateTradeTokenUseCase>(
      () => _i46.EstimateTradeTokenUseCase(get<_i36.ITransactionRepository>()));
  gh.factory<_i47.IAuthRepository>(() => _i48.AuthImplementation(
      get<_i29.SecureStorage>(),
      get<_i43.AuthDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i13.GetStorageDataSource>()));
  gh.factory<_i49.IGachaRepository>(
      () => _i50.GachaImplementation(get<_i43.AuthDataSource>()));
  gh.factory<_i51.IMarketPlaceRepository>(
      () => _i52.TransactionImplementation(get<_i43.AuthDataSource>()));
  gh.factory<_i53.INFTRepository>(() => _i54.NFTImplementation(
      get<_i26.NFTDataSource>(),
      get<_i38.NftApi>(),
      get<_i29.SecureStorage>(),
      get<_i43.AuthDataSource>()));
  gh.factory<_i55.ISleepTrackingRepository>(
      () => _i56.SleepTrackingImplementation(get<_i41.SleepTrackingApi>()));
  gh.factory<_i57.ISpendingRepository>(() => _i58.SpendingImplementation(
      get<_i31.SpendingDataSource>(),
      get<_i43.AuthDataSource>(),
      get<_i29.SecureStorage>(),
      get<_i13.GetStorageDataSource>(),
      get<_i23.HistoryDataSource>(),
      get<_i16.IsarDataSource>()));
  gh.factory<_i59.IUserRepository>(() => _i60.UserImplementation(
      get<_i43.AuthDataSource>(),
      get<_i29.SecureStorage>(),
      get<_i13.GetStorageDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i33.Web3DataSource>()));
  gh.factory<_i61.IWalletRepository>(() => _i62.WalletImplementation(
      get<_i33.Web3DataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i42.TransactionRemoteDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i22.Web3Provider>(),
      get<_i29.SecureStorage>(),
      get<_i43.AuthDataSource>()));
  gh.factory<_i63.ImportWalletUseCase>(
      () => _i63.ImportWalletUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i64.IsFirstOpenAppUseCase>(
      () => _i64.IsFirstOpenAppUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i65.IsNftApproveForAllUseCase>(() =>
      _i65.IsNftApproveForAllUseCase(
          get<_i53.INFTRepository>(), get<_i29.SecureStorage>()));
  gh.factory<_i66.IsPassCodeCreatedUseCase>(
      () => _i66.IsPassCodeCreatedUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i67.IsTokenApprovedEnoughUseCase>(
      () => _i67.IsTokenApprovedEnoughUseCase(get<_i57.ISpendingRepository>()));
  gh.factory<_i68.LevelUpRepository>(
      () => _i69.LevelUpImplementation(get<_i38.NftApi>()));
  gh.factory<_i70.LogInUseCase>(
      () => _i70.LogInUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i71.LogOutUseCase>(
      () => _i71.LogOutUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i72.MakeFirstOpenAppUseCase>(
      () => _i72.MakeFirstOpenAppUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i73.MarketPlaceUseCase>(
      () => _i73.MarketPlaceUseCase(get<_i51.IMarketPlaceRepository>()));
  gh.factory<_i74.MintRepository>(
      () => _i75.MintImplementation(get<_i38.NftApi>()));
  gh.factory<_i76.MintingUseCase>(
      () => _i76.MintingUseCase(get<_i74.MintRepository>()));
  gh.factory<_i77.NFTCancelSellUseCase>(
      () => _i77.NFTCancelSellUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i78.NFTRepairUseCase>(
      () => _i78.NFTRepairUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i79.NFTSellUseCase>(
      () => _i79.NFTSellUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i80.OpenBedBoxUseCase>(
      () => _i80.OpenBedBoxUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i81.OpenLuckyBoxUseCase>(
      () => _i81.OpenLuckyBoxUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i82.OpenSocketUseCase>(
      () => _i82.OpenSocketUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i83.PostHealthDataUseCase>(
      () => _i83.PostHealthDataUseCase(get<_i55.ISleepTrackingRepository>()));
  gh.factory<_i84.PostLevelUpUseCase>(
      () => _i84.PostLevelUpUseCase(get<_i68.LevelUpRepository>()));
  gh.factory<_i85.RemoveItemFromBedUseCase>(
      () => _i85.RemoveItemFromBedUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i86.RemoveJewelUseCase>(
      () => _i86.RemoveJewelUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i87.SendNftToSpendingUseCase>(() => _i87.SendNftToSpendingUseCase(
      get<_i53.INFTRepository>(), get<_i29.SecureStorage>()));
  gh.factory<_i88.SendOTPMailUseCase>(
      () => _i88.SendOTPMailUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i89.SetNftApprovalForAllUseCase>(() =>
      _i89.SetNftApprovalForAllUseCase(
          get<_i53.INFTRepository>(), get<_i29.SecureStorage>()));
  gh.factory<_i90.SettingActiveCodeUseCase>(
      () => _i90.SettingActiveCodeUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i91.SignUpUseCase>(
      () => _i91.SignUpUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i92.SpeedUpLuckyBoxUseCase>(
      () => _i92.SpeedUpLuckyBoxUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i93.StakingInfoUseCase>(
      () => _i93.StakingInfoUseCase(get<_i57.ISpendingRepository>()));
  gh.factory<_i94.StakingUseCase>(
      () => _i94.StakingUseCase(get<_i57.ISpendingRepository>()));
  gh.factory<_i95.StartSleepTrackingUseCase>(() =>
      _i95.StartSleepTrackingUseCase(get<_i55.ISleepTrackingRepository>()));
  gh.factory<_i96.SwapTokenUseCase>(
      () => _i96.SwapTokenUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i97.ToSpendingUseCase>(() => _i97.ToSpendingUseCase(
      get<_i57.ISpendingRepository>(), get<_i61.IWalletRepository>()));
  gh.factory<_i98.TransferNftUseCase>(
      () => _i98.TransferNftUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i99.TransferTokenToMainWalletUseCase>(
      () => _i99.TransferTokenToMainWalletUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i100.UnStakingUseCase>(
      () => _i100.UnStakingUseCase(get<_i57.ISpendingRepository>()));
  gh.factory<_i101.UpdateAttributeUseCase>(
      () => _i101.UpdateAttributeUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i102.UpgradeInfoUseCase>(
      () => _i102.UpgradeInfoUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i103.UpgradeUseCase>(
      () => _i103.UpgradeUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i104.ValidateMnemonicUseCase>(
      () => _i104.ValidateMnemonicUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i105.ValidatePassCodeUseCase>(
      () => _i105.ValidatePassCodeUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i106.VerifyOTPUseCase>(
      () => _i106.VerifyOTPUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i107.WakeUpUseCase>(
      () => _i107.WakeUpUseCase(get<_i55.ISleepTrackingRepository>()));
  gh.factory<_i108.WithdrawHistoryUseCase>(
      () => _i108.WithdrawHistoryUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i109.WithdrawNFTUseCase>(
      () => _i109.WithdrawNFTUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i110.ActivationCodeSettingUseCase>(
      () => _i110.ActivationCodeSettingUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i111.AddItemToBedUseCase>(
      () => _i111.AddItemToBedUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i112.AddJewelUseCase>(
      () => _i112.AddJewelUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i113.ApproveTradeTokenUseCase>(
      () => _i113.ApproveTradeTokenUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i114.ApproveUseCase>(() => _i114.ApproveUseCase(
      get<_i57.ISpendingRepository>(), get<_i61.IWalletRepository>()));
  gh.factory<_i115.BedDetailUseCase>(
      () => _i115.BedDetailUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i116.BuyNFTUseCase>(
      () => _i116.BuyNFTUseCase(get<_i51.IMarketPlaceRepository>()));
  gh.factory<_i117.ChangePasswordUseCase>(
      () => _i117.ChangePasswordUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i118.CheckActivationCodeUseCase>(
      () => _i118.CheckActivationCodeUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i119.CheckAllowanceUseCase>(
      () => _i119.CheckAllowanceUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i120.CheckFirstOpenWallet>(
      () => _i120.CheckFirstOpenWallet(get<_i61.IWalletRepository>()));
  gh.factory<_i121.CompoundUseCase>(
      () => _i121.CompoundUseCase(get<_i57.ISpendingRepository>()));
  gh.factory<_i122.CreateNewMnemonicUseCase>(
      () => _i122.CreateNewMnemonicUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i123.CreatePassCodeUseCase>(
      () => _i123.CreatePassCodeUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i124.CreatePasswordUseCase>(
      () => _i124.CreatePasswordUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i125.CreateWalletUseCase>(
      () => _i125.CreateWalletUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i126.CurrentUserUseCase>(
      () => _i126.CurrentUserUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i127.CurrentWalletUseCase>(
      () => _i127.CurrentWalletUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i128.EstimateGasDepositUseCase>(
      () => _i128.EstimateGasDepositUseCase(get<_i57.ISpendingRepository>()));
  gh.factory<_i129.EstimateGasWithdrawUseCase>(
      () => _i129.EstimateGasWithdrawUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i130.EstimateNftFunctionFeeUseCase>(
      () => _i130.EstimateNftFunctionFeeUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i131.EstimateTrackingUseCase>(() =>
      _i131.EstimateTrackingUseCase(get<_i55.ISleepTrackingRepository>()));
  gh.factory<_i132.FetchBalanceSpendingUseCase>(
      () => _i132.FetchBalanceSpendingUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i133.FetchBedUseCase>(
      () => _i133.FetchBedUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i134.FetchDataChartUseCase>(
      () => _i134.FetchDataChartUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i135.FetchDataDaysChartUseCase>(
      () => _i135.FetchDataDaysChartUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i136.FetchHomeBedUseCase>(
      () => _i136.FetchHomeBedUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i137.FetchItemOwnerUseCase>(
      () => _i137.FetchItemOwnerUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i138.FetchJewelUseCase>(
      () => _i138.FetchJewelUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i139.FetchLuckyBoxUseCase>(
      () => _i139.FetchLuckyBoxUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i140.FetchUpgradeListUseCase>(
      () => _i140.FetchUpgradeListUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i141.GachaGetCommonUseCase>(
      () => _i141.GachaGetCommonUseCase(get<_i49.IGachaRepository>()));
  gh.factory<_i142.GachaGetSpecialUseCase>(
      () => _i142.GachaGetSpecialUseCase(get<_i49.IGachaRepository>()));
  gh.factory<_i143.GachaHistoryUseCase>(
      () => _i143.GachaHistoryUseCase(get<_i49.IGachaRepository>()));
  gh.factory<_i144.GachaProbabilityConfigUseCase>(
      () => _i144.GachaProbabilityConfigUseCase(get<_i49.IGachaRepository>()));
  gh.factory<_i145.GachaSpinUseCase>(
      () => _i145.GachaSpinUseCase(get<_i49.IGachaRepository>()));
  gh.factory<_i146.GetAmountOutMinUseCase>(
      () => _i146.GetAmountOutMinUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i147.GetBalanceForTokensUseCase>(
      () => _i147.GetBalanceForTokensUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i148.GetBalanceTokenUseCase>(
      () => _i148.GetBalanceTokenUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i149.GetCurrentMnemonicUsecase>(
      () => _i149.GetCurrentMnemonicUsecase(get<_i61.IWalletRepository>()));
  gh.factory<_i150.GetCurrentNetworkUseCase>(
      () => _i150.GetCurrentNetworkUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i151.GetGlobalConfigUseCase>(
      () => _i151.GetGlobalConfigUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i152.GetHistoryTransactionUseCase>(
      () => _i152.GetHistoryTransactionUseCase(get<_i61.IWalletRepository>()));
  gh.factory<_i153.GetLevelUpUseCase>(
      () => _i153.GetLevelUpUseCase(get<_i68.LevelUpRepository>()));
  gh.factory<_i154.GetListNftDetailUseCase>(
      () => _i154.GetListNftDetailUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i155.GetListTokenUseCase>(
      () => _i155.GetListTokenUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i156.GetMintingUseCase>(
      () => _i156.GetMintingUseCase(get<_i74.MintRepository>()));
  gh.factory<_i157.GetNFTsBalanceUseCase>(
      () => _i157.GetNFTsBalanceUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i158.GetNFTsIDsUseCase>(
      () => _i158.GetNFTsIDsUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i159.GetNftAddressesUseCase>(
      () => _i159.GetNftAddressesUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i160.GetNftFamilyUseCase>(
      () => _i160.GetNftFamilyUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i161.GetPointOfOwnerUseCase>(
      () => _i161.GetPointOfOwnerUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i162.GetRepairUseCase>(
      () => _i162.GetRepairUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i163.GetSleepResultUseCase>(
      () => _i163.GetSleepResultUseCase(get<_i55.ISleepTrackingRepository>()));
  gh.factory<_i164.GetSlftPriceUseCase>(
      () => _i164.GetSlftPriceUseCase(get<_i59.IUserRepository>()));
  gh.factory<_i165.GetTokenAddressesUseCase>(
      () => _i165.GetTokenAddressesUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i166.GetTransactionFeeUseCase>(
      () => _i166.GetTransactionFeeUseCase(get<_i53.INFTRepository>()));
  gh.factory<_i167.GetUserStatusTrackingUseCase>(() =>
      _i167.GetUserStatusTrackingUseCase(get<_i55.ISleepTrackingRepository>()));
  gh.factory<_i168.GetUserUseCase>(
      () => _i168.GetUserUseCase(get<_i47.IAuthRepository>()));
  gh.factory<_i169.HasWalletUseCase>(
      () => _i169.HasWalletUseCase(get<_i61.IWalletRepository>()));
  return get;
}

class _$RPCModule extends _i33.RPCModule {}

class _$RegisterModule extends _i170.RegisterModule {}

class _$ReleaseInjection extends _i171.ReleaseInjection {}

class _$ProdInjection extends _i172.ProdInjection {}

class _$DevInjection extends _i173.DevInjection {}
