// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i9;

import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:device_info_plus/device_info_plus.dart' as _i7;
import 'package:dio/dio.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i11;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i14;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i6;
import '../common/utils/random_utils.dart' as _i17;
import '../common/utils/toast_utils.dart' as _i19;
import '../datasources/local/get_storage_datasource.dart' as _i12;
import '../datasources/local/history_datasource.dart' as _i21;
import '../datasources/local/isar/isar_datasource.dart' as _i15;
import '../datasources/local/network_connection_datasource.dart' as _i16;
import '../datasources/local/secure_storage.dart' as _i27;
import '../datasources/local/shared_preference_datasource.dart' as _i28;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i41;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i32;
import '../datasources/remote/auth_datasource/queue_interceptor.dart' as _i36;
import '../datasources/remote/network/nft_datasource.dart' as _i24;
import '../datasources/remote/network/spending_datasource.dart' as _i29;
import '../datasources/remote/network/wallet_datasource.dart' as _i30;
import '../datasources/remote/network/web3_datasource.dart' as _i31;
import '../datasources/remote/network/web3_provider.dart' as _i20;
import '../datasources/remote/nft_api/nft_api.dart' as _i66;
import '../datasources/remote/sleep_tracking_api/sleep_tracking_api.dart'
    as _i39;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i40;
import '../repository/auth_repository.dart' as _i44;
import '../repository/gacha_repository.dart' as _i46;
import '../repository/implementations/auth_implementation.dart' as _i45;
import '../repository/implementations/gacha_implementation.dart' as _i47;
import '../repository/implementations/level_up_implementation.dart' as _i140;
import '../repository/implementations/market_place_implementation.dart' as _i49;
import '../repository/implementations/mint_implementation.dart' as _i142;
import '../repository/implementations/network_connection_implementation.dart'
    as _i23;
import '../repository/implementations/nft_implementation.dart' as _i137;
import '../repository/implementations/sleep_tracking_implementation.dart'
    as _i51;
