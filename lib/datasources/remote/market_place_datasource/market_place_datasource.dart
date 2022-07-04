import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';

part 'market_place_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kDebugMode ? Const.baseApiDev : Const.baseApiDev)
abstract class MarketPlaceDataSource {
  @factoryMethod
  factory MarketPlaceDataSource(Dio dio) {
    // dio.interceptors.add(authInterceptor);
    // dio.interceptors.add(getIt<RefreshTokenInterceptor>(param1: dio));
    return _MarketPlaceDataSource(dio);
  }

  @GET('/market-place')
  Future<MarketPlaceModel> getMarketPlace(@Query('categoryId') int categoryId);

}
