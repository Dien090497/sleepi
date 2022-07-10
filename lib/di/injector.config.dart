// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i8;

import 'package:dio/dio.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i10;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i12;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../common/contract_addresses/contract_addresses.dart' as _i5;
import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i6;
import '../common/utils/random_utils.dart' as _i15;
import '../common/utils/toast_utils.dart' as _i17;
import '../datasources/local/get_storage_datasource.dart' as _i11;
import '../datasources/local/history_datasource.dart' as _i19;
import '../datasources/local/isar/isar_datasource.dart' as _i13;
import '../datasources/local/secure_storage.dart' as _i22;
import '../datasources/local/shared_preference_datasource.dart' as _i23;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i39;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i26;
import '../datasources/remote/auth_datasource/refresh_token_interceptor.dart'
    as _i32;
import '../datasources/remote/network/nft_datasource.dart' as _i20;
import '../datasources/remote/network/spending_datasource.dart' as _i24;
import '../datasources/remote/network/web3_datasource.dart' as _i25;
import '../datasources/remote/network/web3_provider.dart' as _i18;
import '../datasources/remote/nft_api/nft_api.dart' as _i14;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i37;
import '../repository/auth_repository.dart' as _i44;
import '../repository/implementations/auth_implementation.dart' as _i45;
import '../repository/implementations/market_place_implementation.dart' as _i47;
import '../repository/implementations/nft_implementation.dart' as _i28;
import '../repository/implementations/spending_implementation.dart' as _i49;
import '../repository/implementations/transaction_implementation.dart' as _i30;
import '../repository/implementations/user_implementations.dart' as _i51;
import '../repository/implementations/wallet_implementation.dart' as _i53;
import '../repository/market_place_repository.dart' as _i46;
import '../repository/nft_repository.dart' as _i27;
import '../repository/spending_repository.dart' as _i48;
import '../repository/transaction_repository.dart' as _i29;
import '../repository/user_repository.dart' as _i50;
import '../repository/wallet_repository.dart' as _i52;
import '../usecase/activation_code_setting_usecase.dart' as _i75;
import '../usecase/add_item_to_bed_usecase.dart' as _i76;
import '../usecase/approve_usecase.dart' as _i77;
import '../usecase/buy_nft_usecase.dart' as _i78;
import '../usecase/change_password_usecase.dart' as _i79;
import '../usecase/check_activation_code_usecase.dart' as _i80;
import '../usecase/check_approve_usecase.dart' as _i81;
import '../usecase/compound_usecase.dart' as _i83;
import '../usecase/create_pass_code_usecase.dart' as _i84;
import '../usecase/create_password_usecase.dart' as _i85;
import '../usecase/current_user_usecase.dart' as _i87;
import '../usecase/estimate_gas_withdraw.dart' as _i89;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i40;
import '../usecase/fetch_balance_spending_usecase.dart' as _i90;
import '../usecase/fetch_bed_usecase.dart' as _i91;
import '../usecase/get_amount_out_min_usecase.dart' as _i92;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i93;
import '../usecase/get_balance_token_usecase.dart' as _i94;
import '../usecase/get_current_network_usecase.dart' as _i96;
import '../usecase/get_global_config.dart' as _i97;
import '../usecase/get_history_transaction_usecase.dart' as _i98;
import '../usecase/get_list_nft_detail_usecase.dart' as _i41;
import '../usecase/get_market_place_usecase.dart' as _i60;
import '../usecase/get_nfts_balance_usecase.dart' as _i42;
import '../usecase/get_nfts_ids_usecase.dart' as _i43;
import '../usecase/get_user_usecase.dart' as _i99;
import '../usecase/is_first_open_app_usecase.dart' as _i55;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i31;
import '../usecase/is_passcode_created_usecase.dart' as _i56;
import '../usecase/login_usecase.dart' as _i57;
import '../usecase/logout_usecase.dart' as _i58;
import '../usecase/make_first_open_app_usecase.dart' as _i59;
import '../usecase/remove_item_in_bed_usecase.dart' as _i61;
import '../usecase/run_app_init_usecase.dart' as _i21;
import '../usecase/send_nft_to_spending_usecase.dart' as _i33;
import '../usecase/send_otp_mail_usecase.dart' as _i62;
import '../usecase/send_to_external_usecase.dart' as _i34;
import '../usecase/send_token_to_external.dart' as _i35;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i36;
import '../usecase/setting_active_code_usecase.dart' as _i63;
import '../usecase/sign_up_usecase.dart' as _i64;
import '../usecase/staking_info_usecase.dart' as _i65;
import '../usecase/staking_usecase.dart' as _i66;
import '../usecase/swap_token_usecase.dart' as _i67;
import '../usecase/to_spending_usecase.dart' as _i68;
import '../usecase/transfer_nft_usecase.dart' as _i38;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i69;
import '../usecase/unstaking_usecase.dart' as _i70;
import '../usecase/validate_mnemonic.dart' as _i71;
import '../usecase/validate_passcode_usecase.dart' as _i72;
import '../usecase/verify_otp_usecase.dart' as _i73;
import '../usecase/wallet/create_wallet_usecase.dart' as _i86;
import '../usecase/wallet/current_wallet_usecase.dart' as _i88;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i82;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i95;
import '../usecase/wallet/import_wallet_usecase.dart' as _i54;
import '../usecase/withdraw_history_usecase.dart' as _i74;
import 'register_module.dart' as _i100; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final rPCModule = _$RPCModule();
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppFlyerCustom>(_i3.AppFlyerCustom());
  gh.factory<_i4.Client>(() => rPCModule.httpClient);
  gh.factory<_i5.ContractAddresses>(() => _i5.ContractAddresses());
  gh.factory<_i6.DateTimeUtils>(() => _i6.DateTimeUtils());
  gh.factory<_i7.Dio>(() => registerModule.dio);
  await gh.factoryAsync<_i8.Directory>(() => registerModule.isarDir,
      preResolve: true);
  gh.factory<_i9.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i10.GetStorage>(() => registerModule.getStorage);
  gh.factory<_i11.GetStorageDataSource>(
      () => _i11.GetStorageDataSource(get<_i10.GetStorage>()));
  await gh.factoryAsync<_i12.Isar>(
      () => registerModule.isar(get<_i8.Directory>()),
      preResolve: true);
  gh.singleton<_i13.IsarDataSource>(_i13.IsarDataSource(get<_i12.Isar>()));
  gh.factory<_i14.NftApi>(() => _i14.NftApi(get<_i7.Dio>()));
  gh.factory<_i15.RandomUtils>(() => _i15.RandomUtils());
  await gh.factoryAsync<_i16.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i11.StorageKeys>(() => _i11.StorageKeys());
  gh.factory<_i17.ToastUtils>(() => _i17.ToastUtils());
  gh.singleton<_i18.Web3Provider>(_i18.Web3Provider(get<_i4.Client>()));
  gh.factory<_i19.HistoryDataSource>(
      () => _i19.HistoryDataSource(get<_i12.Isar>()));
  gh.factory<_i20.NFTDataSource>(
      () => _i20.NFTDataSource(get<_i18.Web3Provider>()));
  gh.factory<_i21.RunAppInitUseCase>(() => _i21.RunAppInitUseCase(
      get<_i18.Web3Provider>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i22.SecureStorage>(() => _i22.SecureStorage(
      get<_i9.FlutterSecureStorage>(), get<_i16.SharedPreferences>()));
  gh.factory<_i23.SharedPreferenceDataSource>(
      () => _i23.SharedPreferenceDataSource(get<_i16.SharedPreferences>()));
  gh.factory<_i24.SpendingDataSource>(
      () => _i24.SpendingDataSource(get<_i18.Web3Provider>()));
  gh.factory<_i25.Web3DataSource>(
      () => _i25.Web3DataSource(get<_i18.Web3Provider>()));
  gh.factory<_i26.AuthInterceptor>(
      () => _i26.AuthInterceptor(get<_i22.SecureStorage>(), get<_i7.Dio>()));
  gh.factory<_i27.INFTRepository>(() => _i28.NFTImplementation(
      get<_i20.NFTDataSource>(),
      get<_i14.NftApi>(),
      get<_i22.SecureStorage>()));
  gh.factory<_i29.ITransactionRepository>(() => _i30.TransactionImplementation(
      get<_i25.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i19.HistoryDataSource>()));
  gh.factory<_i31.IsNftApproveForAllUseCase>(
      () => _i31.IsNftApproveForAllUseCase(get<_i27.INFTRepository>()));
  gh.factory<_i32.RefreshTokenInterceptor>(() =>
      _i32.RefreshTokenInterceptor(get<_i22.SecureStorage>(), get<_i7.Dio>()));
  gh.factory<_i33.SendNftToSpendingUseCase>(
      () => _i33.SendNftToSpendingUseCase(get<_i27.INFTRepository>()));
  gh.factory<_i34.SendToExternalUseCase>(
      () => _i34.SendToExternalUseCase(get<_i29.ITransactionRepository>()));
  gh.factory<_i35.SendTokenToExternalUseCase>(() =>
      _i35.SendTokenToExternalUseCase(get<_i29.ITransactionRepository>()));
  gh.factory<_i36.SetNftApprovalForAllUseCase>(
      () => _i36.SetNftApprovalForAllUseCase(get<_i27.INFTRepository>()));
  gh.factory<_i37.TransactionRemoteDataSource>(() =>
      _i37.TransactionRemoteDataSource(
          get<_i19.HistoryDataSource>(),
          get<_i25.Web3DataSource>(),
          get<_i11.GetStorageDataSource>(),
          get<_i13.IsarDataSource>(),
          get<_i7.Dio>()));
  gh.factory<_i38.TransferNftUseCase>(
      () => _i38.TransferNftUseCase(get<_i27.INFTRepository>()));
  gh.factory<_i39.AuthDataSource>(() => _i39.AuthDataSource(get<_i7.Dio>(),
      get<_i26.AuthInterceptor>(), get<_i32.RefreshTokenInterceptor>()));
  gh.factory<_i40.EstimateNftFunctionFeeUseCase>(
      () => _i40.EstimateNftFunctionFeeUseCase(get<_i27.INFTRepository>()));
  gh.factory<_i41.GetListNftDetailUseCase>(
      () => _i41.GetListNftDetailUseCase(get<_i27.INFTRepository>()));
  gh.factory<_i42.GetNFTsBalanceUseCase>(
      () => _i42.GetNFTsBalanceUseCase(get<_i27.INFTRepository>()));
  gh.factory<_i43.GetNFTsIDsUseCase>(
      () => _i43.GetNFTsIDsUseCase(get<_i27.INFTRepository>()));
  gh.factory<_i44.IAuthRepository>(() => _i45.AuthImplementation(
      get<_i22.SecureStorage>(),
      get<_i39.AuthDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>()));
  gh.factory<_i46.IMarketPlaceRepository>(
      () => _i47.TransactionImplementation(get<_i39.AuthDataSource>()));
  gh.factory<_i48.ISpendingRepository>(() => _i49.SpendingImplementation(
      get<_i24.SpendingDataSource>(),
      get<_i25.Web3DataSource>(),
      get<_i39.AuthDataSource>()));
  gh.factory<_i50.IUserRepository>(() => _i51.UserImplementation(
      get<_i39.AuthDataSource>(), get<_i22.SecureStorage>()));
  gh.factory<_i52.IWalletRepository>(() => _i53.WalletImplementation(
      get<_i25.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i37.TransactionRemoteDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i18.Web3Provider>(),
      get<_i22.SecureStorage>(),
      get<_i39.AuthDataSource>()));
  gh.factory<_i54.ImportWalletUseCase>(
      () => _i54.ImportWalletUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i55.IsFirstOpenAppUseCase>(
      () => _i55.IsFirstOpenAppUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i56.IsPassCodeCreatedUseCase>(
      () => _i56.IsPassCodeCreatedUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i57.LogInUseCase>(
      () => _i57.LogInUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i58.LogOutUseCase>(
      () => _i58.LogOutUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i59.MakeFirstOpenAppUseCase>(
      () => _i59.MakeFirstOpenAppUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i60.MarketPlaceUseCase>(
      () => _i60.MarketPlaceUseCase(get<_i46.IMarketPlaceRepository>()));
  gh.factory<_i61.RemoveItemInBedUseCase>(
      () => _i61.RemoveItemInBedUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i62.SendOTPMailUseCase>(
      () => _i62.SendOTPMailUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i63.SettingActiveCodeUseCase>(
      () => _i63.SettingActiveCodeUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i64.SignUpUseCase>(
      () => _i64.SignUpUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i65.StakingInfoUseCase>(
      () => _i65.StakingInfoUseCase(get<_i48.ISpendingRepository>()));
  gh.factory<_i66.StakingUseCase>(
      () => _i66.StakingUseCase(get<_i48.ISpendingRepository>()));
  gh.factory<_i67.SwapTokenUseCase>(
      () => _i67.SwapTokenUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i68.ToSpendingUseCase>(() => _i68.ToSpendingUseCase(
      get<_i48.ISpendingRepository>(), get<_i52.IWalletRepository>()));
  gh.factory<_i69.TransferTokenToMainWalletUseCase>(
      () => _i69.TransferTokenToMainWalletUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i70.UnStakingUseCase>(
      () => _i70.UnStakingUseCase(get<_i48.ISpendingRepository>()));
  gh.factory<_i71.ValidateMnemonicUseCase>(
      () => _i71.ValidateMnemonicUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i72.ValidatePassCodeUseCase>(
      () => _i72.ValidatePassCodeUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i73.VerifyOTPUseCase>(
      () => _i73.VerifyOTPUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i74.WithdrawHistoryUseCase>(
      () => _i74.WithdrawHistoryUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i75.ActivationCodeSettingUseCase>(
      () => _i75.ActivationCodeSettingUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i76.AddItemToBedUseCase>(
      () => _i76.AddItemToBedUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i77.ApproveUseCase>(() => _i77.ApproveUseCase(
      get<_i48.ISpendingRepository>(), get<_i52.IWalletRepository>()));
  gh.factory<_i78.BuyNFTUseCase>(
      () => _i78.BuyNFTUseCase(get<_i46.IMarketPlaceRepository>()));
  gh.factory<_i79.ChangePasswordUseCase>(
      () => _i79.ChangePasswordUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i80.CheckActivationCodeUseCase>(
      () => _i80.CheckActivationCodeUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i81.CheckApproveUseCase>(
      () => _i81.CheckApproveUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i82.CheckFirstOpenWallet>(
      () => _i82.CheckFirstOpenWallet(get<_i52.IWalletRepository>()));
  gh.factory<_i83.CompoundUseCase>(
      () => _i83.CompoundUseCase(get<_i48.ISpendingRepository>()));
  gh.factory<_i84.CreatePassCodeUseCase>(
      () => _i84.CreatePassCodeUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i85.CreatePasswordUseCase>(
      () => _i85.CreatePasswordUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i86.CreateWalletUseCase>(
      () => _i86.CreateWalletUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i87.CurrentUserUseCase>(
      () => _i87.CurrentUserUseCase(get<_i44.IAuthRepository>()));
  gh.factory<_i88.CurrentWalletUseCase>(
      () => _i88.CurrentWalletUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i89.EstimateGasWithdrawUseCase>(
      () => _i89.EstimateGasWithdrawUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i90.FetchBalanceSpendingUseCase>(
      () => _i90.FetchBalanceSpendingUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i91.FetchBedUseCase>(
      () => _i91.FetchBedUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i92.GetAmountOutMinUseCase>(
      () => _i92.GetAmountOutMinUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i93.GetBalanceForTokensUseCase>(
      () => _i93.GetBalanceForTokensUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i94.GetBalanceTokenUseCase>(
      () => _i94.GetBalanceTokenUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i95.GetCurrentMnemonicUsecase>(
      () => _i95.GetCurrentMnemonicUsecase(get<_i52.IWalletRepository>()));
  gh.factory<_i96.GetCurrentNetworkUseCase>(
      () => _i96.GetCurrentNetworkUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i97.GetGlobalConfigUseCase>(
      () => _i97.GetGlobalConfigUseCase(get<_i50.IUserRepository>()));
  gh.factory<_i98.GetHistoryTransactionUseCase>(
      () => _i98.GetHistoryTransactionUseCase(get<_i52.IWalletRepository>()));
  gh.factory<_i99.GetUserUseCase>(
      () => _i99.GetUserUseCase(get<_i44.IAuthRepository>()));
  return get;
}

class _$RPCModule extends _i25.RPCModule {}

class _$RegisterModule extends _i100.RegisterModule {}