import '../repository/implementations/spending_implementation.dart' as _i53;
import '../repository/implementations/transaction_implementation.dart' as _i35;
import '../repository/implementations/user_implementations.dart' as _i55;
import '../repository/implementations/wallet_implementation.dart' as _i57;
import '../repository/level_up_repository.dart' as _i139;
import '../repository/market_place_repository.dart' as _i48;
import '../repository/mint_repository.dart' as _i141;
import '../repository/network_connection_repository.dart' as _i22;
import '../repository/nft_repository.dart' as _i136;
import '../repository/sleep_tracking_repository.dart' as _i50;
import '../repository/spending_repository.dart' as _i52;
import '../repository/transaction_repository.dart' as _i34;
import '../repository/user_repository.dart' as _i54;
import '../repository/wallet_repository.dart' as _i56;
import '../usecase/activation_code_setting_usecase.dart' as _i91;
import '../usecase/add_item_to_bed_usecase.dart' as _i92;
import '../usecase/add_jewel_usecase.dart' as _i93;
import '../usecase/approve_usecase.dart' as _i94;
import '../usecase/bed_detail_usecase.dart' as _i95;
import '../usecase/buy_nft_usecase.dart' as _i96;
import '../usecase/cancel_sell_usecase.dart' as _i144;
import '../usecase/change_password_usecase.dart' as _i97;
import '../usecase/check_activation_code_usecase.dart' as _i98;
import '../usecase/check_approve_usecase.dart' as _i99;
import '../usecase/compound_usecase.dart' as _i101;
import '../usecase/create_new_mnemonic_usecase.dart' as _i102;
import '../usecase/create_pass_code_usecase.dart' as _i103;
import '../usecase/create_password_usecase.dart' as _i104;
import '../usecase/current_network_explorer_usecase.dart' as _i42;
import '../usecase/current_user_usecase.dart' as _i106;
import '../usecase/estimate_gas_withdraw.dart' as _i108;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i153;
import '../usecase/estimate_token_function_fee_usecase.dart' as _i43;
import '../usecase/estimate_tracking_usecase.dart' as _i109;
import '../usecase/fetch_balance_spending_usecase.dart' as _i110;
import '../usecase/fetch_bed_usecase.dart' as _i111;
import '../usecase/fetch_data_chart_day_usecase.dart' as _i113;
import '../usecase/fetch_data_chart_usecase.dart' as _i112;
import '../usecase/fetch_home_bed_usecase.dart' as _i114;
import '../usecase/fetch_item_owner_usecase.dart' as _i115;
import '../usecase/fetch_jewel_usecase.dart' as _i116;
import '../usecase/fetch_lucky_box_usecase.dart' as _i117;
import '../usecase/fetch_upgrade_list.dart' as _i118;
import '../usecase/gacha_get_common_usecase.dart' as _i119;
import '../usecase/gacha_get_special_usecase.dart' as _i120;
import '../usecase/gacha_history_usecase.dart' as _i121;
import '../usecase/gacha_probability_config_usecase.dart' as _i122;
import '../usecase/gacha_spin_usecase.dart' as _i123;
import '../usecase/get_amount_out_min_usecase.dart' as _i124;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i125;
import '../usecase/get_balance_token_usecase.dart' as _i126;
import '../usecase/get_current_network_usecase.dart' as _i128;
import '../usecase/get_global_config.dart' as _i129;
import '../usecase/get_history_transaction_usecase.dart' as _i130;
import '../usecase/get_level_up_usecase.dart' as _i154;
import '../usecase/get_list_nft_detail_usecase.dart' as _i155;
import '../usecase/get_market_place_usecase.dart' as _i65;
import '../usecase/get_minting_usecase.dart' as _i156;
import '../usecase/get_network_connection_usecase.dart' as _i33;
import '../usecase/get_nft_addresses_usecase.dart' as _i159;
import '../usecase/get_nft_family_usecase.dart' as _i160;
import '../usecase/get_nfts_balance_usecase.dart' as _i157;
import '../usecase/get_nfts_ids_usecase.dart' as _i158;
import '../usecase/get_point_of_owner_usecase.dart' as _i161;
import '../usecase/get_repair_usecase.dart' as _i162;
import '../usecase/get_sleep_result_usecase.dart' as _i131;
import '../usecase/get_slft_price_usecase.dart' as _i132;
import '../usecase/get_token_addresses_usecase.dart' as _i163;
import '../usecase/get_transaction_fee_usecase.dart' as _i164;
import '../usecase/get_user_status_tracking_usecase.dart' as _i133;
import '../usecase/get_user_usecase.dart' as _i134;
import '../usecase/has_wallet_usecase.dart' as _i135;
import '../usecase/is_first_open_app_usecase.dart' as _i59;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i138;
import '../usecase/is_passcode_created_usecase.dart' as _i60;
import '../usecase/is_token_approved_enough_usecase.dart' as _i61;
import '../usecase/is_valid_wallet_address_usecase.dart' as _i13;
import '../usecase/login_usecase.dart' as _i62;
import '../usecase/logout_usecase.dart' as _i63;
import '../usecase/make_first_open_app_usecase.dart' as _i64;
import '../usecase/minting_usecase.dart' as _i143;
import '../usecase/nft_repair_usecase.dart' as _i145;
import '../usecase/nft_sell_usecase.dart' as _i146;
import '../usecase/on_connection_changed_usecase.dart' as _i25;
import '../usecase/open_bed_box_usecase.dart' as _i67;
import '../usecase/open_lucky_box_usecase.dart' as _i68;
import '../usecase/open_socket_usecase.dart' as _i69;
import '../usecase/post_health_data_usecase.dart' as _i70;
import '../usecase/post_level_up_usecase.dart' as _i147;
import '../usecase/remove_item_from_bed_usecase.dart' as _i71;
import '../usecase/remove_jewel_usecase.dart' as _i72;
import '../usecase/run_app_init_usecase.dart' as _i26;
import '../usecase/send_nft_to_spending_usecase.dart' as _i148;
import '../usecase/send_otp_mail_usecase.dart' as _i73;
import '../usecase/send_to_external_usecase.dart' as _i37;
import '../usecase/send_token_to_external.dart' as _i38;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i149;
import '../usecase/setting_active_code_usecase.dart' as _i74;
import '../usecase/sign_up_usecase.dart' as _i75;
import '../usecase/speed_up_lucky_box_usecase.dart' as _i76;
import '../usecase/staking_info_usecase.dart' as _i77;
import '../usecase/staking_usecase.dart' as _i78;
import '../usecase/start_sleep_tracking_usecase.dart' as _i79;
import '../usecase/swap_token_usecase.dart' as _i80;
import '../usecase/to_spending_usecase.dart' as _i81;
import '../usecase/transfer_nft_usecase.dart' as _i150;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i82;
import '../usecase/unstaking_usecase.dart' as _i83;
import '../usecase/update_attribute_usecase.dart' as _i151;
import '../usecase/upgrade_info_usecase.dart' as _i84;
import '../usecase/upgrade_jewel_usecase.dart' as _i85;
import '../usecase/validate_mnemonic.dart' as _i86;
import '../usecase/validate_passcode_usecase.dart' as _i87;
import '../usecase/verify_otp_usecase.dart' as _i88;
import '../usecase/wake_up_usecase.dart' as _i89;
import '../usecase/wallet/create_wallet_usecase.dart' as _i105;
import '../usecase/wallet/current_wallet_usecase.dart' as _i107;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i100;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i127;
import '../usecase/wallet/import_wallet_usecase.dart' as _i58;
import '../usecase/withdraw_history_usecase.dart' as _i90;
import '../usecase/withdraw_nft_usecase.dart' as _i152;
import 'const_injection.dart' as _i166;
import 'register_module.dart' as _i165;

