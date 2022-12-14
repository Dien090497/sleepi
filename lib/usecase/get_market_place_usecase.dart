import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/list_market_place/list_market_place_model.dart';
import 'package:slee_fi/repository/market_place_repository.dart';
import 'package:slee_fi/schema/market/market_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class MarketPlaceUseCase extends UseCase<ListMarketPlaceModel, MarketSchema> {
  final IMarketPlaceRepository _iMarketPlaceRepository;

  MarketPlaceUseCase(this._iMarketPlaceRepository);

  @override
  Future<Either<FailureMessage, ListMarketPlaceModel>> call(MarketSchema params) {
    return _iMarketPlaceRepository.getListMarketPlace(params);
  }
}
