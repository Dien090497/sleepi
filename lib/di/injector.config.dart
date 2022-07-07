// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i11;

import 'package:dio/dio.dart' as _i10;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i15;
import 'package:http/http.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i17;
import 'package:shared_preferences/shared_preferences.dart' as _i21;

import '../common/contract_addresses/contract_addresses.dart' as _i8;
import '../common/utils/appsflyer_custom.dart' as _i5;
import '../common/utils/date_time_utils.dart' as _i9;
import '../common/utils/random_utils.dart' as _i20;
import '../common/utils/toast_utils.dart' as _i22;
import '../datasources/local/get_storage_datasource.dart' as _i16;
import '../datasources/local/history_datasource.dart' as _i25;
import '../datasources/local/isar/isar_datasource.dart' as _i18;
import '../datasources/local/secure_storage.dart' as _i28;
import '../datasources/local/shared_preference_datasource.dart' as _i29;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i46;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i32;
import '../datasources/remote/network/nft_datasource.dart' as _i26;
import '../datasources/remote/network/spending_datasource.dart' as _i30;
import '../datasources/remote/network/web3_datasource.dart' as _i31;
import '../datasources/remote/network/web3_provider.dart' as _i24;
import '../datasources/remote/nft_api/nft_api.dart' as _i19;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i44;
import '../repository/auth_repository.dart' as _i51;
import '../repository/implementations/auth_implementation.dart' as _i52;
import '../repository/implementations/market_place_implementation.dart' as _i54;
import '../repository/implementations/nft_implementation.dart' as _i34;
import '../repository/implementations/spending_implementation.dart' as _i36;
import '../repository/implementations/transaction_implementation.dart' as _i38;
import '../repository/implementations/wallet_implementation.dart' as _i56;
import '../repository/market_place_repository.dart' as _i53;
import '../repository/nft_repository.dart' as _i33;
import '../repository/spending_repository.dart' as _i35;
import '../repository/transaction_repository.dart' as _i37;
import '../repository/user_repository.dart' as _i4;
import '../repository/wallet_repository.dart' as _i55;
import '../usecase/activation_code_setting_usecase.dart' as _i3;
import '../usecase/approve_usecase.dart' as _i72;
import '../usecase/change_password_usecase.dart' as _i6;
import '../usecase/check_activation_code_usecase.dart' as _i73;
import '../usecase/check_approve_usecase.dart' as _i74;
import '../usecase/create_pass_code_usecase.dart' as _i76;
import '../usecase/create_password_usecase.dart' as _i77;
import '../usecase/current_user_usecase.dart' as _i79;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i47;
import '../usecase/fetch_balance_spending_usecase.dart' as _i12;
import '../usecase/get_amount_out_min_usecase.dart' as _i81;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i82;
import '../usecase/get_balance_token_usecase.dart' as _i83;
import '../usecase/get_current_network_usecase.dart' as _i85;
import '../usecase/get_global_config.dart' as _i14;
import '../usecase/get_history_transaction_usecase.dart' as _i86;
import '../usecase/get_list_nft_detail_usecase.dart' as _i48;
import '../usecase/get_market_place_usecase.dart' as _i63;
import '../usecase/get_nfts_balance_usecase.dart' as _i49;
import '../usecase/get_nfts_ids_usecase.dart' as _i50;
import '../usecase/is_first_open_app_usecase.dart' as _i58;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i39;
import '../usecase/is_passcode_created_usecase.dart' as _i59;
import '../usecase/login_usecase.dart' as _i60;
import '../usecase/logout_usecase.dart' as _i61;
import '../usecase/make_first_open_app_usecase.dart' as _i62;
import '../usecase/run_app_init_usecase.dart' as _i27;
import '../usecase/send_nft_to_spending_usecase.dart' as _i40;
import '../usecase/send_otp_mail_usecase.dart' as _i64;
import '../usecase/send_to_external_usecase.dart' as _i41;
import '../usecase/send_token_to_external.dart' as _i42;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i43;
import '../usecase/setting_active_code_usecase.dart' as _i65;
import '../usecase/sign_up_usecase.dart' as _i66;
import '../usecase/swap_token_usecase.dart' as _i67;
import '../usecase/to_spending_usecase.dart' as _i68;
import '../usecase/transfer_nft_usecase.dart' as _i45;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i23;
import '../usecase/validate_mnemonic.dart' as _i69;
import '../usecase/validate_passcode_usecase.dart' as _i70;
import '../usecase/verify_otp_usecase.dart' as _i71;
import '../usecase/wallet/create_wallet_usecase.dart' as _i78;
import '../usecase/wallet/current_wallet_usecase.dart' as _i80;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i75;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i84;
import '../usecase/wallet/import_wallet_usecase.dart' as _i57;
import 'register_module.dart' as _i87; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final rPCModule = _$RPCModule();
  final registerModule = _$RegisterModule();
  gh.factory<_i3.ActivationCodeSettingUseCase>(
      () => _i3.ActivationCodeSettingUseCase(get<_i4.IUserRepository>()));
  gh.singleton<_i5.AppFlyerCustom>(_i5.AppFlyerCustom());
  gh.factory<_i6.ChangePasswordUseCase>(
      () => _i6.ChangePasswordUseCase(get<_i4.IUserRepository>()));
  gh.factory<_i7.Client>(() => rPCModule.httpClient);
  gh.factory<_i8.ContractAddresses>(() => _i8.ContractAddresses());
  gh.factory<_i9.DateTimeUtils>(() => _i9.DateTimeUtils());
  gh.factory<_i10.Dio>(() => registerModule.dio);
  await gh.factoryAsync<_i11.Directory>(() => registerModule.isarDir,
      preResolve: true);
  gh.factory<_i12.FetchBalanceSpendingUseCase>(
      () => _i12.FetchBalanceSpendingUseCase(get<_i4.IUserRepository>()));
  gh.factory<_i13.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i14.GetGlobalConfigUseCase>(
      () => _i14.GetGlobalConfigUseCase(get<_i4.IUserRepository>()));
  gh.factory<_i15.GetStorage>(() => registerModule.getStorage);
  gh.factory<_i16.GetStorageDataSource>(
      () => _i16.GetStorageDataSource(get<_i15.GetStorage>()));
  await gh.factoryAsync<_i17.Isar>(
      () => registerModule.isar(get<_i11.Directory>()),
      preResolve: true);
  gh.singleton<_i18.IsarDataSource>(_i18.IsarDataSource(get<_i17.Isar>()));
  gh.factory<_i19.NftApi>(() => _i19.NftApi(get<_i10.Dio>()));
  gh.factory<_i20.RandomUtils>(() => _i20.RandomUtils());
  await gh.factoryAsync<_i21.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i16.StorageKeys>(() => _i16.StorageKeys());
  gh.factory<_i22.ToastUtils>(() => _i22.ToastUtils());
  gh.factory<_i23.TransferTokenToMainWalletUseCase>(
      () => _i23.TransferTokenToMainWalletUseCase(get<_i4.IUserRepository>()));
  gh.singleton<_i24.Web3Provider>(_i24.Web3Provider(get<_i7.Client>()));
  gh.factory<_i25.HistoryDataSource>(
      () => _i25.HistoryDataSource(get<_i17.Isar>()));
  gh.factory<_i26.NFTDataSource>(
      () => _i26.NFTDataSource(get<_i24.Web3Provider>()));
  gh.factory<_i27.RunAppInitUseCase>(() => _i27.RunAppInitUseCase(
      get<_i24.Web3Provider>(),
      get<_i18.IsarDataSource>(),
      get<_i16.GetStorageDataSource>(),
      get<_i5.AppFlyerCustom>()));
  gh.factory<_i28.SecureStorage>(() => _i28.SecureStorage(
      get<_i13.FlutterSecureStorage>(), get<_i21.SharedPreferences>()));
  gh.factory<_i29.SharedPreferenceDataSource>(
      () => _i29.SharedPreferenceDataSource(get<_i21.SharedPreferences>()));
  gh.factory<_i30.SpendingDataSource>(
      () => _i30.SpendingDataSource(get<_i24.Web3Provider>()));
  gh.factory<_i31.Web3DataSource>(
      () => _i31.Web3DataSource(get<_i24.Web3Provider>()));
  gh.factory<_i32.AuthInterceptor>(
      () => _i32.AuthInterceptor(get<_i28.SecureStorage>(), get<_i10.Dio>()));
  gh.factory<_i33.INFTRepository>(() =>
      _i34.NFTImplementation(get<_i26.NFTDataSource>(), get<_i19.NftApi>()));
  gh.factory<_i35.ISpendingRepository>(() => _i36.SpendingImplementation(
      get<_i30.SpendingDataSource>(), get<_i31.Web3DataSource>()));
  gh.factory<_i37.ITransactionRepository>(() => _i38.TransactionImplementation(
      get<_i31.Web3DataSource>(),
      get<_i16.GetStorageDataSource>(),
      get<_i18.IsarDataSource>(),
      get<_i25.HistoryDataSource>()));
  gh.factory<_i39.IsNftApproveForAllUseCase>(
      () => _i39.IsNftApproveForAllUseCase(get<_i33.INFTRepository>()));
  gh.factory<_i40.SendNftToSpendingUseCase>(
      () => _i40.SendNftToSpendingUseCase(get<_i33.INFTRepository>()));
  gh.factory<_i41.SendToExternalUseCase>(
      () => _i41.SendToExternalUseCase(get<_i37.ITransactionRepository>()));
  gh.factory<_i42.SendTokenToExternalUseCase>(() =>
      _i42.SendTokenToExternalUseCase(get<_i37.ITransactionRepository>()));
  gh.factory<_i43.SetNftApprovalForAllUseCase>(
      () => _i43.SetNftApprovalForAllUseCase(get<_i33.INFTRepository>()));
  gh.factory<_i44.TransactionRemoteDataSource>(() =>
      _i44.TransactionRemoteDataSource(
          get<_i25.HistoryDataSource>(),
          get<_i31.Web3DataSource>(),
          get<_i16.GetStorageDataSource>(),
          get<_i18.IsarDataSource>(),
          get<_i10.Dio>()));
  gh.factory<_i45.TransferNftUseCase>(
      () => _i45.TransferNftUseCase(get<_i33.INFTRepository>()));
  gh.factory<_i46.AuthDataSource>(
      () => _i46.AuthDataSource(get<_i10.Dio>(), get<_i32.AuthInterceptor>()));
  gh.factory<_i47.EstimateNftFunctionFeeUseCase>(
      () => _i47.EstimateNftFunctionFeeUseCase(get<_i33.INFTRepository>()));
  gh.factory<_i48.GetListNftDetailUseCase>(
      () => _i48.GetListNftDetailUseCase(get<_i33.INFTRepository>()));
  gh.factory<_i49.GetNFTsBalanceUseCase>(
      () => _i49.GetNFTsBalanceUseCase(get<_i33.INFTRepository>()));
  gh.factory<_i50.GetNFTsIDsUseCase>(
      () => _i50.GetNFTsIDsUseCase(get<_i33.INFTRepository>()));
  gh.factory<_i51.IAuthRepository>(() => _i52.AuthImplementation(
      get<_i28.SecureStorage>(),
      get<_i46.AuthDataSource>(),
      get<_i18.IsarDataSource>(),
      get<_i16.GetStorageDataSource>()));
  gh.factory<_i53.IMarketPlaceRepository>(
      () => _i54.TransactionImplementation(get<_i46.AuthDataSource>()));
  gh.factory<_i55.IWalletRepository>(() => _i56.WalletImplementation(
      get<_i31.Web3DataSource>(),
      get<_i16.GetStorageDataSource>(),
      get<_i25.HistoryDataSource>(),
      get<_i44.TransactionRemoteDataSource>(),
      get<_i18.IsarDataSource>(),
      get<_i24.Web3Provider>(),
      get<_i28.SecureStorage>(),
      get<_i46.AuthDataSource>()));
  gh.factory<_i57.ImportWalletUseCase>(
      () => _i57.ImportWalletUseCase(get<_i55.IWalletRepository>()));
  gh.factory<_i58.IsFirstOpenAppUseCase>(
      () => _i58.IsFirstOpenAppUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i59.IsPassCodeCreatedUseCase>(
      () => _i59.IsPassCodeCreatedUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i60.LogInUseCase>(
      () => _i60.LogInUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i61.LogOutUseCase>(
      () => _i61.LogOutUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i62.MakeFirstOpenAppUseCase>(
      () => _i62.MakeFirstOpenAppUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i63.MarketPlaceUseCase>(
      () => _i63.MarketPlaceUseCase(get<_i53.IMarketPlaceRepository>()));
  gh.factory<_i64.SendOTPMailUseCase>(
      () => _i64.SendOTPMailUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i65.SettingActiveCodeUseCase>(
      () => _i65.SettingActiveCodeUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i66.SignUpUseCase>(
      () => _i66.SignUpUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i67.SwapTokenUseCase>(
      () => _i67.SwapTokenUseCase(get<_i55.IWalletRepository>()));
  gh.factory<_i68.ToSpendingUseCase>(() => _i68.ToSpendingUseCase(
      get<_i35.ISpendingRepository>(), get<_i55.IWalletRepository>()));
  gh.factory<_i69.ValidateMnemonicUseCase>(
      () => _i69.ValidateMnemonicUseCase(get<_i55.IWalletRepository>()));
  gh.factory<_i70.ValidatePassCodeUseCase>(
      () => _i70.ValidatePassCodeUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i71.VerifyOTPUseCase>(
      () => _i71.VerifyOTPUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i72.ApproveUseCase>(() => _i72.ApproveUseCase(
      get<_i35.ISpendingRepository>(), get<_i55.IWalletRepository>()));
  gh.factory<_i73.CheckActivationCodeUseCase>(
      () => _i73.CheckActivationCodeUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i74.CheckApproveUseCase>(
      () => _i74.CheckApproveUseCase(get<_i55.IWalletRepository>()));
  gh.factory<_i75.CheckFirstOpenWallet>(
      () => _i75.CheckFirstOpenWallet(get<_i55.IWalletRepository>()));
  gh.factory<_i76.CreatePassCodeUseCase>(
      () => _i76.CreatePassCodeUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i77.CreatePasswordUseCase>(
      () => _i77.CreatePasswordUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i78.CreateWalletUseCase>(
      () => _i78.CreateWalletUseCase(get<_i55.IWalletRepository>()));
  gh.factory<_i79.CurrentUserUseCase>(
      () => _i79.CurrentUserUseCase(get<_i51.IAuthRepository>()));
  gh.factory<_i80.CurrentWalletUseCase>(
      () => _i80.CurrentWalletUseCase(get<_i55.IWalletRepository>()));
  gh.factory<_i81.GetAmountOutMinUseCase>(
      () => _i81.GetAmountOutMinUseCase(get<_i55.IWalletRepository>()));
  gh.factory<_i82.GetBalanceForTokensUseCase>(
      () => _i82.GetBalanceForTokensUseCase(get<_i55.IWalletRepository>()));
  gh.factory<_i83.GetBalanceTokenUseCase>(
      () => _i83.GetBalanceTokenUseCase(get<_i55.IWalletRepository>()));
  gh.factory<_i84.GetCurrentMnemonicUsecase>(
      () => _i84.GetCurrentMnemonicUsecase(get<_i55.IWalletRepository>()));
  gh.factory<_i85.GetCurrentNetworkUseCase>(
      () => _i85.GetCurrentNetworkUseCase(get<_i55.IWalletRepository>()));
  gh.factory<_i86.GetHistoryTransactionUseCase>(
      () => _i86.GetHistoryTransactionUseCase(get<_i55.IWalletRepository>()));
  return get;
}

class _$RPCModule extends _i31.RPCModule {}

class _$RegisterModule extends _i87.RegisterModule {}