const String _dev = 'dev';
const String _test = 'test';
const String _prod = 'prod';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final rPCModule = _$RPCModule();
  final registerModule = _$RegisterModule();
  final constInjection = _$ConstInjection();
  gh.singleton<_i3.AppFlyerCustom>(_i3.AppFlyerCustom());
  gh.factory<_i4.Client>(() => rPCModule.httpClient);
  gh.factory<_i5.Connectivity>(() => registerModule.connectivity);
  gh.factory<_i6.DateTimeUtils>(() => _i6.DateTimeUtils());
  gh.factory<_i7.DeviceInfoPlugin>(() => registerModule.deviceInfoPlugin);
  gh.factory<_i8.Dio>(() => registerModule.dio);
  await gh.factoryAsync<_i9.Directory>(() => registerModule.isarDir,
      preResolve: true);
  gh.factory<_i10.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i11.GetStorage>(() => registerModule.getStorage);
  gh.singleton<_i12.GetStorageDataSource>(
      _i12.GetStorageDataSource(get<_i11.GetStorage>()));
  gh.factory<_i13.IsValidWalletAddressUseCase>(
      () => _i13.IsValidWalletAddressUseCase());
  await gh.factoryAsync<_i14.Isar>(
      () => registerModule.isar(get<_i9.Directory>()),
      preResolve: true);
  gh.singleton<_i15.IsarDataSource>(_i15.IsarDataSource(get<_i14.Isar>()));
  gh.factory<List<dynamic>>(() => constInjection.tokensDev,
      instanceName: 'tokens', registerFor: {_dev});
  gh.factory<List<String>>(() => constInjection.listNFTAddressTestNet,
      instanceName: 'nftAddresses', registerFor: {_test});
  gh.factory<List<dynamic>>(() => constInjection.tokensProd,
      instanceName: 'tokens', registerFor: {_prod});
  gh.factory<_i16.NetworkConnectionDataSource>(
      () => _i16.NetworkConnectionDataSource(get<_i5.Connectivity>()));
  gh.factory<_i17.RandomUtils>(() => _i17.RandomUtils());
  await gh.factoryAsync<_i18.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i12.StorageKeys>(() => _i12.StorageKeys());
  gh.factory<String>(() => constInjection.contractRouterDev,
      instanceName: 'contractRouter', registerFor: {_dev});
  gh.factory<String>(() => constInjection.contractRouterProd,
      instanceName: 'contractRouter', registerFor: {_prod});
  gh.factory<String>(() => constInjection.baseUrlStg,
      instanceName: 'baseUrl', registerFor: {_test});
  gh.factory<String>(() => constInjection.baseUrlProd,
      instanceName: 'baseUrl', registerFor: {_prod});
  gh.factory<String>(() => constInjection.baseUrlDev,
      instanceName: 'baseUrl', registerFor: {_dev});
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
  gh.singleton<_i27.SecureStorage>(_i27.SecureStorage(
      get<_i10.FlutterSecureStorage>(), get<_i18.SharedPreferences>()));
  gh.singleton<_i28.SharedPreferenceDataSource>(
      _i28.SharedPreferenceDataSource(get<_i18.SharedPreferences>()));
  gh.factory<_i29.SpendingDataSource>(
      () => _i29.SpendingDataSource(get<_i20.Web3Provider>()));
  gh.factory<_i30.WalletDataSource>(
      () => _i30.WalletDataSource(get<_i20.Web3Provider>()));
  gh.factory<_i31.Web3DataSource>(
      () => _i31.Web3DataSource(get<_i20.Web3Provider>()));
  gh.factory<_i32.AuthInterceptor>(() => _i32.AuthInterceptor(
      get<_i27.SecureStorage>(), get<_i8.Dio>(), get<_i7.DeviceInfoPlugin>()));
  gh.factory<_i33.GetNetworkConnectionUseCase>(() =>
      _i33.GetNetworkConnectionUseCase(
          get<_i22.INetworkConnectionRepository>()));
  gh.factory<_i34.ITransactionRepository>(() => _i35.TransactionImplementation(
      get<_i31.Web3DataSource>(),
      get<_i12.GetStorageDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i21.HistoryDataSource>(),
      get<_i27.SecureStorage>()));
  gh.factory<_i36.QueueInterceptor>(
      () => _i36.QueueInterceptor(get<_i27.SecureStorage>(), get<_i8.Dio>()));
  gh.factory<_i37.SendToExternalUseCase>(
      () => _i37.SendToExternalUseCase(get<_i34.ITransactionRepository>()));
  gh.factory<_i38.SendTokenToExternalUseCase>(() =>
      _i38.SendTokenToExternalUseCase(get<_i34.ITransactionRepository>()));
  gh.factory<_i39.SleepTrackingApi>(() => _i39.SleepTrackingApi(
      get<_i8.Dio>(),
      get<_i32.AuthInterceptor>(),
      get<_i36.QueueInterceptor>(),
      get<String>(instanceName: 'baseUrl')));
  gh.factory<_i40.TransactionRemoteDataSource>(() =>
      _i40.TransactionRemoteDataSource(
          get<_i21.HistoryDataSource>(),
          get<_i31.Web3DataSource>(),
          get<_i12.GetStorageDataSource>(),
          get<_i15.IsarDataSource>(),
          get<_i8.Dio>()));
  gh.factory<_i41.AuthDataSource>(() => _i41.AuthDataSource(
      get<_i8.Dio>(),
      get<_i32.AuthInterceptor>(),
      get<_i36.QueueInterceptor>(),
      get<String>(instanceName: 'baseUrl')));
  gh.factory<_i42.CurrentNetworkExplorerUseCase>(() =>
      _i42.CurrentNetworkExplorerUseCase(get<_i34.ITransactionRepository>()));
  gh.factory<_i43.EstimateTokenFunctionFeeUseCase>(() =>
      _i43.EstimateTokenFunctionFeeUseCase(get<_i34.ITransactionRepository>()));
  gh.factory<_i44.IAuthRepository>(() => _i45.AuthImplementation(
      get<_i27.SecureStorage>(),
      get<_i41.AuthDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i12.GetStorageDataSource>()));
  gh.factory<_i46.IGachaRepository>(
      () => _i47.GachaImplementation(get<_i41.AuthDataSource>()));
  gh.factory<_i48.IMarketPlaceRepository>(
      () => _i49.TransactionImplementation(get<_i41.AuthDataSource>()));
  gh.factory<_i50.ISleepTrackingRepository>(
      () => _i51.SleepTrackingImplementation(get<_i39.SleepTrackingApi>()));
  gh.factory<_i52.ISpendingRepository>(() => _i53.SpendingImplementation(
      get<_i29.SpendingDataSource>(),
      get<_i41.AuthDataSource>(),
      get<_i27.SecureStorage>(),
      get<_i12.GetStorageDataSource>(),
      get<_i21.HistoryDataSource>()));
  gh.factory<_i54.IUserRepository>(() => _i55.UserImplementation(
      get<_i41.AuthDataSource>(),
      get<_i27.SecureStorage>(),
      get<_i12.GetStorageDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i31.Web3DataSource>()));
  gh.factory<_i56.IWalletRepository>(() => _i57.WalletImplementation(
      get<_i31.Web3DataSource>(),
      get<_i12.GetStorageDataSource>(),
      get<_i40.TransactionRemoteDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i20.Web3Provider>(),
      get<_i27.SecureStorage>(),
      get<_i41.AuthDataSource>()));
  gh.factory<_i58.ImportWalletUseCase>(
      () => _i58.ImportWalletUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i59.IsFirstOpenAppUseCase>(
      () => _i59.IsFirstOpenAppUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i60.IsPassCodeCreatedUseCase>(
      () => _i60.IsPassCodeCreatedUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i61.IsTokenApprovedEnoughUseCase>(
      () => _i61.IsTokenApprovedEnoughUseCase(get<_i52.ISpendingRepository>()));
  gh.factory<_i62.LogInUseCase>(
      () => _i62.LogInUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i63.LogOutUseCase>(
      () => _i63.LogOutUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i64.MakeFirstOpenAppUseCase>(
      () => _i64.MakeFirstOpenAppUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i65.MarketPlaceUseCase>(
      () => _i65.MarketPlaceUseCase(get<_i48.IMarketPlaceRepository>()));
  gh.factory<_i66.NftApi>(() => _i66.NftApi(
      get<_i8.Dio>(),
      get<_i32.AuthInterceptor>(),
      get<_i36.QueueInterceptor>(),
      get<String>(instanceName: 'baseUrl')));
  gh.factory<_i67.OpenBedBoxUseCase>(
      () => _i67.OpenBedBoxUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i68.OpenLuckyBoxUseCase>(
      () => _i68.OpenLuckyBoxUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i69.OpenSocketUseCase>(
      () => _i69.OpenSocketUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i70.PostHealthDataUseCase>(
      () => _i70.PostHealthDataUseCase(get<_i50.ISleepTrackingRepository>()));
  gh.factory<_i71.RemoveItemFromBedUseCase>(
      () => _i71.RemoveItemFromBedUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i72.RemoveJewelUseCase>(
      () => _i72.RemoveJewelUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i73.SendOTPMailUseCase>(
      () => _i73.SendOTPMailUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i74.SettingActiveCodeUseCase>(
      () => _i74.SettingActiveCodeUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i75.SignUpUseCase>(
      () => _i75.SignUpUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i76.SpeedUpLuckyBoxUseCase>(
      () => _i76.SpeedUpLuckyBoxUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i77.StakingInfoUseCase>(
      () => _i77.StakingInfoUseCase(get<_i52.ISpendingRepository>()));
  gh.factory<_i78.StakingUseCase>(
      () => _i78.StakingUseCase(get<_i52.ISpendingRepository>()));
  gh.factory<_i79.StartSleepTrackingUseCase>(() =>
      _i79.StartSleepTrackingUseCase(get<_i50.ISleepTrackingRepository>()));
  gh.factory<_i80.SwapTokenUseCase>(
      () => _i80.SwapTokenUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i81.ToSpendingUseCase>(() => _i81.ToSpendingUseCase(
      get<_i52.ISpendingRepository>(), get<_i56.IWalletRepository>()));
  gh.factory<_i82.TransferTokenToMainWalletUseCase>(
      () => _i82.TransferTokenToMainWalletUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i83.UnStakingUseCase>(
      () => _i83.UnStakingUseCase(get<_i52.ISpendingRepository>()));
  gh.factory<_i84.UpgradeInfoUseCase>(
      () => _i84.UpgradeInfoUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i85.UpgradeUseCase>(
      () => _i85.UpgradeUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i86.ValidateMnemonicUseCase>(
      () => _i86.ValidateMnemonicUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i87.ValidatePassCodeUseCase>(
      () => _i87.ValidatePassCodeUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i88.VerifyOTPUseCase>(
      () => _i88.VerifyOTPUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i89.WakeUpUseCase>(
      () => _i89.WakeUpUseCase(get<_i50.ISleepTrackingRepository>()));
  gh.factory<_i90.WithdrawHistoryUseCase>(
      () => _i90.WithdrawHistoryUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i91.ActivationCodeSettingUseCase>(
      () => _i91.ActivationCodeSettingUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i92.AddItemToBedUseCase>(
      () => _i92.AddItemToBedUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i93.AddJewelUseCase>(
      () => _i93.AddJewelUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i94.ApproveUseCase>(() => _i94.ApproveUseCase(
      get<_i52.ISpendingRepository>(), get<_i56.IWalletRepository>()));
  gh.factory<_i95.BedDetailUseCase>(
      () => _i95.BedDetailUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i96.BuyNFTUseCase>(
      () => _i96.BuyNFTUseCase(get<_i48.IMarketPlaceRepository>()));
  gh.factory<_i97.ChangePasswordUseCase>(
      () => _i97.ChangePasswordUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i98.CheckActivationCodeUseCase>(
      () => _i98.CheckActivationCodeUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i99.CheckApproveUseCase>(
      () => _i99.CheckApproveUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i100.CheckFirstOpenWallet>(
      () => _i100.CheckFirstOpenWallet(get<_i56.IWalletRepository>()));
  gh.factory<_i101.CompoundUseCase>(
      () => _i101.CompoundUseCase(get<_i52.ISpendingRepository>()));
  gh.factory<_i102.CreateNewMnemonicUseCase>(
      () => _i102.CreateNewMnemonicUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i103.CreatePassCodeUseCase>(
      () => _i103.CreatePassCodeUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i104.CreatePasswordUseCase>(
      () => _i104.CreatePasswordUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i105.CreateWalletUseCase>(
      () => _i105.CreateWalletUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i106.CurrentUserUseCase>(
      () => _i106.CurrentUserUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i107.CurrentWalletUseCase>(
      () => _i107.CurrentWalletUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i108.EstimateGasWithdrawUseCase>(
      () => _i108.EstimateGasWithdrawUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i109.EstimateTrackingUseCase>(() =>
      _i109.EstimateTrackingUseCase(get<_i50.ISleepTrackingRepository>()));
  gh.factory<_i110.FetchBalanceSpendingUseCase>(
      () => _i110.FetchBalanceSpendingUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i111.FetchBedUseCase>(
      () => _i111.FetchBedUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i112.FetchDataChartUseCase>(
      () => _i112.FetchDataChartUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i113.FetchDataDaysChartUseCase>(
      () => _i113.FetchDataDaysChartUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i114.FetchHomeBedUseCase>(
      () => _i114.FetchHomeBedUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i115.FetchItemOwnerUseCase>(
      () => _i115.FetchItemOwnerUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i116.FetchJewelUseCase>(
      () => _i116.FetchJewelUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i117.FetchLuckyBoxUseCase>(
      () => _i117.FetchLuckyBoxUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i118.FetchUpgradeListUseCase>(
      () => _i118.FetchUpgradeListUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i119.GachaGetCommonUseCase>(
      () => _i119.GachaGetCommonUseCase(get<_i46.IGachaRepository>()));
  gh.factory<_i120.GachaGetSpecialUseCase>(
      () => _i120.GachaGetSpecialUseCase(get<_i46.IGachaRepository>()));
  gh.factory<_i121.GachaHistoryUseCase>(
      () => _i121.GachaHistoryUseCase(get<_i46.IGachaRepository>()));
  gh.factory<_i122.GachaProbabilityConfigUseCase>(
      () => _i122.GachaProbabilityConfigUseCase(get<_i46.IGachaRepository>()));
  gh.factory<_i123.GachaSpinUseCase>(
      () => _i123.GachaSpinUseCase(get<_i46.IGachaRepository>()));
  gh.factory<_i124.GetAmountOutMinUseCase>(
      () => _i124.GetAmountOutMinUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i125.GetBalanceForTokensUseCase>(
      () => _i125.GetBalanceForTokensUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i126.GetBalanceTokenUseCase>(
      () => _i126.GetBalanceTokenUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i127.GetCurrentMnemonicUsecase>(
      () => _i127.GetCurrentMnemonicUsecase(get<_i56.IWalletRepository>()));
  gh.factory<_i128.GetCurrentNetworkUseCase>(
      () => _i128.GetCurrentNetworkUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i129.GetGlobalConfigUseCase>(
      () => _i129.GetGlobalConfigUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i130.GetHistoryTransactionUseCase>(
      () => _i130.GetHistoryTransactionUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i131.GetSleepResultUseCase>(
      () => _i131.GetSleepResultUseCase(get<_i50.ISleepTrackingRepository>()));
  gh.factory<_i132.GetSlftPriceUseCase>(
      () => _i132.GetSlftPriceUseCase(get<_i54.IUserRepository>()));
  gh.factory<_i133.GetUserStatusTrackingUseCase>(() =>
      _i133.GetUserStatusTrackingUseCase(get<_i50.ISleepTrackingRepository>()));
  gh.factory<_i134.GetUserUseCase>(
      () => _i134.GetUserUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i135.HasWalletUseCase>(
      () => _i135.HasWalletUseCase(get<_i56.IWalletRepository>()));
  gh.factory<_i136.INFTRepository>(() => _i137.NFTImplementation(
      get<_i24.NFTDataSource>(),
      get<_i66.NftApi>(),
      get<_i27.SecureStorage>(),
      get<_i41.AuthDataSource>()));
  gh.factory<_i138.IsNftApproveForAllUseCase>(() =>
      _i138.IsNftApproveForAllUseCase(
          get<_i136.INFTRepository>(), get<_i27.SecureStorage>()));
  gh.factory<_i139.LevelUpRepository>(
      () => _i140.LevelUpImplementation(get<_i66.NftApi>()));
  gh.factory<_i141.MintRepository>(
      () => _i142.MintImplementation(get<_i66.NftApi>()));
  gh.factory<_i143.MintingUseCase>(
      () => _i143.MintingUseCase(get<_i141.MintRepository>()));
  gh.factory<_i144.NFTCancelSellUseCase>(
      () => _i144.NFTCancelSellUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i145.NFTRepairUseCase>(
      () => _i145.NFTRepairUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i146.NFTSellUseCase>(
      () => _i146.NFTSellUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i147.PostLevelUpUseCase>(
      () => _i147.PostLevelUpUseCase(get<_i139.LevelUpRepository>()));
  gh.factory<_i148.SendNftToSpendingUseCase>(() =>
      _i148.SendNftToSpendingUseCase(
          get<_i136.INFTRepository>(), get<_i27.SecureStorage>()));
  gh.factory<_i149.SetNftApprovalForAllUseCase>(() =>
      _i149.SetNftApprovalForAllUseCase(
          get<_i136.INFTRepository>(), get<_i27.SecureStorage>()));
  gh.factory<_i150.TransferNftUseCase>(
      () => _i150.TransferNftUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i151.UpdateAttributeUseCase>(
      () => _i151.UpdateAttributeUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i152.WithdrawNFTUseCase>(
      () => _i152.WithdrawNFTUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i153.EstimateNftFunctionFeeUseCase>(
      () => _i153.EstimateNftFunctionFeeUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i154.GetLevelUpUseCase>(
      () => _i154.GetLevelUpUseCase(get<_i139.LevelUpRepository>()));
  gh.factory<_i155.GetListNftDetailUseCase>(
      () => _i155.GetListNftDetailUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i156.GetMintingUseCase>(
      () => _i156.GetMintingUseCase(get<_i141.MintRepository>()));
  gh.factory<_i157.GetNFTsBalanceUseCase>(
      () => _i157.GetNFTsBalanceUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i158.GetNFTsIDsUseCase>(
      () => _i158.GetNFTsIDsUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i159.GetNftAddressesUseCase>(
      () => _i159.GetNftAddressesUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i160.GetNftFamilyUseCase>(
      () => _i160.GetNftFamilyUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i161.GetPointOfOwnerUseCase>(
      () => _i161.GetPointOfOwnerUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i162.GetRepairUseCase>(
      () => _i162.GetRepairUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i163.GetTokenAddressesUseCase>(
      () => _i163.GetTokenAddressesUseCase(get<_i136.INFTRepository>()));
  gh.factory<_i164.GetTransactionFeeUseCase>(
      () => _i164.GetTransactionFeeUseCase(get<_i136.INFTRepository>()));
  return get;
}

class _$RPCModule extends _i31.RPCModule {}

class _$RegisterModule extends _i165.RegisterModule {}

class _$ConstInjection extends _i166.ConstInjection {}
