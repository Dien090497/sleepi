// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'dart:io' as _i7;

import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:get_storage/get_storage.dart' as _i9;
import 'package:http/http.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../common/utils/appsflyer_custom.dart' as _i3;
import '../common/utils/date_time_utils.dart' as _i5;
import '../common/utils/random_utils.dart' as _i13;
import '../common/utils/toast_utils.dart' as _i15;
import '../datasources/local/get_storage_datasource.dart' as _i10;
import '../datasources/local/isar/isar_datasource.dart' as _i12;
import '../datasources/local/secure_storage.dart' as _i19;
import '../datasources/local/shared_preference_datasource.dart' as _i20;
import '../datasources/remote/network/auth_datasource/auth_datasource.dart'
    as _i17;
import '../datasources/remote/network/web3_datasource.dart' as _i21;
import '../datasources/remote/network/web3_provider.dart' as _i16;
import '../repository/auth_repository.dart' as _i22;
import '../repository/implementations/auth_implementation.dart' as _i23;
import '../repository/implementations/wallet_implementation.dart' as _i25;
import '../repository/wallet_repository.dart' as _i24;
import '../usecase/create_password_usecase.dart' as _i30;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i32;
import '../usecase/get_passcode_usecase.dart' as _i33;
import '../usecase/login_usecase.dart' as _i26;
import '../usecase/run_app_init_usecase.dart' as _i18;
import '../usecase/send_otp_mail_usecase.dart' as _i27;
import '../usecase/setting_active_code_usecase.dart' as _i28;
import '../usecase/sign_up_usecase.dart' as _i29;
import '../usecase/wallet/current_wallet_usecase.dart' as _i31;
import 'register_module.dart' as _i34; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final rPCModule = _$RPCModule();
  final registerModule = _$RegisterModule();
  gh.singleton<_i3.AppFlyerCustom>(_i3.AppFlyerCustom());
  gh.factory<_i4.Client>(() => rPCModule.httpClient);
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
  gh.factory<_i13.RandomUtils>(() => _i13.RandomUtils());
  await gh.factoryAsync<_i14.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i10.StorageKeys>(() => _i10.StorageKeys());
  gh.factory<_i15.ToastUtils>(() => _i15.ToastUtils());
  gh.singleton<_i16.Web3Provider>(_i16.Web3Provider(get<_i4.Client>()));
  gh.factory<_i17.AuthDataSource>(() => _i17.AuthDataSource(get<_i6.Dio>()));
  gh.factory<_i18.RunAppInitUseCase>(() => _i18.RunAppInitUseCase(
      get<_i16.Web3Provider>(),
      get<_i12.IsarDataSource>(),
      get<_i10.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i19.SecureStorage>(() => _i19.SecureStorage(
      get<_i8.FlutterSecureStorage>(), get<_i14.SharedPreferences>()));
  gh.factory<_i20.SharedPreferenceDataSource>(
      () => _i20.SharedPreferenceDataSource(get<_i14.SharedPreferences>()));
  gh.factory<_i21.Web3DataSource>(
      () => _i21.Web3DataSource(get<_i16.Web3Provider>()));
  gh.factory<_i22.IAuthRepository>(() => _i23.AuthImplementation(
      get<_i19.SecureStorage>(), get<_i17.AuthDataSource>()));
  gh.factory<_i24.IWalletRepository>(() => _i25.WalletImplementation(
      get<_i21.Web3DataSource>(),
      get<_i10.GetStorageDataSource>(),
      get<_i12.IsarDataSource>(),
      get<_i16.Web3Provider>()));
  gh.factory<_i26.LogInUseCase>(
      () => _i26.LogInUseCase(get<_i22.IAuthRepository>()));
  gh.factory<_i27.SendOTPMailUseCase>(
      () => _i27.SendOTPMailUseCase(get<_i22.IAuthRepository>()));
  gh.factory<_i28.SettingActiveCodeUseCase>(
      () => _i28.SettingActiveCodeUseCase(get<_i22.IAuthRepository>()));
  gh.factory<_i29.SignUpUseCase>(
      () => _i29.SignUpUseCase(get<_i22.IAuthRepository>()));
  gh.factory<_i30.CreatePasswordUseCase>(
      () => _i30.CreatePasswordUseCase(get<_i22.IAuthRepository>()));
  gh.factory<_i31.CurrentWalletUseCase>(
      () => _i31.CurrentWalletUseCase(get<_i24.IWalletRepository>()));
  gh.factory<_i32.GetBalanceForTokensUseCase>(
      () => _i32.GetBalanceForTokensUseCase(get<_i24.IWalletRepository>()));
  gh.factory<_i33.GetPassCodeUseCase>(
      () => _i33.GetPassCodeUseCase(get<_i22.IAuthRepository>()));
  return get;
}

class _$RPCModule extends _i21.RPCModule {}

class _$RegisterModule extends _i34.RegisterModule {}
