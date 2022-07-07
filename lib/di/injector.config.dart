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
import '../datasources/local/isar/isar_datasource.dart' as _i13;
import '../datasources/local/secure_storage.dart' as _i21;
import '../datasources/local/shared_preference_datasource.dart' as _i22;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i45;
import '../datasources/remote/auth_datasource/auth_interceptor.dart' as _i25;
import '../datasources/remote/network/nft_datasource.dart' as _i19;
import '../datasources/remote/network/spending_datasource.dart' as _i23;
import '../datasources/remote/network/web3_datasource.dart' as _i24;
import '../datasources/remote/network/web3_provider.dart' as _i18;
import '../datasources/remote/nft_api/nft_api.dart' as _i14;
import '../repository/auth_repository.dart' as _i58;
import '../repository/implementations/auth_implementation.dart' as _i59;
import '../repository/implementations/market_place_implementation.dart' as _i61;
import '../repository/implementations/nft_implementation.dart' as _i27;
import '../repository/implementations/spending_implementation.dart' as _i29;
import '../repository/implementations/transaction_implementation.dart' as _i31;
import '../repository/implementations/user_implementations.dart' as _i63;
import '../repository/implementations/wallet_implementation.dart' as _i33;
import '../repository/market_place_repository.dart' as _i60;
import '../repository/nft_repository.dart' as _i26;
import '../repository/spending_repository.dart' as _i28;
import '../repository/transaction_repository.dart' as _i30;
import '../repository/user_repository.dart' as _i62;
import '../repository/wallet_repository.dart' as _i32;
import '../usecase/activation_code_setting_usecase.dart' as _i75;
import '../usecase/approve_usecase.dart' as _i44;
import '../usecase/change_password_usecase.dart' as _i76;
import '../usecase/check_activation_code_usecase.dart' as _i77;
import '../usecase/check_approve_usecase.dart' as _i46;
import '../usecase/create_pass_code_usecase.dart' as _i78;
import '../usecase/create_password_usecase.dart' as _i79;
import '../usecase/current_user_usecase.dart' as _i80;
import '../usecase/fetch_balance_spending_usecase.dart' as _i81;
import '../usecase/get_amount_out_min_usecase.dart' as _i50;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i51;
import '../usecase/get_balance_token_usecase.dart' as _i52;
import '../usecase/get_current_network_usecase.dart' as _i54;
import '../usecase/get_list_nft_detail_usecase.dart' as _i55;
import '../usecase/get_market_place_usecase.dart' as _i69;
import '../usecase/get_nfts_balance_usecase.dart' as _i56;
import '../usecase/get_nfts_ids_usecase.dart' as _i57;
import '../usecase/is_first_open_app_usecase.dart' as _i64;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i35;
import '../usecase/is_passcode_created_usecase.dart' as _i65;
import '../usecase/login_usecase.dart' as _i66;
import '../usecase/logout_usecase.dart' as _i67;
import '../usecase/make_first_open_app_usecase.dart' as _i68;
import '../usecase/run_app_init_usecase.dart' as _i20;
import '../usecase/send_nft_to_spending_usecase.dart' as _i36;
import '../usecase/send_otp_mail_usecase.dart' as _i70;
import '../usecase/send_to_external_usecase.dart' as _i37;
import '../usecase/send_token_to_external.dart' as _i38;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i39;
import '../usecase/setting_active_code_usecase.dart' as _i71;
import '../usecase/sign_up_usecase.dart' as _i72;
import '../usecase/swap_token_usecase.dart' as _i40;
import '../usecase/to_spending_usecase.dart' as _i41;
import '../usecase/transfer_nft_usecase.dart' as _i42;
import '../usecase/validate_mnemonic.dart' as _i43;
import '../usecase/validate_passcode_usecase.dart' as _i73;
import '../usecase/verify_otp_usecase.dart' as _i74;
import '../usecase/wallet/create_wallet_usecase.dart' as _i48;
import '../usecase/wallet/current_wallet_usecase.dart' as _i49;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i47;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i53;
import '../usecase/wallet/import_wallet_usecase.dart' as _i34;
import 'register_module.dart' as _i82; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i19.NFTDataSource>(
      () => _i19.NFTDataSource(get<_i18.Web3Provider>()));
  gh.factory<_i20.RunAppInitUseCase>(() => _i20.RunAppInitUseCase(
      get<_i18.Web3Provider>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i21.SecureStorage>(() => _i21.SecureStorage(
      get<_i9.FlutterSecureStorage>(), get<_i16.SharedPreferences>()));
  gh.factory<_i22.SharedPreferenceDataSource>(
      () => _i22.SharedPreferenceDataSource(get<_i16.SharedPreferences>()));
  gh.factory<_i23.SpendingDataSource>(
      () => _i23.SpendingDataSource(get<_i18.Web3Provider>()));
  gh.factory<_i24.Web3DataSource>(
      () => _i24.Web3DataSource(get<_i18.Web3Provider>()));
  gh.factory<_i25.AuthInterceptor>(
      () => _i25.AuthInterceptor(get<_i21.SecureStorage>(), get<_i7.Dio>()));
  gh.factory<_i26.INFTRepository>(() =>
      _i27.NFTImplementation(get<_i19.NFTDataSource>(), get<_i14.NftApi>()));
  gh.factory<_i28.ISpendingRepository>(() => _i29.SpendingImplementation(
      get<_i23.SpendingDataSource>(), get<_i24.Web3DataSource>()));
  gh.factory<_i30.ITransactionRepository>(() => _i31.TransactionImplementation(
      get<_i24.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>()));
  gh.factory<_i32.IWalletRepository>(() => _i33.WalletImplementation(
      get<_i24.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i18.Web3Provider>()));
  gh.factory<_i34.ImportWalletUseCase>(
      () => _i34.ImportWalletUseCase(get<_i32.IWalletRepository>()));
  gh.factory<_i35.IsNftApproveForAllUseCase>(
      () => _i35.IsNftApproveForAllUseCase(get<_i26.INFTRepository>()));
  gh.factory<_i36.SendNftToSpendingUseCase>(
      () => _i36.SendNftToSpendingUseCase(get<_i26.INFTRepository>()));
  gh.factory<_i37.SendToExternalUseCase>(
      () => _i37.SendToExternalUseCase(get<_i30.ITransactionRepository>()));
  gh.factory<_i38.SendTokenToExternalUseCase>(() =>
      _i38.SendTokenToExternalUseCase(get<_i30.ITransactionRepository>()));
  gh.factory<_i39.SetNftApprovalForAllUseCase>(
      () => _i39.SetNftApprovalForAllUseCase(get<_i26.INFTRepository>()));
  gh.factory<_i40.SwapTokenUseCase>(
      () => _i40.SwapTokenUseCase(get<_i32.IWalletRepository>()));
  gh.factory<_i41.ToSpendingUseCase>(() => _i41.ToSpendingUseCase(
      get<_i28.ISpendingRepository>(), get<_i32.IWalletRepository>()));
  gh.factory<_i42.TransferNftUseCase>(
      () => _i42.TransferNftUseCase(get<_i26.INFTRepository>()));
  gh.factory<_i43.ValidateMnemonicUseCase>(
      () => _i43.ValidateMnemonicUseCase(get<_i32.IWalletRepository>()));
  gh.factory<_i44.ApproveUseCase>(() => _i44.ApproveUseCase(
      get<_i28.ISpendingRepository>(), get<_i32.IWalletRepository>()));
  gh.factory<_i45.AuthDataSource>(
      () => _i45.AuthDataSource(get<_i7.Dio>(), get<_i25.AuthInterceptor>()));
  gh.factory<_i46.CheckApproveUseCase>(
      () => _i46.CheckApproveUseCase(get<_i32.IWalletRepository>()));
  gh.factory<_i47.CheckFirstOpenWallet>(
      () => _i47.CheckFirstOpenWallet(get<_i32.IWalletRepository>()));
  gh.factory<_i48.CreateWalletUseCase>(
      () => _i48.CreateWalletUseCase(get<_i32.IWalletRepository>()));
  gh.factory<_i49.CurrentWalletUseCase>(
      () => _i49.CurrentWalletUseCase(get<_i32.IWalletRepository>()));
  gh.factory<_i50.GetAmountOutMinUseCase>(
      () => _i50.GetAmountOutMinUseCase(get<_i32.IWalletRepository>()));
  gh.factory<_i51.GetBalanceForTokensUseCase>(
      () => _i51.GetBalanceForTokensUseCase(get<_i32.IWalletRepository>()));
  gh.factory<_i52.GetBalanceTokenUseCase>(
      () => _i52.GetBalanceTokenUseCase(get<_i32.IWalletRepository>()));
  gh.factory<_i53.GetCurrentMnemonicUsecase>(
      () => _i53.GetCurrentMnemonicUsecase(get<_i32.IWalletRepository>()));
  gh.factory<_i54.GetCurrentNetworkUseCase>(
      () => _i54.GetCurrentNetworkUseCase(get<_i32.IWalletRepository>()));
  gh.factory<_i55.GetListNftDetailUseCase>(
      () => _i55.GetListNftDetailUseCase(get<_i26.INFTRepository>()));
  gh.factory<_i56.GetNFTsBalanceUseCase>(
      () => _i56.GetNFTsBalanceUseCase(get<_i26.INFTRepository>()));
  gh.factory<_i57.GetNFTsIDsUseCase>(
      () => _i57.GetNFTsIDsUseCase(get<_i26.INFTRepository>()));
  gh.factory<_i58.IAuthRepository>(() => _i59.AuthImplementation(
      get<_i21.SecureStorage>(),
      get<_i45.AuthDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>()));
  gh.factory<_i60.IMarketPlaceRepository>(
      () => _i61.TransactionImplementation(get<_i45.AuthDataSource>()));
  gh.factory<_i62.IUserRepository>(
      () => _i63.UserImplementation(get<_i45.AuthDataSource>()));
  gh.factory<_i64.IsFirstOpenAppUseCase>(
      () => _i64.IsFirstOpenAppUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i65.IsPassCodeCreatedUseCase>(
      () => _i65.IsPassCodeCreatedUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i66.LogInUseCase>(
      () => _i66.LogInUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i67.LogOutUseCase>(
      () => _i67.LogOutUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i68.MakeFirstOpenAppUseCase>(
      () => _i68.MakeFirstOpenAppUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i69.MarketPlaceUseCase>(
      () => _i69.MarketPlaceUseCase(get<_i60.IMarketPlaceRepository>()));
  gh.factory<_i70.SendOTPMailUseCase>(
      () => _i70.SendOTPMailUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i71.SettingActiveCodeUseCase>(
      () => _i71.SettingActiveCodeUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i72.SignUpUseCase>(
      () => _i72.SignUpUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i73.ValidatePassCodeUseCase>(
      () => _i73.ValidatePassCodeUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i74.VerifyOTPUseCase>(
      () => _i74.VerifyOTPUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i75.ActivationCodeSettingUseCase>(
      () => _i75.ActivationCodeSettingUseCase(get<_i62.IUserRepository>()));
  gh.factory<_i76.ChangePasswordUseCase>(
      () => _i76.ChangePasswordUseCase(get<_i62.IUserRepository>()));
  gh.factory<_i77.CheckActivationCodeUseCase>(
      () => _i77.CheckActivationCodeUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i78.CreatePassCodeUseCase>(
      () => _i78.CreatePassCodeUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i79.CreatePasswordUseCase>(
      () => _i79.CreatePasswordUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i80.CurrentUserUseCase>(
      () => _i80.CurrentUserUseCase(get<_i58.IAuthRepository>()));
  gh.factory<_i81.FetchBalanceSpendingUseCase>(
      () => _i81.FetchBalanceSpendingUseCase(get<_i62.IUserRepository>()));
  return get;
}

class _$RPCModule extends _i24.RPCModule {}

class _$RegisterModule extends _i82.RegisterModule {}
