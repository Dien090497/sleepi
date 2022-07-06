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
import '../datasources/local/secure_storage.dart' as _i27;
import '../datasources/local/shared_preference_datasource.dart' as _i28;
import '../datasources/remote/auth_datasource/auth_datasource.dart' as _i19;
import '../datasources/remote/network/nft_datasource.dart' as _i25;
import '../datasources/remote/network/spending_datasource.dart' as _i29;
import '../datasources/remote/network/web3_datasource.dart' as _i30;
import '../datasources/remote/network/web3_provider.dart' as _i18;
import '../datasources/remote/nft_api/nft_api.dart' as _i14;
import '../repository/auth_repository.dart' as _i33;
import '../repository/implementations/auth_implementation.dart' as _i34;
import '../repository/implementations/market_place_implementation.dart' as _i21;
import '../repository/implementations/nft_implementation.dart' as _i36;
import '../repository/implementations/spending_implementation.dart' as _i38;
import '../repository/implementations/transaction_implementation.dart' as _i40;
import '../repository/implementations/user_implementations.dart' as _i23;
import '../repository/implementations/wallet_implementation.dart' as _i42;
import '../repository/market_place_repository.dart' as _i20;
import '../repository/nft_repository.dart' as _i35;
import '../repository/spending_repository.dart' as _i37;
import '../repository/transaction_repository.dart' as _i39;
import '../repository/user_repository.dart' as _i22;
import '../repository/wallet_repository.dart' as _i41;
import '../usecase/activation_code_setting_usecase.dart' as _i31;
import '../usecase/approve_usecase.dart' as _i62;
import '../usecase/change_password_usecase.dart' as _i32;
import '../usecase/check_activation_code_usecase.dart' as _i63;
import '../usecase/check_approve_usecase.dart' as _i64;
import '../usecase/create_pass_code_usecase.dart' as _i66;
import '../usecase/create_password_usecase.dart' as _i67;
import '../usecase/current_user_usecase.dart' as _i69;
import '../usecase/get_amount_out_min_usecase.dart' as _i71;
import '../usecase/get_balance_for_tokens_usecase.dart' as _i72;
import '../usecase/get_balance_token_usecase.dart' as _i73;
import '../usecase/get_current_network_usecase.dart' as _i75;
import '../usecase/get_list_nft_detail_usecase.dart' as _i76;
import '../usecase/get_market_place_usecase.dart' as _i24;
import '../usecase/get_nfts_balance_usecase.dart' as _i77;
import '../usecase/get_nfts_ids_usecase.dart' as _i78;
import '../usecase/is_first_open_app_usecase.dart' as _i44;
import '../usecase/is_nft_approve_for_all_usecase.dart' as _i45;
import '../usecase/is_passcode_created_usecase.dart' as _i46;
import '../usecase/login_usecase.dart' as _i47;
import '../usecase/logout_usecase.dart' as _i48;
import '../usecase/make_first_open_app_usecase.dart' as _i49;
import '../usecase/run_app_init_usecase.dart' as _i26;
import '../usecase/send_otp_mail_usecase.dart' as _i50;
import '../usecase/send_to_external_usecase.dart' as _i51;
import '../usecase/send_token_to_external.dart' as _i52;
import '../usecase/set_nft_approval_for_all_usecase.dart' as _i53;
import '../usecase/setting_active_code_usecase.dart' as _i54;
import '../usecase/sign_up_usecase.dart' as _i55;
import '../usecase/swap_token_usecase.dart' as _i56;
import '../usecase/to_spending_usecase.dart' as _i57;
import '../usecase/transfer_nft_usecase.dart' as _i58;
import '../usecase/validate_mnemonic.dart' as _i59;
import '../usecase/validate_passcode_usecase.dart' as _i60;
import '../usecase/verify_otp_usecase.dart' as _i61;
import '../usecase/wallet/create_wallet_usecase.dart' as _i68;
import '../usecase/wallet/current_wallet_usecase.dart' as _i70;
import '../usecase/wallet/first_open_wallet_session_usecase.dart' as _i65;
import '../usecase/wallet/get_current_mnemonic_usecasse.dart' as _i74;
import '../usecase/wallet/import_wallet_usecase.dart' as _i43;
import 'register_module.dart' as _i79; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i14.NftApi>(() => _i14.NftApi(get<_i7.Dio>()));
  gh.factory<_i15.RandomUtils>(() => _i15.RandomUtils());
  await gh.factoryAsync<_i16.SharedPreferences>(() => registerModule.sharedPref,
      preResolve: true);
  gh.factory<_i11.StorageKeys>(() => _i11.StorageKeys());
  gh.factory<_i17.ToastUtils>(() => _i17.ToastUtils());
  gh.singleton<_i18.Web3Provider>(_i18.Web3Provider(get<_i4.Client>()));
  gh.factory<_i19.AuthDataSource>(() => _i19.AuthDataSource(get<_i7.Dio>()));
  gh.factory<_i20.IMarketPlaceRepository>(
      () => _i21.TransactionImplementation(get<_i19.AuthDataSource>()));
  gh.factory<_i22.IUserRepository>(
      () => _i23.UserImplementation(get<_i19.AuthDataSource>()));
  gh.factory<_i24.MarketPlaceUseCase>(
      () => _i24.MarketPlaceUseCase(get<_i20.IMarketPlaceRepository>()));
  gh.factory<_i25.NFTDataSource>(
      () => _i25.NFTDataSource(get<_i18.Web3Provider>()));
  gh.factory<_i26.RunAppInitUseCase>(() => _i26.RunAppInitUseCase(
      get<_i18.Web3Provider>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i3.AppFlyerCustom>()));
  gh.factory<_i27.SecureStorage>(() => _i27.SecureStorage(
      get<_i9.FlutterSecureStorage>(), get<_i16.SharedPreferences>()));
  gh.factory<_i28.SharedPreferenceDataSource>(
      () => _i28.SharedPreferenceDataSource(get<_i16.SharedPreferences>()));
  gh.factory<_i29.SpendingDataSource>(
      () => _i29.SpendingDataSource(get<_i18.Web3Provider>()));
  gh.factory<_i30.Web3DataSource>(
      () => _i30.Web3DataSource(get<_i18.Web3Provider>()));
  gh.factory<_i31.ActivationCodeSettingUseCase>(
      () => _i31.ActivationCodeSettingUseCase(get<_i22.IUserRepository>()));
  gh.factory<_i32.ChangePasswordUseCase>(
      () => _i32.ChangePasswordUseCase(get<_i22.IUserRepository>()));
  gh.factory<_i33.IAuthRepository>(() => _i34.AuthImplementation(
      get<_i27.SecureStorage>(),
      get<_i19.AuthDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i11.GetStorageDataSource>()));
  gh.factory<_i35.INFTRepository>(() =>
      _i36.NFTImplementation(get<_i25.NFTDataSource>(), get<_i14.NftApi>()));
  gh.factory<_i37.ISpendingRepository>(() => _i38.SpendingImplementation(
      get<_i29.SpendingDataSource>(), get<_i30.Web3DataSource>()));
  gh.factory<_i39.ITransactionRepository>(() => _i40.TransactionImplementation(
      get<_i30.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>()));
  gh.factory<_i41.IWalletRepository>(() => _i42.WalletImplementation(
      get<_i30.Web3DataSource>(),
      get<_i11.GetStorageDataSource>(),
      get<_i13.IsarDataSource>(),
      get<_i18.Web3Provider>()));
  gh.factory<_i43.ImportWalletUseCase>(
      () => _i43.ImportWalletUseCase(get<_i41.IWalletRepository>()));
  gh.factory<_i44.IsFirstOpenAppUseCase>(
      () => _i44.IsFirstOpenAppUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i45.IsNftApproveForAllUseCase>(
      () => _i45.IsNftApproveForAllUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i46.IsPassCodeCreatedUseCase>(
      () => _i46.IsPassCodeCreatedUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i47.LogInUseCase>(
      () => _i47.LogInUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i48.LogOutUseCase>(
      () => _i48.LogOutUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i49.MakeFirstOpenAppUseCase>(
      () => _i49.MakeFirstOpenAppUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i50.SendOTPMailUseCase>(
      () => _i50.SendOTPMailUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i51.SendToExternalUseCase>(
      () => _i51.SendToExternalUseCase(get<_i39.ITransactionRepository>()));
  gh.factory<_i52.SendTokenToExternalUseCase>(() =>
      _i52.SendTokenToExternalUseCase(get<_i39.ITransactionRepository>()));
  gh.factory<_i53.SetNftApprovalForAllUseCase>(
      () => _i53.SetNftApprovalForAllUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i54.SettingActiveCodeUseCase>(
      () => _i54.SettingActiveCodeUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i55.SignUpUseCase>(
      () => _i55.SignUpUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i56.SwapTokenUseCase>(
      () => _i56.SwapTokenUseCase(get<_i41.IWalletRepository>()));
  gh.factory<_i57.ToSpendingUseCase>(() => _i57.ToSpendingUseCase(
      get<_i37.ISpendingRepository>(), get<_i41.IWalletRepository>()));
  gh.factory<_i58.TransferNftUseCase>(
      () => _i58.TransferNftUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i59.ValidateMnemonicUseCase>(
      () => _i59.ValidateMnemonicUseCase(get<_i41.IWalletRepository>()));
  gh.factory<_i60.ValidatePassCodeUseCase>(
      () => _i60.ValidatePassCodeUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i61.VerifyOTPUseCase>(
      () => _i61.VerifyOTPUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i62.ApproveUseCase>(() => _i62.ApproveUseCase(
      get<_i37.ISpendingRepository>(), get<_i41.IWalletRepository>()));
  gh.factory<_i63.CheckActivationCodeUseCase>(
      () => _i63.CheckActivationCodeUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i64.CheckApproveUseCase>(
      () => _i64.CheckApproveUseCase(get<_i41.IWalletRepository>()));
  gh.factory<_i65.CheckFirstOpenWallet>(
      () => _i65.CheckFirstOpenWallet(get<_i41.IWalletRepository>()));
  gh.factory<_i66.CreatePassCodeUseCase>(
      () => _i66.CreatePassCodeUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i67.CreatePasswordUseCase>(
      () => _i67.CreatePasswordUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i68.CreateWalletUseCase>(
      () => _i68.CreateWalletUseCase(get<_i41.IWalletRepository>()));
  gh.factory<_i69.CurrentUserUseCase>(
      () => _i69.CurrentUserUseCase(get<_i33.IAuthRepository>()));
  gh.factory<_i70.CurrentWalletUseCase>(
      () => _i70.CurrentWalletUseCase(get<_i41.IWalletRepository>()));
  gh.factory<_i71.GetAmountOutMinUseCase>(
      () => _i71.GetAmountOutMinUseCase(get<_i41.IWalletRepository>()));
  gh.factory<_i72.GetBalanceForTokensUseCase>(
      () => _i72.GetBalanceForTokensUseCase(get<_i41.IWalletRepository>()));
  gh.factory<_i73.GetBalanceTokenUseCase>(
      () => _i73.GetBalanceTokenUseCase(get<_i41.IWalletRepository>()));
  gh.factory<_i74.GetCurrentMnemonicUsecase>(
      () => _i74.GetCurrentMnemonicUsecase(get<_i41.IWalletRepository>()));
  gh.factory<_i75.GetCurrentNetworkUseCase>(
      () => _i75.GetCurrentNetworkUseCase(get<_i41.IWalletRepository>()));
  gh.factory<_i76.GetListNftDetailUseCase>(
      () => _i76.GetListNftDetailUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i77.GetNFTsBalanceUseCase>(
      () => _i77.GetNFTsBalanceUseCase(get<_i35.INFTRepository>()));
  gh.factory<_i78.GetNFTsIDsUseCase>(
      () => _i78.GetNFTsIDsUseCase(get<_i35.INFTRepository>()));
  return get;
}

class _$RPCModule extends _i30.RPCModule {}

class _$RegisterModule extends _i79.RegisterModule {}
