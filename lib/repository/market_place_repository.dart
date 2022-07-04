import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';

abstract class IMarketPlaceRepository {
  Future<Either<Failure, MarketPlaceModel>> getMarketPlace(int categoryId);

}
