// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i6;

import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i8;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../common/utils/date_time_utils.dart' as _i4;
import '../common/utils/random_utils.dart' as _i13;
import '../common/utils/toast_utils.dart' as _i15;
import '../datasources/local/get_storage_datasource.dart' as _i9;
import '../datasources/local/isar/isar_datasource.dart' as _i11;
import '../datasources/local/secure_storage.dart' as _i22;
import '../datasources/local/shared_preference_datasource.dart' as _i24;
import '../datasources/remote/network/web3_datasource.dart' as _i16;
import '../repository/auth_repository.dart' as _i26;
import '../repository/implementations/auth_implementation.dart' as _i27;
import '../repository/implementations/transaction_implementation.dart' as _i18;
import '../repository/implementations/wallet_implementation.dart' as _i20;
import '../repository/implementations/wallet_repository.dart' as _i19;
import '../repository/transaction_repository.dart' as _i17;
import '../usecase/create_pass_code_usecase.dart' as _i28;
import '../usecase/create_wallet_usecase.dart' as _i25;
import '../usecase/login_usecase.dart' as _i12;
import '../usecase/run_app_init_usecase.dart' as _i21;
import '../usecase/send_to_external_usecase.dart' as _i23;
import 'register_module.dart' as _i29; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final rPCModule = _$RPCModule();
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Client>(() => rPCModule.httpClient);
  gh.factory<_i4.DateTimeUtils>(() => _i4.DateTimeUtils());
  gh.factory<_i5.Dio>(() => registerModule.dio);
  await gh.factoryAsync<_i6.Directory>(() => registerModule.isarDir,
      preResolve: true);
  gh.factory<_i7.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i8.GetStorage>(() => registerModule.getStorage);
  gh.factory<_i9.GetStorageDataSource>(
      () => _i9.GetStorageDataSource(get<_i8.GetStorage>()));
  await gh.factoryAsync<_i10.Isar>(
      () => registerModule.isar(get<_i6.Directory>()),
      preResolve: true);
  gh.singleton<_i11.IsarDataSource>(_i11.IsarDataSource(get<_i10.Isar>()));
  gh.factory<_i12.LogInUseCase>(() => _i12.LogInUseCase());
  gh.factory<_i13.RandomUtils>(() => _i13.RandomUtils());
  await gh.factoryAsync<_i14.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i9.StorageKeys>(() => _i9.StorageKeys());
  gh.factory<_i15.ToastUtils>(() => _i15.ToastUtils());
  gh.singleton<_i16.Web3DataSource>(_i16.Web3DataSource(get<_i3.Client>()));
  gh.factory<_i17.ITransactionRepository>(() => _i18.TransactionImplementation(
      get<_i16.Web3DataSource>(), get<_i9.GetStorageDataSource>()));
  gh.factory<_i19.IWalletRepository>(() => _i20.WalletImplementation(
      get<_i16.Web3DataSource>(),
      get<_i9.GetStorageDataSource>(),
      get<_i11.IsarDataSource>()));
  gh.factory<_i21.RunAppInitUseCase>(() => _i21.RunAppInitUseCase(
      get<_i16.Web3DataSource>(),
      get<_i11.IsarDataSource>(),
      get<_i9.GetStorageDataSource>()));
  gh.factory<_i22.SecureStorage>(() => _i22.SecureStorage(
      get<_i7.FlutterSecureStorage>(), get<_i14.SharedPreferences>()));
  gh.factory<_i23.SendToExternalUseCase>(
      () => _i23.SendToExternalUseCase(get<_i17.ITransactionRepository>()));
  gh.factory<_i24.SharedPreferenceDataSource>(
      () => _i24.SharedPreferenceDataSource(get<_i14.SharedPreferences>()));
  gh.factory<_i25.CreateWalletUseCase>(
      () => _i25.CreateWalletUseCase(get<_i19.IWalletRepository>()));
  gh.factory<_i26.IAuthRepository>(
      () => _i27.AuthImplementation(get<_i22.SecureStorage>()));
  gh.factory<_i28.CreatePassCodeUseCase>(
      () => _i28.CreatePassCodeUseCase(get<_i26.IAuthRepository>()));
  return get;
}

class _$RPCModule extends _i16.RPCModule {}

class _$RegisterModule extends _i29.RegisterModule {}
