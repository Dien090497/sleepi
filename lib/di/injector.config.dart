// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i7;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../common/utils/date_time_utils.dart' as _i4;
import '../datasources/local/get_storage_datasource.dart' as _i6;
import '../datasources/local/isar/isar_datasource.dart' as _i10;
import '../datasources/local/secure_storage.dart' as _i15;
import '../datasources/local/shared_preference_datasource.dart' as _i17;
import '../datasources/remote/network/web3_datasource.dart' as _i14;
import '../repository/auth_repository.dart' as _i8;
import '../repository/implementations/auth_implementation.dart' as _i9;
import '../usecase/login_usecase.dart' as _i12;
import 'register_module.dart' as _i18; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i6.GetStorageDataSource>(
      () => _i6.GetStorageDataSource(get<_i7.GetStorage>()));
  gh.factory<_i8.IAuthRepository>(() => _i9.AuthImplementation());
  gh.singleton<_i10.IsarDataSource>(_i10.IsarDataSource(get<_i11.Isar>()));
  gh.factory<_i12.LogInUseCase>(() => _i12.LogInUseCase());
  await gh.factoryAsync<_i13.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i6.StorageKeys>(() => _i6.StorageKeys());
  gh.singleton<_i14.Web3DataSource>(_i14.Web3DataSource(get<_i3.Client>()));
  gh.factory<_i15.SecureStorage>(() => _i15.SecureStorage(
      get<_i16.FlutterSecureStorage>(), get<_i13.SharedPreferences>()));
  gh.factory<_i17.SharedPreferenceDataSource>(
      () => _i17.SharedPreferenceDataSource(get<_i13.SharedPreferences>()));
  return get;
}

class _$RPCModule extends _i14.RPCModule {}

class _$RegisterModule extends _i18.RegisterModule {}
