import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/repository/market_place_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class MarketPlaceUseCase extends UseCase<MarketPlaceModel, int> {
  final IMarketPlaceRepository _iMarketPlaceRepository;

  MarketPlaceUseCase(this._iMarketPlaceRepository);

  @override
  Future<Either<Failure, MarketPlaceModel>> call(int params) {
    return _iMarketPlaceRepository.getMarketPlace(params);
  }

}
