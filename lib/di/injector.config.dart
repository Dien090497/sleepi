// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:flutter_translate/flutter_translate.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../datasources/local/shared_preference_datasource.dart' as _i10;
import '../repository/auth_repository.dart' as _i4;
import '../repository/implementations/auth_implementation.dart' as _i5;
import '../usecase/login_usecase.dart' as _i6;
import 'register_module.dart' as _i11;
import 'translations/translate_implementation.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio);
  gh.factory<_i4.IAuthRepository>(() => _i5.AuthImplementation());
  gh.factory<_i6.LogInUseCase>(() => _i6.LogInUseCase());
  await gh.factoryAsync<_i7.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i8.ITranslatePreferences>(
      () => _i9.TranslateImplementation(get<_i7.SharedPreferences>()));
  gh.factory<_i10.SharedPreferenceDataSource>(
      () => _i10.SharedPreferenceDataSource(get<_i7.SharedPreferences>()));
  return get;
}

class _$RegisterModule extends _i11.RegisterModule {}
