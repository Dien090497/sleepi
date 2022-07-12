// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i15;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i8;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../common/contract_addresses/contract_addresses.dart' as _i5;
import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i6;
import '../common/utils/random_utils.dart' as _i16;
import '../common/utils/toast_utils.dart' as _i21;
import '../datasources/local/get_storage_datasource.dart' as _i7;
import '../datasources/local/history_datasource.dart' as _i9;
import '../datasources/local/isar/isar_datasource.dart' as _i12;
import '../datasources/local/network_connection_datasource.dart' as _i13;
import '../datasources/local/secure_storage.dart' as _i17;
import '../datasources/local/shared_preference_datasource.dart' as _i20;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i32;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i23;
import '../datasources/remote/auth_datasource/refresh_token_interceptor.dart'
    as _i28;
import '../datasources/remote/network/nft_datasource.dart' as _i26;
import '../datasources/remote/network/spending_datasource.dart' as _i30;
import '../datasources/remote/network/web3_datasource.dart' as _i31;
import '../datasources/remote/network/web3_provider.dart' as _i22;
import '../datasources/remote/nft_api/nft_api.dart' as _i14;
import '../datasources/remote/transaction_datasource/transaction_remote_datasource.dart'
    as _i66;
import '../repository/auth_repository.dart' as _i34;
import '../repository/implementations/auth_implementation.dart' as _i35;
import '../repository/implementations/market_place_implementation.dart' as _i37;
import '../repository/implementations/network_connection_implementation.dart'
    as _i25;
import '../repository/implementations/nft_implementation.dart' as _i39;
import '../repository/implementations/sleep_tracking_implementation.dart'
    as _i41;
