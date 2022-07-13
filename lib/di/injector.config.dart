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
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../common/contract_addresses/contract_addresses.dart' as _i6;
import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i7;
import '../common/utils/random_utils.dart' as _i18;
import '../common/utils/toast_utils.dart' as _i20;
import '../datasources/local/get_storage_datasource.dart' as _i12;
import '../datasources/local/history_datasource.dart' as _i22;
import '../datasources/local/isar/isar_datasource.dart' as _i15;
import '../datasources/local/network_connection_datasource.dart' as _i16;
import '../datasources/local/secure_storage.dart' as _i28;
import '../datasources/local/shared_preference_datasource.dart' as _i29;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i46;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i32;
import '../datasources/remote/auth_datasource/refresh_token_interceptor.dart'
    as _i39;
import '../datasources/remote/network/nft_datasource.dart' as _i25;
import '../datasources/remote/network/spending_datasource.dart' as _i30;
import '../datasources/remote/network/web3_datasource.dart' as _i31;
import '../datasources/remote/network/web3_provider.dart' as _i21;
import '../datasources/remote/nft_api/nft_api.dart' as _i17;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i44;
import '../repository/auth_repository.dart' as _i51;
import '../repository/implementations/auth_implementation.dart' as _i52;
import '../repository/implementations/market_place_implementation.dart' as _i54;
import '../repository/implementations/network_connection_implementation.dart'
    as _i24;
