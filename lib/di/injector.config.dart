// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i6;

import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i8;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../common/utils/date_time_utils.dart' as _i4;
import '../common/utils/random_utils.dart' as _i14;
import '../common/utils/toast_utils.dart' as _i16;
import '../datasources/local/get_storage_datasource.dart' as _i7;
import '../datasources/local/isar/isar_datasource.dart' as _i12;
import '../datasources/local/secure_storage.dart' as _i18;
import '../datasources/local/shared_preference_datasource.dart' as _i20;
import '../datasources/remote/network/web3_datasource.dart' as _i17;
import '../repository/auth_repository.dart' as _i9;
import '../repository/implementations/auth_implementation.dart' as _i10;
import '../usecase/login_usecase.dart' as _i13;
import 'register_module.dart' as _i21; // ignore_for_file: unnecessary_lambdas

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
  await gh.factoryAsync<_i11.Isar>(
      () => registerModule.isar(get<_i6.Directory>()),
      preResolve: true);
  gh.singleton<_i12.IsarDataSource>(_i12.IsarDataSource(get<_i11.Isar>()));
  gh.factory<_i13.LogInUseCase>(() => _i13.LogInUseCase());
  gh.factory<_i14.RandomUtils>(() => _i14.RandomUtils());
  await gh.factoryAsync<_i15.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i7.StorageKeys>(() => _i7.StorageKeys());
  gh.factory<_i16.ToastUtils>(() => _i16.ToastUtils());
  gh.singleton<_i17.Web3DataSource>(_i17.Web3DataSource(get<_i3.Client>()));
  gh.factory<_i18.SecureStorage>(() => _i18.SecureStorage(
      get<_i19.FlutterSecureStorage>(), get<_i15.SharedPreferences>()));
  gh.factory<_i20.SharedPreferenceDataSource>(
      () => _i20.SharedPreferenceDataSource(get<_i15.SharedPreferences>()));
  return get;
}

class _$RPCModule extends _i17.RPCModule {}

class _$RegisterModule extends _i21.RegisterModule {}
