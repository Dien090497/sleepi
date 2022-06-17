// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i6;

import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i22;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i8;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i13;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import '../common/utils/date_time_utils.dart' as _i4;
import '../common/utils/random_utils.dart' as _i16;
import '../common/utils/toast_utils.dart' as _i18;
import '../datasources/local/get_storage_datasource.dart' as _i7;
import '../datasources/local/isar/isar_datasource.dart' as _i14;
import '../datasources/local/secure_storage.dart' as _i21;
import '../datasources/local/shared_preference_datasource.dart' as _i23;
import '../datasources/remote/network/web3_datasource.dart' as _i20;
import '../repository/auth_repository.dart' as _i9;
import '../repository/implementations/auth_implementation.dart' as _i10;
import '../repository/implementations/wallet_implementation.dart' as _i12;
import '../repository/wallet_repository.dart' as _i11;
import '../usecase/login_usecase.dart' as _i15;
import '../usecase/wallet_usecase.dart' as _i19;
import 'register_module.dart' as _i24; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i7.GetStorageDataSource>(
      () => _i7.GetStorageDataSource(get<_i8.GetStorage>()));
  gh.factory<_i9.IAuthRepository>(() => _i10.AuthImplementation());
  gh.factory<_i11.IWalletRepository>(() => _i12.WalletImplementation());
  await gh.factoryAsync<_i13.Isar>(
      () => registerModule.isar(get<_i6.Directory>()),
      preResolve: true);
  gh.singleton<_i14.IsarDataSource>(_i14.IsarDataSource(get<_i13.Isar>()));
  gh.factory<_i15.LogInUseCase>(() => _i15.LogInUseCase());
  gh.factory<_i16.RandomUtils>(() => _i16.RandomUtils());
  await gh.factoryAsync<_i17.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i7.StorageKeys>(() => _i7.StorageKeys());
  gh.factory<_i18.ToastUtils>(() => _i18.ToastUtils());
  gh.factory<_i19.WalletUseCase>(() => _i19.WalletUseCase());
  gh.singleton<_i20.Web3DataSource>(_i20.Web3DataSource(get<_i3.Client>()));
  gh.factory<_i21.SecureStorage>(() => _i21.SecureStorage(
      get<_i22.FlutterSecureStorage>(), get<_i17.SharedPreferences>()));
  gh.factory<_i23.SharedPreferenceDataSource>(
      () => _i23.SharedPreferenceDataSource(get<_i17.SharedPreferences>()));
  return get;
}

class _$RPCModule extends _i20.RPCModule {}

class _$RegisterModule extends _i24.RegisterModule {}
