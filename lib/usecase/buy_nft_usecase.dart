import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/market_place/result_buy_model.dart';
import 'package:slee_fi/repository/market_place_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class BuyNFTUseCase extends UseCase<ResultBuyModel, int>{
  final IMarketPlaceRepository _iMarketPlaceRepository;

  BuyNFTUseCase(this._iMarketPlaceRepository);

  @override
  Future<Either<Failure, ResultBuyModel>> call(int params) {
    return _iMarketPlaceRepository.postBuyNFT(params);
  }
}