import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/list_market_place/list_market_place_model.dart';
import 'package:slee_fi/repository/market_place_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class MarketPlaceUseCase extends UseCase<ListMarketPlaceModel, int> {
  final IMarketPlaceRepository _iMarketPlaceRepository;

  MarketPlaceUseCase(this._iMarketPlaceRepository);

  @override
  Future<Either<Failure, ListMarketPlaceModel>> call(int params) {
    return _iMarketPlaceRepository.getListMarketPlace(params);
  }

}
