import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slee_fi/models/isar_models/ens_isar/ens_isar_model.dart';
import 'package:slee_fi/models/isar_models/explorers_isar/explorers_isar_model.dart';
import 'package:slee_fi/models/isar_models/history_isar/history_isar_model.dart';
import 'package:slee_fi/models/isar_models/native_currency_isar/native_currency_isar_model.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/isar_models/token_default_isar/token_default_model.dart';
import 'package:slee_fi/models/isar_models/token_isar/token_isar_model.dart';
import 'package:slee_fi/models/isar_models/transaction_isar/transaction_isar_model.dart';
import 'package:slee_fi/models/isar_models/wallet_isar/wallet_isar_model.dart';

/// Package được thêm vào đây
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();

  Dio get dio => Dio(BaseOptions(
        connectTimeout: 30000,
        receiveTimeout: 30000,
      ));

  @preResolve
  Future<Directory> get isarDir => getApplicationSupportDirectory();

  @preResolve
  Future<Isar> isar(Directory isarDir) => Isar.open(
        schemas: [
          NetworkIsarModelSchema,
          WalletIsarModelSchema,
          NativeCurrencyIsarModelSchema,
          TokenIsarModelSchema,
          EnsIsarModelSchema,
          ExplorersIsarModelSchema,
          TokenDefaultModelSchema,
          HistoryIsarModelSchema,
          TransactionIsarModelSchema,
        ],
        directory: isarDir.path,
        // inspector: true,
      );

  GetStorage get getStorage => GetStorage();

  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();

  Connectivity get connectivity => Connectivity();

  DeviceInfoPlugin get deviceInfoPlugin => DeviceInfoPlugin();
}
