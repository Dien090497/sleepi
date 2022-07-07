import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/list_market_place/list_market_place_model.dart';
import 'package:slee_fi/schema/market/market_schema.dart';

abstract class IMarketPlaceRepository {
  Future<Either<Failure, ListMarketPlaceModel>> getListMarketPlace(MarketSchema params);

}
