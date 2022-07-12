// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i9;

import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:dio/dio.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i12;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i15;
import 'package:shared_preferences/shared_preferences.dart' as _i20;

import '../common/contract_addresses/contract_addresses.dart' as _i6;
import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i7;
import '../common/utils/random_utils.dart' as _i19;
import '../common/utils/toast_utils.dart' as _i21;
import '../datasources/local/get_storage_datasource.dart' as _i13;
import '../datasources/local/history_datasource.dart' as _i23;
import '../datasources/local/isar/isar_datasource.dart' as _i16;
import '../datasources/local/network_connection_datasource.dart' as _i17;
import '../datasources/local/secure_storage.dart' as _i29;
import '../datasources/local/shared_preference_datasource.dart' as _i30;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i47;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i33;
import '../datasources/remote/auth_datasource/refresh_token_interceptor.dart'
    as _i40;
import '../datasources/remote/network/nft_datasource.dart' as _i26;
import '../datasources/remote/network/spending_datasource.dart' as _i31;
import '../datasources/remote/network/web3_datasource.dart' as _i32;
import '../datasources/remote/network/web3_provider.dart' as _i22;
import '../datasources/remote/nft_api/nft_api.dart' as _i18;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i45;
import '../repository/auth_repository.dart' as _i52;
import '../repository/implementations/auth_implementation.dart' as _i53;
import '../repository/implementations/market_place_implementation.dart' as _i55;
import '../repository/implementations/network_connection_implementation.dart'
    as _i25;
