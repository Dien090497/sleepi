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
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i18;
import '../datasources/remote/network/nft_datasource.dart' as _i19;
import '../datasources/remote/network/spending_datasource.dart' as _i23;
import '../datasources/remote/network/web3_datasource.dart' as _i24;
import '../datasources/remote/network/web3_provider.dart' as _i17;
import '../repository/auth_repository.dart' as _i25;
import '../repository/implementations/auth_implementation.dart' as _i26;
import '../repository/implementations/nft_implementation.dart' as _i28;
import '../repository/implementations/spending_implementation.dart' as _i30;
import '../repository/implementations/transaction_implementation.dart' as _i32;
import '../repository/implementations/wallet_implementation.dart' as _i34;
import '../repository/nft_repository.dart' as _i27;
import '../repository/spending_repository.dart' as _i29;
import '../repository/transaction_repository.dart' as _i31;
import '../repository/wallet_repository.dart' as _i33;
import '../usecase/approve_usecase.dart' as _i52;
import '../usecase/check_activation_code_usecase.dart' as _i53;
import '../usecase/create_pass_code_usecase.dart' as _i55;
import '../usecase/create_password_usecase.dart' as _i56;
import '../usecase/current_user_usecase.dart' as _i58;
import '../usecase/get_amount_out_min_usecase.dart' as _i60;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i61;
import '../usecase/get_balance_token_usecase.dart' as _i62;
import '../usecase/get_current_network_usecase.dart' as _i64;
import '../usecase/get_nfts_balance_usecase.dart' as _i65;
import '../usecase/get_nfts_ids_usecase.dart' as _i66;
import '../usecase/is_first_open_app_usecase.dart' as _i36;
import '../usecase/is_passcode_created_usecase.dart' as _i37;
import '../usecase/login_usecase.dart' as _i38;
import '../usecase/logout_usecase.dart' as _i39;
import '../usecase/make_first_open_app_usecase.dart' as _i40;
import '../usecase/run_app_init_usecase.dart' as _i20;
import '../usecase/save_user_local_usecase.dart' as _i41;
import '../usecase/send_otp_mail_usecase.dart' as _i42;
import '../usecase/send_to_external_usecase.dart' as _i43;
import '../usecase/send_token_to_external.dart' as _i44;
import '../usecase/setting_active_code_usecase.dart' as _i45;
import '../usecase/sign_up_usecase.dart' as _i46;
import '../usecase/swap_token_usecase.dart' as _i47;
import '../usecase/to_spending_usecase.dart' as _i48;
import '../usecase/validate_mnemonic.dart' as _i49;
import '../usecase/validate_passcode_usecase.dart' as _i50;
import '../usecase/verify_otp_usecase.dart' as _i51;
import '../usecase/wallet/create_wallet_usecase.dart' as _i57;
import '../usecase/wallet/current_wallet_usecase.dart' as _i59;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i54;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i63;
import '../usecase/wallet/import_wallet_usecase.dart' as _i35;
import 'register_module.dart' as _i67; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i14.MarketPlaceDataSource>(
      () => _i14.MarketPlaceDataSource(get<_i7.Dio>()));
  gh.factory<_i15.RandomUtils>(() => _i15.RandomUtils());
  await gh.factoryAsync<_i16.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i11.StorageKeys>(() => _i11.StorageKeys());
  gh.factory<_i17.ToastUtils>(() => _i17.ToastUtils());
  gh.singleton<_i18.Web3Provider>(_i18.Web3Provider(get<_i4.Client>()));
  gh.factory<_i19.AuthDataSource>(() => _i19.AuthDataSource(get<_i7.Dio>()));
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
  gh.factory<_i26.IAuthRepository>(() => _i27.AuthImplementation(
      get<_i22.SecureStorage>(),
      get<_i19.AuthDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>()));
  gh.factory<_i28.IMarketPlaceRepository>(() => _i29.TransactionImplementation(
      get<_i25.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i14.MarketPlaceDataSource>()));
  gh.factory<_i30.INFTRepository>(
      () => _i31.NFTImplementation(get<_i20.NFTDataSource>()));
  gh.factory<_i32.ISpendingRepository>(() => _i33.SpendingImplementation(
      get<_i24.SpendingDataSource>(), get<_i25.Web3DataSource>()));
  gh.factory<_i34.ITransactionRepository>(() => _i35.TransactionImplementation(
      get<_i25.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>()));
  gh.factory<_i36.IWalletRepository>(() => _i37.WalletImplementation(
      get<_i25.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i18.Web3Provider>()));
  gh.factory<_i38.ImportWalletUseCase>(
      () => _i38.ImportWalletUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i39.IsPassCodeCreatedUseCase>(
      () => _i39.IsPassCodeCreatedUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i40.LogInUseCase>(
      () => _i40.LogInUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i41.LogOutUseCase>(
      () => _i41.LogOutUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i42.MarketPlaceUseCase>(
      () => _i42.MarketPlaceUseCase(get<_i28.IMarketPlaceRepository>()));
  gh.factory<_i43.SaveUserLocalUseCase>(
      () => _i43.SaveUserLocalUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i44.SendOTPMailUseCase>(
      () => _i44.SendOTPMailUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i45.SendToExternalUseCase>(
      () => _i45.SendToExternalUseCase(get<_i34.ITransactionRepository>()));
  gh.factory<_i46.SendTokenToExternalUseCase>(() =>
      _i46.SendTokenToExternalUseCase(get<_i34.ITransactionRepository>()));
  gh.factory<_i47.SettingActiveCodeUseCase>(
      () => _i47.SettingActiveCodeUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i48.SignUpUseCase>(
      () => _i48.SignUpUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i49.SwapTokenUseCase>(
      () => _i49.SwapTokenUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i50.ToSpendingUseCase>(() => _i50.ToSpendingUseCase(
      get<_i32.ISpendingRepository>(), get<_i36.IWalletRepository>()));
  gh.factory<_i51.ValidateMnemonicUseCase>(
      () => _i51.ValidateMnemonicUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i52.ValidatePassCodeUseCase>(
      () => _i52.ValidatePassCodeUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i53.VerifyOTPUseCase>(
      () => _i53.VerifyOTPUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i54.ApproveUseCase>(() => _i54.ApproveUseCase(
      get<_i32.ISpendingRepository>(), get<_i36.IWalletRepository>()));
  gh.factory<_i55.CheckFirstOpenWallet>(
      () => _i55.CheckFirstOpenWallet(get<_i36.IWalletRepository>()));
  gh.factory<_i56.CreatePassCodeUseCase>(
      () => _i56.CreatePassCodeUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i57.CreatePasswordUseCase>(
      () => _i57.CreatePasswordUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i58.CreateWalletUseCase>(
      () => _i58.CreateWalletUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i59.CurrentUserUseCase>(
      () => _i59.CurrentUserUseCase(get<_i26.IAuthRepository>()));
  gh.factory<_i60.CurrentWalletUseCase>(
      () => _i60.CurrentWalletUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i61.GetAmountOutMinUseCase>(
      () => _i61.GetAmountOutMinUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i62.GetBalanceForTokensUseCase>(
      () => _i62.GetBalanceForTokensUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i63.GetBalanceTokenUseCase>(
      () => _i63.GetBalanceTokenUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i64.GetCurrentMnemonicUsecase>(
      () => _i64.GetCurrentMnemonicUsecase(get<_i36.IWalletRepository>()));
  gh.factory<_i65.GetCurrentNetworkUseCase>(
      () => _i65.GetCurrentNetworkUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i66.GetNFTsUseCase>(
      () => _i66.GetNFTsUseCase(get<_i30.INFTRepository>()));
      get<_i17.Web3Provider>()));
  gh.factory<_i35.ImportWalletUseCase>(
      () => _i35.ImportWalletUseCase(get<_i33.IWalletRepository>()));
  gh.factory<_i36.IsFirstOpenAppUseCase>(
      () => _i36.IsFirstOpenAppUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i37.IsPassCodeCreatedUseCase>(
      () => _i37.IsPassCodeCreatedUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i38.LogInUseCase>(
      () => _i38.LogInUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i39.LogOutUseCase>(
      () => _i39.LogOutUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i40.MakeFirstOpenAppUseCase>(
      () => _i40.MakeFirstOpenAppUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i41.SaveUserLocalUseCase>(
      () => _i41.SaveUserLocalUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i42.SendOTPMailUseCase>(
      () => _i42.SendOTPMailUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i43.SendToExternalUseCase>(
      () => _i43.SendToExternalUseCase(get<_i31.ITransactionRepository>()));
  gh.factory<_i44.SendTokenToExternalUseCase>(() =>
      _i44.SendTokenToExternalUseCase(get<_i31.ITransactionRepository>()));
  gh.factory<_i45.SettingActiveCodeUseCase>(
      () => _i45.SettingActiveCodeUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i46.SignUpUseCase>(
      () => _i46.SignUpUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i47.SwapTokenUseCase>(
      () => _i47.SwapTokenUseCase(get<_i33.IWalletRepository>()));
  gh.factory<_i48.ToSpendingUseCase>(() => _i48.ToSpendingUseCase(
      get<_i29.ISpendingRepository>(), get<_i33.IWalletRepository>()));
  gh.factory<_i49.ValidateMnemonicUseCase>(
      () => _i49.ValidateMnemonicUseCase(get<_i33.IWalletRepository>()));
  gh.factory<_i50.ValidatePassCodeUseCase>(
      () => _i50.ValidatePassCodeUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i51.VerifyOTPUseCase>(
      () => _i51.VerifyOTPUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i52.ApproveUseCase>(() => _i52.ApproveUseCase(
      get<_i29.ISpendingRepository>(), get<_i33.IWalletRepository>()));
  gh.factory<_i53.CheckActivationCodeUseCase>(
      () => _i53.CheckActivationCodeUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i54.CheckFirstOpenWallet>(
      () => _i54.CheckFirstOpenWallet(get<_i33.IWalletRepository>()));
  gh.factory<_i55.CreatePassCodeUseCase>(
      () => _i55.CreatePassCodeUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i56.CreatePasswordUseCase>(
      () => _i56.CreatePasswordUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i57.CreateWalletUseCase>(
      () => _i57.CreateWalletUseCase(get<_i33.IWalletRepository>()));
  gh.factory<_i58.CurrentUserUseCase>(
      () => _i58.CurrentUserUseCase(get<_i25.IAuthRepository>()));
  gh.factory<_i59.CurrentWalletUseCase>(
      () => _i59.CurrentWalletUseCase(get<_i33.IWalletRepository>()));
  gh.factory<_i60.GetAmountOutMinUseCase>(
      () => _i60.GetAmountOutMinUseCase(get<_i33.IWalletRepository>()));
  gh.factory<_i61.GetBalanceForTokensUseCase>(
      () => _i61.GetBalanceForTokensUseCase(get<_i33.IWalletRepository>()));
  gh.factory<_i62.GetBalanceTokenUseCase>(
      () => _i62.GetBalanceTokenUseCase(get<_i33.IWalletRepository>()));
  gh.factory<_i63.GetCurrentMnemonicUsecase>(
      () => _i63.GetCurrentMnemonicUsecase(get<_i33.IWalletRepository>()));
  gh.factory<_i64.GetCurrentNetworkUseCase>(
      () => _i64.GetCurrentNetworkUseCase(get<_i33.IWalletRepository>()));
  gh.factory<_i65.GetNFTsBalanceUseCase>(
      () => _i65.GetNFTsBalanceUseCase(get<_i27.INFTRepository>()));
  gh.factory<_i66.GetNFTsIDsUseCase>(
      () => _i66.GetNFTsIDsUseCase(get<_i27.INFTRepository>()));
  return get;
}

class _$RPCModule extends _i25.RPCModule {}

class _$RegisterModule extends _i67.RegisterModule {}
