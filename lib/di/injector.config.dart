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
import '../datasources/local/secure_storage.dart' as _i20;
import '../datasources/local/shared_preference_datasource.dart' as _i21;
import '../datasources/remote/network/web3_datasource.dart' as _i22;
import '../datasources/remote/network/web3_provider.dart' as _i18;
import '../repository/auth_repository.dart' as _i23;
import '../repository/implementations/auth_implementation.dart' as _i24;
import '../repository/implementations/spending_implementation.dart' as _i26;
import '../repository/implementations/transaction_implementation.dart' as _i28;
import '../repository/implementations/wallet_implementation.dart' as _i30;
import '../repository/spending_repository.dart' as _i25;
import '../repository/transaction_repository.dart' as _i27;
import '../repository/wallet_repository.dart' as _i29;
import '../usecase/create_pass_code_usecase.dart' as _i35;
import '../usecase/get_amount_out_min_usecase.dart' as _i38;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i39;
import '../usecase/get_balance_token_usecase.dart' as _i40;
import '../usecase/get_current_network_usecase.dart' as _i42;
import '../usecase/get_passcode_usecase.dart' as _i43;
import '../usecase/login_usecase.dart' as _i14;
import '../usecase/run_app_init_usecase.dart' as _i19;
import '../usecase/send_to_external_usecase.dart' as _i32;
import '../usecase/swap_token_usecase.dart' as _i33;
import '../usecase/wallet/create_wallet_usecase.dart' as _i36;
import '../usecase/wallet/current_wallet_usecase.dart' as _i37;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i34;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i41;
import '../usecase/wallet/import_wallet_usecase.dart' as _i31;
import 'register_module.dart' as _i44; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i14.LogInUseCase>(() => _i14.LogInUseCase());
  gh.factory<_i15.RandomUtils>(() => _i15.RandomUtils());
  await gh.factoryAsync<_i16.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i11.StorageKeys>(() => _i11.StorageKeys());
  gh.factory<_i17.ToastUtils>(() => _i17.ToastUtils());
  gh.singleton<_i18.Web3Provider>(_i18.Web3Provider(get<_i4.Client>()));
  gh.factory<_i19.RunAppInitUseCase>(() => _i19.RunAppInitUseCase(
      get<_i18.Web3Provider>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i20.SecureStorage>(() => _i20.SecureStorage(
      get<_i9.FlutterSecureStorage>(), get<_i16.SharedPreferences>()));
  gh.factory<_i21.SharedPreferenceDataSource>(
      () => _i21.SharedPreferenceDataSource(get<_i16.SharedPreferences>()));
  gh.factory<_i22.Web3DataSource>(
      () => _i22.Web3DataSource(get<_i18.Web3Provider>()));
  gh.factory<_i23.IAuthRepository>(
      () => _i24.AuthImplementation(get<_i20.SecureStorage>()));
  gh.factory<_i25.ISpendingRepository>(
      () => _i26.SpendingImplementation(get<_i22.Web3DataSource>()));
  gh.factory<_i27.ITransactionRepository>(() => _i28.TransactionImplementation(
      get<_i22.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>()));
  gh.factory<_i29.IWalletRepository>(() => _i30.WalletImplementation(
      get<_i22.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>()));
  gh.factory<_i31.ImportWalletUseCase>(
      () => _i31.ImportWalletUseCase(get<_i29.IWalletRepository>()));
  gh.factory<_i32.SendToExternalUseCase>(
      () => _i32.SendToExternalUseCase(get<_i27.ITransactionRepository>()));
  gh.factory<_i33.SwapTokenUseCase>(
      () => _i33.SwapTokenUseCase(get<_i29.IWalletRepository>()));
  gh.factory<_i34.CheckFirstOpenWallet>(
      () => _i34.CheckFirstOpenWallet(get<_i29.IWalletRepository>()));
  gh.factory<_i35.CreatePassCodeUseCase>(
      () => _i35.CreatePassCodeUseCase(get<_i23.IAuthRepository>()));
  gh.factory<_i36.CreateWalletUseCase>(
      () => _i36.CreateWalletUseCase(get<_i29.IWalletRepository>()));
  gh.factory<_i37.CurrentWalletUseCase>(
      () => _i37.CurrentWalletUseCase(get<_i29.IWalletRepository>()));
  gh.factory<_i38.GetAmountOutMinUseCase>(
      () => _i38.GetAmountOutMinUseCase(get<_i29.IWalletRepository>()));
  gh.factory<_i39.GetBalanceForTokensUseCase>(
      () => _i39.GetBalanceForTokensUseCase(get<_i29.IWalletRepository>()));
  gh.factory<_i40.GetBalanceTokenUseCase>(
      () => _i40.GetBalanceTokenUseCase(get<_i29.IWalletRepository>()));
  gh.factory<_i41.GetCurrentMnemonicUsecase>(
      () => _i41.GetCurrentMnemonicUsecase(get<_i29.IWalletRepository>()));
  gh.factory<_i42.GetCurrentNetworkUseCase>(
      () => _i42.GetCurrentNetworkUseCase(get<_i29.IWalletRepository>()));
  gh.factory<_i43.GetPassCodeUseCase>(
      () => _i43.GetPassCodeUseCase(get<_i23.IAuthRepository>()));
  return get;
}

class _$RPCModule extends _i22.RPCModule {}

class _$RegisterModule extends _i44.RegisterModule {}