import '../repository/implementations/nft_implementation.dart' as _i35;
import '../repository/implementations/spending_implementation.dart' as _i56;
import '../repository/implementations/transaction_implementation.dart' as _i37;
import '../repository/implementations/user_implementations.dart' as _i58;
import '../repository/implementations/wallet_implementation.dart' as _i60;
import '../repository/market_place_repository.dart' as _i53;
import '../repository/network_connection_repository.dart' as _i23;
import '../repository/nft_repository.dart' as _i34;
import '../repository/spending_repository.dart' as _i55;
import '../repository/transaction_repository.dart' as _i36;
import '../repository/user_repository.dart' as _i57;
import '../repository/wallet_repository.dart' as _i59;
import '../usecase/activation_code_setting_usecase.dart' as _i82;
import '../usecase/add_item_to_bed_usecase.dart' as _i83;
import '../usecase/approve_usecase.dart' as _i84;
import '../usecase/buy_nft_usecase.dart' as _i85;
import '../usecase/change_password_usecase.dart' as _i86;
import '../usecase/check_activation_code_usecase.dart' as _i87;
import '../usecase/check_approve_usecase.dart' as _i88;
import '../usecase/compound_usecase.dart' as _i90;
import '../usecase/create_pass_code_usecase.dart' as _i91;
import '../usecase/create_password_usecase.dart' as _i92;
import '../usecase/current_user_usecase.dart' as _i94;
import '../usecase/estimate_gas_withdraw.dart' as _i96;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i47;
import '../usecase/fetch_balance_spending_usecase.dart' as _i97;
import '../usecase/fetch_bed_usecase.dart' as _i98;
import '../usecase/fetch_item_owner_usecase.dart' as _i99;
import '../usecase/get_amount_out_min_usecase.dart' as _i100;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i101;
import '../usecase/get_balance_token_usecase.dart' as _i102;
import '../usecase/get_current_network_usecase.dart' as _i104;
import '../usecase/get_global_config.dart' as _i105;
import '../usecase/get_history_transaction_usecase.dart' as _i106;
import '../usecase/get_list_nft_detail_usecase.dart' as _i48;
import '../usecase/get_market_place_usecase.dart' as _i67;
import '../usecase/get_network_connection_usecase.dart' as _i33;
import '../usecase/get_nfts_balance_usecase.dart' as _i49;
import '../usecase/get_nfts_ids_usecase.dart' as _i50;
import '../usecase/get_user_usecase.dart' as _i107;
import '../usecase/has_wallet_usecase.dart' as _i108;
import '../usecase/is_first_open_app_usecase.dart' as _i62;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i38;
import '../usecase/is_passcode_created_usecase.dart' as _i63;
import '../usecase/is_valid_wallet_address_usecase.dart' as _i13;
import '../usecase/login_usecase.dart' as _i64;
import '../usecase/logout_usecase.dart' as _i65;
import '../usecase/make_first_open_app_usecase.dart' as _i66;
import '../usecase/on_connection_changed_usecase.dart' as _i26;
import '../usecase/remove_item_from_bed_usecase.dart' as _i68;
import '../usecase/run_app_init_usecase.dart' as _i27;
import '../usecase/send_nft_to_spending_usecase.dart' as _i40;
import '../usecase/send_otp_mail_usecase.dart' as _i69;
import '../usecase/send_to_external_usecase.dart' as _i41;
import '../usecase/send_token_to_external.dart' as _i42;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i43;
import '../usecase/setting_active_code_usecase.dart' as _i70;
import '../usecase/sign_up_usecase.dart' as _i71;
import '../usecase/staking_info_usecase.dart' as _i72;
import '../usecase/staking_usecase.dart' as _i73;
import '../usecase/swap_token_usecase.dart' as _i74;
import '../usecase/to_spending_usecase.dart' as _i75;
import '../usecase/transfer_nft_usecase.dart' as _i45;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i76;
import '../usecase/unstaking_usecase.dart' as _i77;
import '../usecase/validate_mnemonic.dart' as _i78;
import '../usecase/validate_passcode_usecase.dart' as _i79;
import '../usecase/verify_otp_usecase.dart' as _i80;
import '../usecase/wallet/create_wallet_usecase.dart' as _i93;
import '../usecase/wallet/current_wallet_usecase.dart' as _i95;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i89;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i103;
import '../usecase/wallet/import_wallet_usecase.dart' as _i61;
import '../usecase/withdraw_history_usecase.dart' as _i81;
import 'register_module.dart' as _i109; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i17.NftApi>(() => _i17.NftApi(get<_i8.Dio>()));
  gh.factory<_i18.RandomUtils>(() => _i18.RandomUtils());
  await gh.factoryAsync<_i19.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i12.StorageKeys>(() => _i12.StorageKeys());
  gh.factory<_i20.ToastUtils>(() => _i20.ToastUtils());
  gh.singleton<_i21.Web3Provider>(_i21.Web3Provider(get<_i4.Client>()));
  gh.factory<_i22.HistoryDataSource>(
      () => _i22.HistoryDataSource(get<_i14.Isar>()));
  gh.factory<_i23.INetworkConnectionRepository>(() =>
      _i24.NetworkConnectionImplementation(
          get<_i16.NetworkConnectionDataSource>()));
  gh.factory<_i25.NFTDataSource>(
      () => _i25.NFTDataSource(get<_i21.Web3Provider>()));
  gh.factory<_i26.OnConnectionChangedUseCase>(() =>
      _i26.OnConnectionChangedUseCase(
          get<_i23.INetworkConnectionRepository>()));
  gh.factory<_i27.RunAppInitUseCase>(() => _i27.RunAppInitUseCase(
      get<_i21.Web3Provider>(),
      get<_i15.IsarDataSource>(),
      get<_i12.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i28.SecureStorage>(() => _i28.SecureStorage(
      get<_i10.FlutterSecureStorage>(), get<_i19.SharedPreferences>()));
  gh.factory<_i29.SharedPreferenceDataSource>(
      () => _i29.SharedPreferenceDataSource(get<_i19.SharedPreferences>()));
  gh.factory<_i30.SpendingDataSource>(
      () => _i30.SpendingDataSource(get<_i21.Web3Provider>()));
  gh.factory<_i31.Web3DataSource>(
      () => _i31.Web3DataSource(get<_i21.Web3Provider>()));
  gh.factory<_i32.AuthInterceptor>(
      () => _i32.AuthInterceptor(get<_i28.SecureStorage>(), get<_i8.Dio>()));
  gh.factory<_i33.GetNetworkConnectionUseCase>(() =>
      _i33.GetNetworkConnectionUseCase(
          get<_i23.INetworkConnectionRepository>()));
  gh.factory<_i34.INFTRepository>(() => _i35.NFTImplementation(
      get<_i25.NFTDataSource>(),
      get<_i17.NftApi>(),
      get<_i28.SecureStorage>()));
  gh.factory<_i36.ITransactionRepository>(() => _i37.TransactionImplementation(
      get<_i31.Web3DataSource>(),
      get<_i12.GetStorageDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i22.HistoryDataSource>()));
  gh.factory<_i38.IsNftApproveForAllUseCase>(
      () => _i38.IsNftApproveForAllUseCase(get<_i34.INFTRepository>()));
  gh.factory<_i39.RefreshTokenInterceptor>(() =>
      _i39.RefreshTokenInterceptor(get<_i28.SecureStorage>(), get<_i8.Dio>()));
  gh.factory<_i40.SendNftToSpendingUseCase>(() => _i40.SendNftToSpendingUseCase(
      get<_i34.INFTRepository>(), get<_i28.SecureStorage>()));
  gh.factory<_i41.SendToExternalUseCase>(
      () => _i41.SendToExternalUseCase(get<_i36.ITransactionRepository>()));
  gh.factory<_i42.SendTokenToExternalUseCase>(() =>
      _i42.SendTokenToExternalUseCase(get<_i36.ITransactionRepository>()));
  gh.factory<_i43.SetNftApprovalForAllUseCase>(
      () => _i43.SetNftApprovalForAllUseCase(get<_i34.INFTRepository>()));
  gh.factory<_i44.TransactionRemoteDataSource>(() =>
      _i44.TransactionRemoteDataSource(
          get<_i22.HistoryDataSource>(),
          get<_i31.Web3DataSource>(),
          get<_i12.GetStorageDataSource>(),
          get<_i15.IsarDataSource>(),
          get<_i8.Dio>()));
  gh.factory<_i45.TransferNftUseCase>(
      () => _i45.TransferNftUseCase(get<_i34.INFTRepository>()));
  gh.factory<_i46.AuthDataSource>(() => _i46.AuthDataSource(get<_i8.Dio>(),
      get<_i32.AuthInterceptor>(), get<_i39.RefreshTokenInterceptor>()));
  gh.factory<_i47.EstimateNftFunctionFeeUseCase>(
      () => _i47.EstimateNftFunctionFeeUseCase(get<_i34.INFTRepository>()));
  gh.factory<_i48.GetListNftDetailUseCase>(
      () => _i48.GetListNftDetailUseCase(get<_i34.INFTRepository>()));
  gh.factory<_i49.GetNFTsBalanceUseCase>(
      () => _i49.GetNFTsBalanceUseCase(get<_i34.INFTRepository>()));
  gh.factory<_i50.GetNFTsIDsUseCase>(
      () => _i50.GetNFTsIDsUseCase(get<_i34.INFTRepository>()));
  gh.factory<_i51.IAuthRepository>(() => _i52.AuthImplementation(
      get<_i28.SecureStorage>(),
      get<_i46.AuthDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i12.GetStorageDataSource>()));
  gh.factory<_i53.IMarketPlaceRepository>(
      () => _i54.TransactionImplementation(get<_i46.AuthDataSource>()));
  gh.factory<_i55.ISpendingRepository>(() => _i56.SpendingImplementation(
      get<_i30.SpendingDataSource>(),
      get<_i31.Web3DataSource>(),
      get<_i46.AuthDataSource>()));
  gh.factory<_i57.IUserRepository>(() => _i58.UserImplementation(
      get<_i46.AuthDataSource>(), get<_i28.SecureStorage>()));
  gh.factory<_i59.IWalletRepository>(() => _i60.WalletImplementation(
      get<_i31.Web3DataSource>(),
      get<_i12.GetStorageDataSource>(),
      get<_i44.TransactionRemoteDataSource>(),
      get<_i15.IsarDataSource>(),
      get<_i21.Web3Provider>(),
      get<_i28.SecureStorage>(),
      get<_i46.AuthDataSource>()));
  gh.factory<_i61.ImportWalletUseCase>(
      () => _i61.ImportWalletUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i62.IsFirstOpenAppUseCase>(
      () => _i62.IsFirstOpenAppUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i63.IsPassCodeCreatedUseCase>(
      () => _i63.IsPassCodeCreatedUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i64.LogInUseCase>(
      () => _i64.LogInUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i65.LogOutUseCase>(
      () => _i65.LogOutUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i66.MakeFirstOpenAppUseCase>(
      () => _i66.MakeFirstOpenAppUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i67.MarketPlaceUseCase>(
      () => _i67.MarketPlaceUseCase(get<_i53.IMarketPlaceRepository>()));
  gh.factory<_i68.RemoveItemFromBedUseCase>(
      () => _i68.RemoveItemFromBedUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i69.SendOTPMailUseCase>(
      () => _i69.SendOTPMailUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i70.SettingActiveCodeUseCase>(
      () => _i70.SettingActiveCodeUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i71.SignUpUseCase>(
      () => _i71.SignUpUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i72.StakingInfoUseCase>(
      () => _i72.StakingInfoUseCase(get<_i55.ISpendingRepository>()));
  gh.factory<_i73.StakingUseCase>(
      () => _i73.StakingUseCase(get<_i55.ISpendingRepository>()));
  gh.factory<_i74.SwapTokenUseCase>(
      () => _i74.SwapTokenUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i75.ToSpendingUseCase>(() => _i75.ToSpendingUseCase(
      get<_i55.ISpendingRepository>(), get<_i59.IWalletRepository>()));
  gh.factory<_i76.TransferTokenToMainWalletUseCase>(
      () => _i76.TransferTokenToMainWalletUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i77.UnStakingUseCase>(
      () => _i77.UnStakingUseCase(get<_i55.ISpendingRepository>()));
  gh.factory<_i78.ValidateMnemonicUseCase>(
      () => _i78.ValidateMnemonicUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i79.ValidatePassCodeUseCase>(
      () => _i79.ValidatePassCodeUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i80.VerifyOTPUseCase>(
      () => _i80.VerifyOTPUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i81.WithdrawHistoryUseCase>(
      () => _i81.WithdrawHistoryUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i82.ActivationCodeSettingUseCase>(
      () => _i82.ActivationCodeSettingUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i83.AddItemToBedUseCase>(
      () => _i83.AddItemToBedUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i84.ApproveUseCase>(() => _i84.ApproveUseCase(
      get<_i55.ISpendingRepository>(), get<_i59.IWalletRepository>()));
  gh.factory<_i85.BuyNFTUseCase>(
      () => _i85.BuyNFTUseCase(get<_i53.IMarketPlaceRepository>()));
  gh.factory<_i86.ChangePasswordUseCase>(
      () => _i86.ChangePasswordUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i87.CheckActivationCodeUseCase>(
      () => _i87.CheckActivationCodeUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i88.CheckApproveUseCase>(
      () => _i88.CheckApproveUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i89.CheckFirstOpenWallet>(
      () => _i89.CheckFirstOpenWallet(get<_i59.IWalletRepository>()));
  gh.factory<_i90.CompoundUseCase>(
      () => _i90.CompoundUseCase(get<_i55.ISpendingRepository>()));
  gh.factory<_i91.CreatePassCodeUseCase>(
      () => _i91.CreatePassCodeUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i92.CreatePasswordUseCase>(
      () => _i92.CreatePasswordUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i93.CreateWalletUseCase>(
      () => _i93.CreateWalletUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i94.CurrentUserUseCase>(
      () => _i94.CurrentUserUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i95.CurrentWalletUseCase>(
      () => _i95.CurrentWalletUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i96.EstimateGasWithdrawUseCase>(
      () => _i96.EstimateGasWithdrawUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i97.FetchBalanceSpendingUseCase>(
      () => _i97.FetchBalanceSpendingUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i98.FetchBedUseCase>(
      () => _i98.FetchBedUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i99.FetchItemOwnerUseCase>(
      () => _i99.FetchItemOwnerUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i100.GetAmountOutMinUseCase>(
      () => _i100.GetAmountOutMinUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i101.GetBalanceForTokensUseCase>(
      () => _i101.GetBalanceForTokensUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i102.GetBalanceTokenUseCase>(
      () => _i102.GetBalanceTokenUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i103.GetCurrentMnemonicUsecase>(
      () => _i103.GetCurrentMnemonicUsecase(get<_i59.IWalletRepository>()));
  gh.factory<_i104.GetCurrentNetworkUseCase>(
      () => _i104.GetCurrentNetworkUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i105.GetGlobalConfigUseCase>(
      () => _i105.GetGlobalConfigUseCase(get<_i57.IUserRepository>()));
  gh.factory<_i106.GetHistoryTransactionUseCase>(
      () => _i106.GetHistoryTransactionUseCase(get<_i59.IWalletRepository>()));
  gh.factory<_i107.GetUserUseCase>(
      () => _i107.GetUserUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i108.HasWalletUseCase>(
      () => _i108.HasWalletUseCase(get<_i59.IWalletRepository>()));
  return get;
}

class _$RPCModule extends _i31.RPCModule {}

class _$RegisterModule extends _i109.RegisterModule {}