import '../repository/implementations/spending_implementation.dart' as _i43;
import '../repository/implementations/transaction_implementation.dart' as _i45;
import '../repository/implementations/user_implementations.dart' as _i47;
import '../repository/implementations/wallet_implementation.dart' as _i92;
import '../repository/market_place_repository.dart' as _i36;
import '../repository/network_connection_repository.dart' as _i24;
import '../repository/nft_repository.dart' as _i38;
import '../repository/sleep_tracking_repository.dart' as _i40;
import '../repository/spending_repository.dart' as _i42;
import '../repository/transaction_repository.dart' as _i44;
import '../repository/user_repository.dart' as _i46;
import '../repository/wallet_repository.dart' as _i91;
import '../usecase/activation_code_setting_usecase.dart' as _i73;
import '../usecase/add_item_to_bed_usecase.dart' as _i74;
import '../usecase/approve_usecase.dart' as _i97;
import '../usecase/buy_nft_usecase.dart' as _i75;
import '../usecase/change_password_usecase.dart' as _i76;
import '../usecase/check_activation_code_usecase.dart' as _i77;
import '../usecase/check_approve_usecase.dart' as _i98;
import '../usecase/compound_usecase.dart' as _i78;
import '../usecase/create_pass_code_usecase.dart' as _i79;
import '../usecase/create_password_usecase.dart' as _i80;
import '../usecase/current_user_usecase.dart' as _i81;
import '../usecase/estimate_gas_withdraw.dart' as _i82;
import '../usecase/estimate_nft_function_fee_usecase.dart' as _i83;
import '../usecase/fetch_balance_spending_usecase.dart' as _i84;
import '../usecase/fetch_bed_usecase.dart' as _i85;
import '../usecase/get_amount_out_min_usecase.dart' as _i102;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i103;
import '../usecase/get_balance_token_usecase.dart' as _i104;
import '../usecase/get_current_network_usecase.dart' as _i106;
import '../usecase/get_global_config.dart' as _i86;
import '../usecase/get_history_transaction_usecase.dart' as _i107;
import '../usecase/get_list_nft_detail_usecase.dart' as _i87;
import '../usecase/get_market_place_usecase.dart' as _i54;
import '../usecase/get_network_connection_usecase.dart' as _i33;
import '../usecase/get_nfts_balance_usecase.dart' as _i88;
import '../usecase/get_nfts_ids_usecase.dart' as _i89;
import '../usecase/get_user_usecase.dart' as _i90;
import '../usecase/has_wallet_usecase.dart' as _i108;
import '../usecase/is_first_open_app_usecase.dart' as _i48;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i49;
import '../usecase/is_passcode_created_usecase.dart' as _i50;
import '../usecase/is_valid_wallet_address_usecase.dart' as _i11;
import '../usecase/login_usecase.dart' as _i51;
import '../usecase/logout_usecase.dart' as _i52;
import '../usecase/make_first_open_app_usecase.dart' as _i53;
import '../usecase/on_connection_changed_usecase.dart' as _i27;
import '../usecase/post_health_data_usecase.dart' as _i55;
import '../usecase/remove_item_from_bed_usecase.dart' as _i56;
import '../usecase/run_app_init_usecase.dart' as _i29;
import '../usecase/send_nft_to_spending_usecase.dart' as _i57;
import '../usecase/send_otp_mail_usecase.dart' as _i58;
import '../usecase/send_to_external_usecase.dart' as _i59;
import '../usecase/send_token_to_external.dart' as _i60;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i61;
import '../usecase/setting_active_code_usecase.dart' as _i62;
import '../usecase/sign_up_usecase.dart' as _i63;
import '../usecase/staking_info_usecase.dart' as _i64;
import '../usecase/staking_usecase.dart' as _i65;
import '../usecase/swap_token_usecase.dart' as _i94;
import '../usecase/to_spending_usecase.dart' as _i95;
import '../usecase/transfer_nft_usecase.dart' as _i67;
import '../usecase/transfer_token_to_main_wallet_usecase.dart' as _i68;
import '../usecase/unstaking_usecase.dart' as _i69;
import '../usecase/validate_mnemonic.dart' as _i96;
import '../usecase/validate_passcode_usecase.dart' as _i70;
import '../usecase/verify_otp_usecase.dart' as _i71;
import '../usecase/wallet/create_wallet_usecase.dart' as _i100;
import '../usecase/wallet/current_wallet_usecase.dart' as _i101;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i99;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i105;
import '../usecase/wallet/import_wallet_usecase.dart' as _i93;
import '../usecase/withdraw_history_usecase.dart'
    as _i72; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final rPCModule = _$RPCModule();
  gh.singleton<_i3.AppFlyerCustom>(_i3.AppFlyerCustom());
  gh.factory<_i4.Client>(() => rPCModule.httpClient);
  gh.factory<_i5.ContractAddresses>(() => _i5.ContractAddresses());
  gh.factory<_i6.DateTimeUtils>(() => _i6.DateTimeUtils());
  gh.factory<_i7.GetStorageDataSource>(
      () => _i7.GetStorageDataSource(get<_i8.GetStorage>()));
  gh.factory<_i9.HistoryDataSource>(
      () => _i9.HistoryDataSource(get<_i10.Isar>()));
  gh.factory<_i11.IsValidWalletAddressUseCase>(
      () => _i11.IsValidWalletAddressUseCase());
  gh.singleton<_i12.IsarDataSource>(_i12.IsarDataSource(get<_i10.Isar>()));
  gh.factory<_i13.NetworkConnectionDataSource>(
      () => _i13.NetworkConnectionDataSource(get<dynamic>()));
  gh.factory<_i14.NftApi>(() => _i14.NftApi(get<_i15.Dio>()));
  gh.factory<_i16.RandomUtils>(() => _i16.RandomUtils());
  gh.factory<_i17.SecureStorage>(() => _i17.SecureStorage(
      get<_i18.FlutterSecureStorage>(), get<_i19.SharedPreferences>()));
  gh.factory<_i20.SharedPreferenceDataSource>(
      () => _i20.SharedPreferenceDataSource(get<_i19.SharedPreferences>()));
  gh.factory<_i7.StorageKeys>(() => _i7.StorageKeys());
  gh.factory<_i21.ToastUtils>(() => _i21.ToastUtils());
  gh.singleton<_i22.Web3Provider>(_i22.Web3Provider(get<_i4.Client>()));
  gh.factory<_i23.AuthInterceptor>(
      () => _i23.AuthInterceptor(get<_i17.SecureStorage>(), get<_i15.Dio>()));
  gh.factory<_i24.INetworkConnectionRepository>(() =>
      _i25.NetworkConnectionImplementation(
          get<_i13.NetworkConnectionDataSource>()));
  gh.factory<_i26.NFTDataSource>(
      () => _i26.NFTDataSource(get<_i22.Web3Provider>()));
  gh.factory<_i27.OnConnectionChangedUseCase>(() =>
      _i27.OnConnectionChangedUseCase(
          get<_i24.INetworkConnectionRepository>()));
  gh.factory<_i28.RefreshTokenInterceptor>(() =>
      _i28.RefreshTokenInterceptor(get<_i17.SecureStorage>(), get<_i15.Dio>()));
  gh.factory<_i29.RunAppInitUseCase>(() => _i29.RunAppInitUseCase(
      get<_i22.Web3Provider>(),
      get<_i12.IsarDataSource>(),
      get<_i7.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i30.SpendingDataSource>(
      () => _i30.SpendingDataSource(get<_i22.Web3Provider>()));
  gh.factory<_i31.Web3DataSource>(
      () => _i31.Web3DataSource(get<_i22.Web3Provider>()));
  gh.factory<_i32.AuthDataSource>(() => _i32.AuthDataSource(get<_i15.Dio>(),
      get<_i23.AuthInterceptor>(), get<_i28.RefreshTokenInterceptor>()));
  gh.factory<_i33.GetNetworkConnectionUseCase>(() =>
      _i33.GetNetworkConnectionUseCase(
          get<_i24.INetworkConnectionRepository>()));
  gh.factory<_i34.IAuthRepository>(() => _i35.AuthImplementation(
      get<_i17.SecureStorage>(),
      get<_i32.AuthDataSource>(),
      get<_i12.IsarDataSource>(),
      get<_i7.GetStorageDataSource>()));
  gh.factory<_i36.IMarketPlaceRepository>(
      () => _i37.TransactionImplementation(get<_i32.AuthDataSource>()));
  gh.factory<_i38.INFTRepository>(() => _i39.NFTImplementation(
      get<_i26.NFTDataSource>(),
      get<_i14.NftApi>(),
      get<_i17.SecureStorage>()));
  gh.factory<_i40.ISleepTrackingRepository>(
      () => _i41.SleepTrackingImplementation(get<_i32.AuthDataSource>()));
  gh.factory<_i42.ISpendingRepository>(() => _i43.SpendingImplementation(
      get<_i30.SpendingDataSource>(),
      get<_i31.Web3DataSource>(),
      get<_i32.AuthDataSource>()));
  gh.factory<_i44.ITransactionRepository>(() => _i45.TransactionImplementation(
      get<_i31.Web3DataSource>(),
      get<_i7.GetStorageDataSource>(),
      get<_i12.IsarDataSource>(),
      get<_i9.HistoryDataSource>()));
  gh.factory<_i46.IUserRepository>(() => _i47.UserImplementation(
      get<_i32.AuthDataSource>(), get<_i17.SecureStorage>()));
  gh.factory<_i48.IsFirstOpenAppUseCase>(
      () => _i48.IsFirstOpenAppUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i49.IsNftApproveForAllUseCase>(
      () => _i49.IsNftApproveForAllUseCase(get<_i38.INFTRepository>()));
  gh.factory<_i50.IsPassCodeCreatedUseCase>(
      () => _i50.IsPassCodeCreatedUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i51.LogInUseCase>(
      () => _i51.LogInUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i52.LogOutUseCase>(
      () => _i52.LogOutUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i53.MakeFirstOpenAppUseCase>(
      () => _i53.MakeFirstOpenAppUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i54.MarketPlaceUseCase>(
      () => _i54.MarketPlaceUseCase(get<_i36.IMarketPlaceRepository>()));
  gh.factory<_i55.PostHealthDataUseCase>(
      () => _i55.PostHealthDataUseCase(get<_i40.ISleepTrackingRepository>()));
  gh.factory<_i56.RemoveItemFromBedUseCase>(
      () => _i56.RemoveItemFromBedUseCase(get<_i46.IUserRepository>()));
  gh.factory<_i57.SendNftToSpendingUseCase>(() => _i57.SendNftToSpendingUseCase(
      get<_i38.INFTRepository>(), get<_i17.SecureStorage>()));
  gh.factory<_i58.SendOTPMailUseCase>(
      () => _i58.SendOTPMailUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i59.SendToExternalUseCase>(
      () => _i59.SendToExternalUseCase(get<_i44.ITransactionRepository>()));
  gh.factory<_i60.SendTokenToExternalUseCase>(() =>
      _i60.SendTokenToExternalUseCase(get<_i44.ITransactionRepository>()));
  gh.factory<_i61.SetNftApprovalForAllUseCase>(
      () => _i61.SetNftApprovalForAllUseCase(get<_i38.INFTRepository>()));
  gh.factory<_i62.SettingActiveCodeUseCase>(
      () => _i62.SettingActiveCodeUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i63.SignUpUseCase>(
      () => _i63.SignUpUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i64.StakingInfoUseCase>(
      () => _i64.StakingInfoUseCase(get<_i42.ISpendingRepository>()));
  gh.factory<_i65.StakingUseCase>(
      () => _i65.StakingUseCase(get<_i42.ISpendingRepository>()));
  gh.factory<_i66.TransactionRemoteDataSource>(() =>
      _i66.TransactionRemoteDataSource(
          get<_i9.HistoryDataSource>(),
          get<_i31.Web3DataSource>(),
          get<_i7.GetStorageDataSource>(),
          get<_i12.IsarDataSource>(),
          get<_i15.Dio>()));
  gh.factory<_i67.TransferNftUseCase>(
      () => _i67.TransferNftUseCase(get<_i38.INFTRepository>()));
  gh.factory<_i68.TransferTokenToMainWalletUseCase>(
      () => _i68.TransferTokenToMainWalletUseCase(get<_i46.IUserRepository>()));
  gh.factory<_i69.UnStakingUseCase>(
      () => _i69.UnStakingUseCase(get<_i42.ISpendingRepository>()));
  gh.factory<_i70.ValidatePassCodeUseCase>(
      () => _i70.ValidatePassCodeUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i71.VerifyOTPUseCase>(
      () => _i71.VerifyOTPUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i72.WithdrawHistoryUseCase>(
      () => _i72.WithdrawHistoryUseCase(get<_i46.IUserRepository>()));
  gh.factory<_i73.ActivationCodeSettingUseCase>(
      () => _i73.ActivationCodeSettingUseCase(get<_i46.IUserRepository>()));
  gh.factory<_i74.AddItemToBedUseCase>(
      () => _i74.AddItemToBedUseCase(get<_i46.IUserRepository>()));
  gh.factory<_i75.BuyNFTUseCase>(
      () => _i75.BuyNFTUseCase(get<_i36.IMarketPlaceRepository>()));
  gh.factory<_i76.ChangePasswordUseCase>(
      () => _i76.ChangePasswordUseCase(get<_i46.IUserRepository>()));
  gh.factory<_i77.CheckActivationCodeUseCase>(
      () => _i77.CheckActivationCodeUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i78.CompoundUseCase>(
      () => _i78.CompoundUseCase(get<_i42.ISpendingRepository>()));
  gh.factory<_i79.CreatePassCodeUseCase>(
      () => _i79.CreatePassCodeUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i80.CreatePasswordUseCase>(
      () => _i80.CreatePasswordUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i81.CurrentUserUseCase>(
      () => _i81.CurrentUserUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i82.EstimateGasWithdrawUseCase>(
      () => _i82.EstimateGasWithdrawUseCase(get<_i46.IUserRepository>()));
  gh.factory<_i83.EstimateNftFunctionFeeUseCase>(
      () => _i83.EstimateNftFunctionFeeUseCase(get<_i38.INFTRepository>()));
  gh.factory<_i84.FetchBalanceSpendingUseCase>(
      () => _i84.FetchBalanceSpendingUseCase(get<_i46.IUserRepository>()));
  gh.factory<_i85.FetchBedUseCase>(
      () => _i85.FetchBedUseCase(get<_i46.IUserRepository>()));
  gh.factory<_i86.GetGlobalConfigUseCase>(
      () => _i86.GetGlobalConfigUseCase(get<_i46.IUserRepository>()));
  gh.factory<_i87.GetListNftDetailUseCase>(
      () => _i87.GetListNftDetailUseCase(get<_i38.INFTRepository>()));
  gh.factory<_i88.GetNFTsBalanceUseCase>(
      () => _i88.GetNFTsBalanceUseCase(get<_i38.INFTRepository>()));
  gh.factory<_i89.GetNFTsIDsUseCase>(
      () => _i89.GetNFTsIDsUseCase(get<_i38.INFTRepository>()));
  gh.factory<_i90.GetUserUseCase>(
      () => _i90.GetUserUseCase(get<_i34.IAuthRepository>()));
  gh.factory<_i91.IWalletRepository>(() => _i92.WalletImplementation(
      get<_i31.Web3DataSource>(),
      get<_i7.GetStorageDataSource>(),
      get<_i66.TransactionRemoteDataSource>(),
      get<_i12.IsarDataSource>(),
      get<_i22.Web3Provider>(),
      get<_i17.SecureStorage>(),
      get<_i32.AuthDataSource>()));
  gh.factory<_i93.ImportWalletUseCase>(
      () => _i93.ImportWalletUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i94.SwapTokenUseCase>(
      () => _i94.SwapTokenUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i95.ToSpendingUseCase>(() => _i95.ToSpendingUseCase(
      get<_i42.ISpendingRepository>(), get<_i91.IWalletRepository>()));
  gh.factory<_i96.ValidateMnemonicUseCase>(
      () => _i96.ValidateMnemonicUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i97.ApproveUseCase>(() => _i97.ApproveUseCase(
      get<_i42.ISpendingRepository>(), get<_i91.IWalletRepository>()));
  gh.factory<_i98.CheckApproveUseCase>(
      () => _i98.CheckApproveUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i99.CheckFirstOpenWallet>(
      () => _i99.CheckFirstOpenWallet(get<_i91.IWalletRepository>()));
  gh.factory<_i100.CreateWalletUseCase>(
      () => _i100.CreateWalletUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i101.CurrentWalletUseCase>(
      () => _i101.CurrentWalletUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i102.GetAmountOutMinUseCase>(
      () => _i102.GetAmountOutMinUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i103.GetBalanceForTokensUseCase>(
      () => _i103.GetBalanceForTokensUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i104.GetBalanceTokenUseCase>(
      () => _i104.GetBalanceTokenUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i105.GetCurrentMnemonicUsecase>(
      () => _i105.GetCurrentMnemonicUsecase(get<_i91.IWalletRepository>()));
  gh.factory<_i106.GetCurrentNetworkUseCase>(
      () => _i106.GetCurrentNetworkUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i107.GetHistoryTransactionUseCase>(
      () => _i107.GetHistoryTransactionUseCase(get<_i91.IWalletRepository>()));
  gh.factory<_i108.HasWalletUseCase>(
      () => _i108.HasWalletUseCase(get<_i91.IWalletRepository>()));
  return get;
}

class _$RPCModule extends _i31.RPCModule {}
