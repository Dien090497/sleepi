// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i7;

import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import '../common/contract_addresses/contract_addresses.dart' as _i4;
import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i5;
import '../common/utils/random_utils.dart' as _i14;
import '../common/utils/toast_utils.dart' as _i18;
import '../datasources/local/get_storage_datasource.dart' as _i10;
import '../datasources/local/isar/isar_datasource.dart' as _i12;
import '../datasources/local/secure_storage.dart' as _i24;
import '../datasources/local/shared_preference_datasource.dart' as _i26;
import '../datasources/remote/network/web3_datasource.dart' as _i16;
import '../repository/auth_repository.dart' as _i35;
import '../repository/implementations/auth_implementation.dart' as _i36;
import '../repository/implementations/transaction_implementation.dart' as _i20;
import '../repository/implementations/wallet_implementation.dart' as _i22;
import '../repository/transaction_repository.dart' as _i19;
import '../repository/wallet_repository.dart' as _i21;
import '../usecase/create_pass_code_usecase.dart' as _i37;
import '../usecase/get_amount_out_min_usecase.dart' as _i31;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i32;
import '../usecase/get_balance_token_usecase.dart' as _i33;
import '../usecase/get_passcode_usecase.dart' as _i38;
import '../usecase/login_usecase.dart' as _i13;
import '../usecase/run_app_init_usecase.dart' as _i15;
import '../usecase/send_to_external_usecase.dart' as _i25;
import '../usecase/swap_token_usecase.dart' as _i27;
import '../usecase/wallet/create_wallet_usecase.dart' as _i29;
import '../usecase/wallet/current_wallet_usecase.dart' as _i30;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i28;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i34;
import '../usecase/wallet/import_wallet_usecase.dart' as _i23;
import 'register_module.dart' as _i39; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppFlyerCustom>(_i3.AppFlyerCustom());
  gh.factory<_i4.ContractAddresses>(() => _i4.ContractAddresses());
  gh.factory<_i5.DateTimeUtils>(() => _i5.DateTimeUtils());
  gh.factory<_i6.Dio>(() => registerModule.dio);
  await gh.factoryAsync<_i7.Directory>(() => registerModule.isarDir,
      preResolve: true);
  gh.factory<_i8.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i9.GetStorage>(() => registerModule.getStorage);
  gh.factory<_i10.GetStorageDataSource>(
      () => _i10.GetStorageDataSource(get<_i9.GetStorage>()));
  await gh.factoryAsync<_i11.Isar>(
      () => registerModule.isar(get<_i7.Directory>()),
      preResolve: true);
  gh.singleton<_i12.IsarDataSource>(_i12.IsarDataSource(get<_i11.Isar>()));
  gh.factory<_i13.LogInUseCase>(() => _i13.LogInUseCase());
  gh.factory<_i14.RandomUtils>(() => _i14.RandomUtils());
  gh.factory<_i15.RunAppInitUseCase>(() => _i15.RunAppInitUseCase(
      get<_i16.Web3DataSource>(),
      get<_i12.IsarDataSource>(),
      get<_i10.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  await gh.factoryAsync<_i17.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i10.StorageKeys>(() => _i10.StorageKeys());
  gh.factory<_i18.ToastUtils>(() => _i18.ToastUtils());
  gh.factory<_i19.ITransactionRepository>(() => _i20.TransactionImplementation(
      get<_i16.Web3DataSource>(),
      get<_i10.GetStorageDataSource>(),
      get<_i12.IsarDataSource>()));
  gh.factory<_i21.IWalletRepository>(() => _i22.WalletImplementation(
      get<_i16.Web3DataSource>(),
      get<_i10.GetStorageDataSource>(),
      get<_i12.IsarDataSource>()));
  gh.factory<_i23.ImportWalletUseCase>(
      () => _i23.ImportWalletUseCase(get<_i21.IWalletRepository>()));
  gh.factory<_i24.SecureStorage>(() => _i24.SecureStorage(
      get<_i8.FlutterSecureStorage>(), get<_i17.SharedPreferences>()));
  gh.factory<_i25.SendToExternalUseCase>(
      () => _i25.SendToExternalUseCase(get<_i19.ITransactionRepository>()));
  gh.factory<_i26.SharedPreferenceDataSource>(
      () => _i26.SharedPreferenceDataSource(get<_i17.SharedPreferences>()));
  gh.factory<_i27.SwapTokenUseCase>(
      () => _i27.SwapTokenUseCase(get<_i21.IWalletRepository>()));
  gh.factory<_i28.CheckFirstOpenWallet>(
      () => _i28.CheckFirstOpenWallet(get<_i21.IWalletRepository>()));
  gh.factory<_i29.CreateWalletUseCase>(
      () => _i29.CreateWalletUseCase(get<_i21.IWalletRepository>()));
  gh.factory<_i30.CurrentWalletUseCase>(
      () => _i30.CurrentWalletUseCase(get<_i21.IWalletRepository>()));
  gh.factory<_i31.GetAmountOutMinUseCase>(
      () => _i31.GetAmountOutMinUseCase(get<_i21.IWalletRepository>()));
  gh.factory<_i32.GetBalanceForTokensUseCase>(
      () => _i32.GetBalanceForTokensUseCase(get<_i21.IWalletRepository>()));
  gh.factory<_i33.GetBalanceTokenUseCase>(
      () => _i33.GetBalanceTokenUseCase(get<_i21.IWalletRepository>()));
  gh.factory<_i34.GetCurrentMnemonicUsecase>(
      () => _i34.GetCurrentMnemonicUsecase(get<_i21.IWalletRepository>()));
  gh.factory<_i35.IAuthRepository>(
      () => _i36.AuthImplementation(get<_i24.SecureStorage>()));
  gh.factory<_i37.CreatePassCodeUseCase>(
      () => _i37.CreatePassCodeUseCase(get<_i35.IAuthRepository>()));
  gh.factory<_i38.GetPassCodeUseCase>(
      () => _i38.GetPassCodeUseCase(get<_i35.IAuthRepository>()));
  return get;
}

class _$RegisterModule extends _i39.RegisterModule {}
