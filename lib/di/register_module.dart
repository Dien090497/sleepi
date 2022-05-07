import 'dart:async';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Package được thêm vào đây
@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get sharedPref => SharedPreferences.getInstance();

  Dio get dio => Dio();
}
