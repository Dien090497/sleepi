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
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../common/contract_addresses/contract_addresses.dart' as _i5;
import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i6;
import '../common/utils/random_utils.dart' as _i14;
import '../common/utils/toast_utils.dart' as _i16;
import '../datasources/local/get_storage_datasource.dart' as _i11;
import '../datasources/local/isar/isar_datasource.dart' as _i13;
import '../datasources/local/secure_storage.dart' as _i23;
import '../datasources/local/shared_preference_datasource.dart' as _i24;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i18;
import '../datasources/remote/network/nft_datasource.dart' as _i21;
import '../datasources/remote/network/spending_datasource.dart' as _i25;
import '../datasources/remote/network/web3_datasource.dart' as _i26;
import '../datasources/remote/network/web3_provider.dart' as _i17;
import '../repository/auth_repository.dart' as _i28;
import '../repository/implementations/auth_implementation.dart' as _i29;
import '../repository/implementations/nft_implementation.dart' as _i31;
import '../repository/implementations/spending_implementation.dart' as _i33;
import '../repository/implementations/transaction_implementation.dart' as _i35;
import '../repository/implementations/user_implementations.dart' as _i20;
import '../repository/implementations/wallet_implementation.dart' as _i37;
import '../repository/nft_repository.dart' as _i30;
import '../repository/spending_repository.dart' as _i32;
import '../repository/transaction_repository.dart' as _i34;
import '../repository/user_repository.dart' as _i19;
import '../repository/wallet_repository.dart' as _i36;
import '../usecase/approve_usecase.dart' as _i55;
import '../usecase/change_password_usecase.dart' as _i27;
import '../usecase/check_activation_code_usecase.dart' as _i56;
import '../usecase/create_pass_code_usecase.dart' as _i58;
import '../usecase/create_password_usecase.dart' as _i59;
import '../usecase/current_user_usecase.dart' as _i61;
import '../usecase/get_amount_out_min_usecase.dart' as _i63;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i64;
import '../usecase/get_balance_token_usecase.dart' as _i65;
import '../usecase/get_current_network_usecase.dart' as _i67;
import '../usecase/get_nfts_balance_usecase.dart' as _i68;
import '../usecase/get_nfts_ids_usecase.dart' as _i69;
import '../usecase/is_first_open_app_usecase.dart' as _i39;
import '../usecase/is_passcode_created_usecase.dart' as _i40;
import '../usecase/login_usecase.dart' as _i41;
import '../usecase/logout_usecase.dart' as _i42;
import '../usecase/make_first_open_app_usecase.dart' as _i43;
import '../usecase/run_app_init_usecase.dart' as _i22;
import '../usecase/save_user_local_usecase.dart' as _i44;
import '../usecase/send_otp_mail_usecase.dart' as _i45;
import '../usecase/send_to_external_usecase.dart' as _i46;
import '../usecase/send_token_to_external.dart' as _i47;
import '../usecase/setting_active_code_usecase.dart' as _i48;
import '../usecase/sign_up_usecase.dart' as _i49;
import '../usecase/swap_token_usecase.dart' as _i50;
import '../usecase/to_spending_usecase.dart' as _i51;
import '../usecase/validate_mnemonic.dart' as _i52;
import '../usecase/validate_passcode_usecase.dart' as _i53;
import '../usecase/verify_otp_usecase.dart' as _i54;
import '../usecase/wallet/create_wallet_usecase.dart' as _i60;
import '../usecase/wallet/current_wallet_usecase.dart' as _i62;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i57;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i66;
import '../usecase/wallet/import_wallet_usecase.dart' as _i38;
import 'register_module.dart' as _i70; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i14.RandomUtils>(() => _i14.RandomUtils());
  await gh.factoryAsync<_i15.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i11.StorageKeys>(() => _i11.StorageKeys());
  gh.factory<_i16.ToastUtils>(() => _i16.ToastUtils());
  gh.singleton<_i17.Web3Provider>(_i17.Web3Provider(get<_i4.Client>()));
  gh.factory<_i18.AuthDataSource>(() => _i18.AuthDataSource(get<_i7.Dio>()));
  gh.factory<_i19.IUserRepository>(
      () => _i20.UserImplementation(get<_i18.AuthDataSource>()));
  gh.factory<_i21.NFTDataSource>(
      () => _i21.NFTDataSource(get<_i17.Web3Provider>()));
  gh.factory<_i22.RunAppInitUseCase>(() => _i22.RunAppInitUseCase(
      get<_i17.Web3Provider>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i23.SecureStorage>(() => _i23.SecureStorage(
      get<_i9.FlutterSecureStorage>(), get<_i15.SharedPreferences>()));
  gh.factory<_i24.SharedPreferenceDataSource>(
      () => _i24.SharedPreferenceDataSource(get<_i15.SharedPreferences>()));
  gh.factory<_i25.SpendingDataSource>(
      () => _i25.SpendingDataSource(get<_i17.Web3Provider>()));
  gh.factory<_i26.Web3DataSource>(
      () => _i26.Web3DataSource(get<_i17.Web3Provider>()));
  gh.factory<_i27.ChangePasswordUseCase>(
      () => _i27.ChangePasswordUseCase(get<_i19.IUserRepository>()));
  gh.factory<_i28.IAuthRepository>(() => _i29.AuthImplementation(
      get<_i23.SecureStorage>(),
      get<_i18.AuthDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>()));
  gh.factory<_i30.INFTRepository>(
      () => _i31.NFTImplementation(get<_i21.NFTDataSource>()));
  gh.factory<_i32.ISpendingRepository>(() => _i33.SpendingImplementation(
      get<_i25.SpendingDataSource>(), get<_i26.Web3DataSource>()));
  gh.factory<_i34.ITransactionRepository>(() => _i35.TransactionImplementation(
      get<_i26.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>()));
  gh.factory<_i36.IWalletRepository>(() => _i37.WalletImplementation(
      get<_i26.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i17.Web3Provider>()));
  gh.factory<_i38.ImportWalletUseCase>(
      () => _i38.ImportWalletUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i39.IsFirstOpenAppUseCase>(
      () => _i39.IsFirstOpenAppUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i40.IsPassCodeCreatedUseCase>(
      () => _i40.IsPassCodeCreatedUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i41.LogInUseCase>(
      () => _i41.LogInUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i42.LogOutUseCase>(
      () => _i42.LogOutUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i43.MakeFirstOpenAppUseCase>(
      () => _i43.MakeFirstOpenAppUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i44.SaveUserLocalUseCase>(
      () => _i44.SaveUserLocalUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i45.SendOTPMailUseCase>(
      () => _i45.SendOTPMailUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i46.SendToExternalUseCase>(
      () => _i46.SendToExternalUseCase(get<_i34.ITransactionRepository>()));
  gh.factory<_i47.SendTokenToExternalUseCase>(() =>
      _i47.SendTokenToExternalUseCase(get<_i34.ITransactionRepository>()));
  gh.factory<_i48.SettingActiveCodeUseCase>(
      () => _i48.SettingActiveCodeUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i49.SignUpUseCase>(
      () => _i49.SignUpUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i50.SwapTokenUseCase>(
      () => _i50.SwapTokenUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i51.ToSpendingUseCase>(() => _i51.ToSpendingUseCase(
      get<_i32.ISpendingRepository>(), get<_i36.IWalletRepository>()));
  gh.factory<_i52.ValidateMnemonicUseCase>(
      () => _i52.ValidateMnemonicUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i53.ValidatePassCodeUseCase>(
      () => _i53.ValidatePassCodeUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i54.VerifyOTPUseCase>(
      () => _i54.VerifyOTPUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i55.ApproveUseCase>(() => _i55.ApproveUseCase(
      get<_i32.ISpendingRepository>(), get<_i36.IWalletRepository>()));
  gh.factory<_i56.CheckActivationCodeUseCase>(
      () => _i56.CheckActivationCodeUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i57.CheckFirstOpenWallet>(
      () => _i57.CheckFirstOpenWallet(get<_i36.IWalletRepository>()));
  gh.factory<_i58.CreatePassCodeUseCase>(
      () => _i58.CreatePassCodeUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i59.CreatePasswordUseCase>(
      () => _i59.CreatePasswordUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i60.CreateWalletUseCase>(
      () => _i60.CreateWalletUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i61.CurrentUserUseCase>(
      () => _i61.CurrentUserUseCase(get<_i28.IAuthRepository>()));
  gh.factory<_i62.CurrentWalletUseCase>(
      () => _i62.CurrentWalletUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i63.GetAmountOutMinUseCase>(
      () => _i63.GetAmountOutMinUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i64.GetBalanceForTokensUseCase>(
      () => _i64.GetBalanceForTokensUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i65.GetBalanceTokenUseCase>(
      () => _i65.GetBalanceTokenUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i66.GetCurrentMnemonicUsecase>(
      () => _i66.GetCurrentMnemonicUsecase(get<_i36.IWalletRepository>()));
  gh.factory<_i67.GetCurrentNetworkUseCase>(
      () => _i67.GetCurrentNetworkUseCase(get<_i36.IWalletRepository>()));
  gh.factory<_i68.GetNFTsBalanceUseCase>(
      () => _i68.GetNFTsBalanceUseCase(get<_i30.INFTRepository>()));
  gh.factory<_i69.GetNFTsIDsUseCase>(
      () => _i69.GetNFTsIDsUseCase(get<_i30.INFTRepository>()));
  return get;
}

class _$RPCModule extends _i26.RPCModule {}

class _$RegisterModule extends _i70.RegisterModule {}