import '../repository/implementations/nft_implementation.dart' as _i36;
import '../repository/implementations/spending_implementation.dart' as _i57;
import '../repository/implementations/transaction_implementation.dart' as _i38;
import '../repository/implementations/user_implementations.dart' as _i59;
import '../repository/implementations/wallet_implementation.dart' as _i61;
import '../repository/market_place_repository.dart' as _i54;
import '../repository/network_connection_repository.dart' as _i24;
import '../repository/nft_repository.dart' as _i35;
import '../repository/spending_repository.dart' as _i56;
import '../repository/transaction_repository.dart' as _i37;
import '../repository/user_repository.dart' as _i58;
import '../repository/wallet_repository.dart' as _i60;
import '../usecase/activation_code_setting_usecase.dart' as _i83;
import '../usecase/add_item_to_bed_usecase.dart' as _i84;
import '../usecase/approve_usecase.dart' as _i85;
import '../usecase/buy_nft_usecase.dart' as _i86;
import '../usecase/change_password_usecase.dart' as _i87;
import '../usecase/check_activation_code_usecase.dart' as _i88;
import '../usecase/check_approve_usecase.dart' as _i89;
import '../usecase/compound_usecase.dart' as _i91;
import '../usecase/create_pass_code_usecase.dart' as _i92;
import '../usecase/create_password_usecase.dart' as _i93;
import '../usecase/current_user_usecase.dart' as _i95;
import '../usecase/estimate_gas_withdraw.dart' as _i97;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i48;
import '../usecase/fetch_balance_spending_usecase.dart' as _i98;
import '../usecase/fetch_bed_usecase.dart' as _i99;
import '../usecase/fetch_item_owner_usecase.dart' as _i10;
import '../usecase/get_amount_out_min_usecase.dart' as _i100;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i101;
import '../usecase/get_balance_token_usecase.dart' as _i102;
import '../usecase/get_current_network_usecase.dart' as _i104;
import '../usecase/get_global_config.dart' as _i105;
import '../usecase/get_history_transaction_usecase.dart' as _i106;
import '../usecase/get_list_nft_detail_usecase.dart' as _i49;
import '../usecase/get_market_place_usecase.dart' as _i68;
import '../usecase/get_network_connection_usecase.dart' as _i34;
import '../usecase/get_nfts_balance_usecase.dart' as _i50;
import '../usecase/get_nfts_ids_usecase.dart' as _i51;
import '../usecase/get_user_usecase.dart' as _i107;
import '../usecase/has_wallet_usecase.dart' as _i108;
import '../usecase/is_first_open_app_usecase.dart' as _i63;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i39;
import '../usecase/is_passcode_created_usecase.dart' as _i64;
import '../usecase/is_valid_wallet_address_usecase.dart' as _i14;
import '../usecase/login_usecase.dart' as _i65;
import '../usecase/logout_usecase.dart' as _i66;
import '../usecase/make_first_open_app_usecase.dart' as _i67;
import '../usecase/on_connection_changed_usecase.dart' as _i27;
import '../usecase/remove_item_from_bed_usecase.dart' as _i69;
import '../usecase/run_app_init_usecase.dart' as _i28;
import '../usecase/send_nft_to_spending_usecase.dart' as _i41;
import '../usecase/send_otp_mail_usecase.dart' as _i70;
import '../usecase/send_to_external_usecase.dart' as _i42;
import '../usecase/send_token_to_external.dart' as _i43;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i44;
import '../usecase/setting_active_code_usecase.dart' as _i71;
import '../usecase/sign_up_usecase.dart' as _i72;
import '../usecase/staking_info_usecase.dart' as _i73;
import '../usecase/staking_usecase.dart' as _i74;
import '../usecase/swap_token_usecase.dart' as _i75;
import '../usecase/to_spending_usecase.dart' as _i76;
import '../usecase/transfer_nft_usecase.dart' as _i46;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i77;
import '../usecase/unstaking_usecase.dart' as _i78;
import '../usecase/validate_mnemonic.dart' as _i79;
import '../usecase/validate_passcode_usecase.dart' as _i80;
import '../usecase/verify_otp_usecase.dart' as _i81;
import '../usecase/wallet/create_wallet_usecase.dart' as _i94;
import '../usecase/wallet/current_wallet_usecase.dart' as _i96;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i90;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i103;
import '../usecase/wallet/import_wallet_usecase.dart' as _i62;
import '../usecase/withdraw_history_usecase.dart' as _i82;
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
  gh.factory<_i10.FetchItemOwnerUseCase>(() => _i10.FetchItemOwnerUseCase());
  gh.factory<_i11.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i12.GetStorage>(() => registerModule.getStorage);
  gh.factory<_i13.GetStorageDataSource>(
      () => _i13.GetStorageDataSource(get<_i12.GetStorage>()));
  gh.factory<_i14.IsValidWalletAddressUseCase>(
      () => _i14.IsValidWalletAddressUseCase());
  await gh.factoryAsync<_i15.Isar>(
      () => registerModule.isar(get<_i9.Directory>()),
      preResolve: true);
  gh.singleton<_i16.IsarDataSource>(_i16.IsarDataSource(get<_i15.Isar>()));
  gh.factory<_i17.NetworkConnectionDataSource>(
      () => _i17.NetworkConnectionDataSource(get<_i5.Connectivity>()));
  gh.factory<_i18.NftApi>(() => _i18.NftApi(get<_i8.Dio>()));
  gh.factory<_i19.RandomUtils>(() => _i19.RandomUtils());
  await gh.factoryAsync<_i20.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i13.StorageKeys>(() => _i13.StorageKeys());
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
  gh.factory<_i29.SecureStorage>(() => _i29.SecureStorage(
      get<_i11.FlutterSecureStorage>(), get<_i20.SharedPreferences>()));
  gh.factory<_i30.SharedPreferenceDataSource>(
      () => _i30.SharedPreferenceDataSource(get<_i20.SharedPreferences>()));
  gh.factory<_i31.SpendingDataSource>(
      () => _i31.SpendingDataSource(get<_i22.Web3Provider>()));
  gh.factory<_i32.Web3DataSource>(
      () => _i32.Web3DataSource(get<_i22.Web3Provider>()));
  gh.factory<_i33.AuthInterceptor>(
      () => _i33.AuthInterceptor(get<_i29.SecureStorage>(), get<_i8.Dio>()));
  gh.factory<_i34.GetNetworkConnectionUseCase>(() =>
      _i34.GetNetworkConnectionUseCase(
          get<_i24.INetworkConnectionRepository>()));
  gh.factory<_i35.INFTRepository>(() => _i36.NFTImplementation(
      get<_i26.NFTDataSource>(),
      get<_i18.NftApi>(),
      get<_i29.SecureStorage>()));
  gh.factory<_i37.ITransactionRepository>(() => _i38.TransactionImplementation(
      get<_i32.Web3DataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i23.HistoryDataSource>()));
  gh.factory<_i39.IsNftApproveForAllUseCase>(
      () => _i39.IsNftApproveForAllUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i40.RefreshTokenInterceptor>(() =>
      _i40.RefreshTokenInterceptor(get<_i29.SecureStorage>(), get<_i8.Dio>()));
  gh.factory<_i41.SendNftToSpendingUseCase>(() => _i41.SendNftToSpendingUseCase(
      get<_i35.INFTRepository>(), get<_i29.SecureStorage>()));
  gh.factory<_i42.SendToExternalUseCase>(
      () => _i42.SendToExternalUseCase(get<_i37.ITransactionRepository>()));
  gh.factory<_i43.SendTokenToExternalUseCase>(() =>
      _i43.SendTokenToExternalUseCase(get<_i37.ITransactionRepository>()));
  gh.factory<_i44.SetNftApprovalForAllUseCase>(
      () => _i44.SetNftApprovalForAllUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i45.TransactionRemoteDataSource>(() =>
      _i45.TransactionRemoteDataSource(
          get<_i23.HistoryDataSource>(),
          get<_i32.Web3DataSource>(),
          get<_i13.GetStorageDataSource>(),
          get<_i16.IsarDataSource>(),
          get<_i8.Dio>()));
  gh.factory<_i46.TransferNftUseCase>(
      () => _i46.TransferNftUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i47.AuthDataSource>(() => _i47.AuthDataSource(get<_i8.Dio>(),
      get<_i33.AuthInterceptor>(), get<_i40.RefreshTokenInterceptor>()));
  gh.factory<_i48.EstimateNftFunctionFeeUseCase>(
      () => _i48.EstimateNftFunctionFeeUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i49.GetListNftDetailUseCase>(
      () => _i49.GetListNftDetailUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i50.GetNFTsBalanceUseCase>(
      () => _i50.GetNFTsBalanceUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i51.GetNFTsIDsUseCase>(
      () => _i51.GetNFTsIDsUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i52.IAuthRepository>(() => _i53.AuthImplementation(
      get<_i29.SecureStorage>(),
      get<_i47.AuthDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i13.GetStorageDataSource>()));
  gh.factory<_i54.IMarketPlaceRepository>(
      () => _i55.TransactionImplementation(get<_i47.AuthDataSource>()));
  gh.factory<_i56.ISpendingRepository>(() => _i57.SpendingImplementation(
      get<_i31.SpendingDataSource>(),
      get<_i32.Web3DataSource>(),
      get<_i47.AuthDataSource>()));
  gh.factory<_i58.IUserRepository>(() => _i59.UserImplementation(
      get<_i47.AuthDataSource>(), get<_i29.SecureStorage>()));
  gh.factory<_i60.IWalletRepository>(() => _i61.WalletImplementation(
      get<_i32.Web3DataSource>(),
      get<_i13.GetStorageDataSource>(),
      get<_i45.TransactionRemoteDataSource>(),
      get<_i16.IsarDataSource>(),
      get<_i22.Web3Provider>(),
      get<_i29.SecureStorage>(),
      get<_i47.AuthDataSource>()));
  gh.factory<_i62.ImportWalletUseCase>(
      () => _i62.ImportWalletUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i63.IsFirstOpenAppUseCase>(
      () => _i63.IsFirstOpenAppUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i64.IsPassCodeCreatedUseCase>(
      () => _i64.IsPassCodeCreatedUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i65.LogInUseCase>(
      () => _i65.LogInUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i66.LogOutUseCase>(
      () => _i66.LogOutUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i67.MakeFirstOpenAppUseCase>(
      () => _i67.MakeFirstOpenAppUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i68.MarketPlaceUseCase>(
      () => _i68.MarketPlaceUseCase(get<_i54.IMarketPlaceRepository>()));
  gh.factory<_i69.RemoveItemFromBedUseCase>(
      () => _i69.RemoveItemFromBedUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i70.SendOTPMailUseCase>(
      () => _i70.SendOTPMailUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i71.SettingActiveCodeUseCase>(
      () => _i71.SettingActiveCodeUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i72.SignUpUseCase>(
      () => _i72.SignUpUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i73.StakingInfoUseCase>(
      () => _i73.StakingInfoUseCase(get<_i56.ISpendingRepository>()));
  gh.factory<_i74.StakingUseCase>(
      () => _i74.StakingUseCase(get<_i56.ISpendingRepository>()));
  gh.factory<_i75.SwapTokenUseCase>(
      () => _i75.SwapTokenUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i76.ToSpendingUseCase>(() => _i76.ToSpendingUseCase(
      get<_i56.ISpendingRepository>(), get<_i60.IWalletRepository>()));
  gh.factory<_i77.TransferTokenToMainWalletUseCase>(
      () => _i77.TransferTokenToMainWalletUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i78.UnStakingUseCase>(
      () => _i78.UnStakingUseCase(get<_i56.ISpendingRepository>()));
  gh.factory<_i79.ValidateMnemonicUseCase>(
      () => _i79.ValidateMnemonicUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i80.ValidatePassCodeUseCase>(
      () => _i80.ValidatePassCodeUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i81.VerifyOTPUseCase>(
      () => _i81.VerifyOTPUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i82.WithdrawHistoryUseCase>(
      () => _i82.WithdrawHistoryUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i83.ActivationCodeSettingUseCase>(
      () => _i83.ActivationCodeSettingUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i84.AddItemToBedUseCase>(
      () => _i84.AddItemToBedUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i85.ApproveUseCase>(() => _i85.ApproveUseCase(
      get<_i56.ISpendingRepository>(), get<_i60.IWalletRepository>()));
  gh.factory<_i86.BuyNFTUseCase>(
      () => _i86.BuyNFTUseCase(get<_i54.IMarketPlaceRepository>()));
  gh.factory<_i87.ChangePasswordUseCase>(
      () => _i87.ChangePasswordUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i88.CheckActivationCodeUseCase>(
      () => _i88.CheckActivationCodeUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i89.CheckApproveUseCase>(
      () => _i89.CheckApproveUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i90.CheckFirstOpenWallet>(
      () => _i90.CheckFirstOpenWallet(get<_i60.IWalletRepository>()));
  gh.factory<_i91.CompoundUseCase>(
      () => _i91.CompoundUseCase(get<_i56.ISpendingRepository>()));
  gh.factory<_i92.CreatePassCodeUseCase>(
      () => _i92.CreatePassCodeUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i93.CreatePasswordUseCase>(
      () => _i93.CreatePasswordUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i94.CreateWalletUseCase>(
      () => _i94.CreateWalletUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i95.CurrentUserUseCase>(
      () => _i95.CurrentUserUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i96.CurrentWalletUseCase>(
      () => _i96.CurrentWalletUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i97.EstimateGasWithdrawUseCase>(
      () => _i97.EstimateGasWithdrawUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i98.FetchBalanceSpendingUseCase>(
      () => _i98.FetchBalanceSpendingUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i99.FetchBedUseCase>(
      () => _i99.FetchBedUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i100.GetAmountOutMinUseCase>(
      () => _i100.GetAmountOutMinUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i101.GetBalanceForTokensUseCase>(
      () => _i101.GetBalanceForTokensUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i102.GetBalanceTokenUseCase>(
      () => _i102.GetBalanceTokenUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i103.GetCurrentMnemonicUsecase>(
      () => _i103.GetCurrentMnemonicUsecase(get<_i60.IWalletRepository>()));
  gh.factory<_i104.GetCurrentNetworkUseCase>(
      () => _i104.GetCurrentNetworkUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i105.GetGlobalConfigUseCase>(
      () => _i105.GetGlobalConfigUseCase(get<_i58.IUserRepository>()));
  gh.factory<_i106.GetHistoryTransactionUseCase>(
      () => _i106.GetHistoryTransactionUseCase(get<_i60.IWalletRepository>()));
  gh.factory<_i107.GetUserUseCase>(
      () => _i107.GetUserUseCase(get<_i52.IAuthRepository>()));
  gh.factory<_i108.HasWalletUseCase>(
      () => _i108.HasWalletUseCase(get<_i60.IWalletRepository>()));
  return get;
}

class _$RPCModule extends _i32.RPCModule {}

class _$RegisterModule extends _i109.RegisterModule {}
