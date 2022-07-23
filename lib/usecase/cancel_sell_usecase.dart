
import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/nft_sell_response_entity/nft_sell_response_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class NFTCancelSellUseCase extends UseCase<NftSellResponseEntity, num> {
  final INFTRepository _iNftRepository;

  NFTCancelSellUseCase(this._iNftRepository);

  @override
  Future<Either<Failure, NftSellResponseEntity>> call(params) {
    return _iNftRepository.cancelSell(params);
  }
}