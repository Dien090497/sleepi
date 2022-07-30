import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetListTokenUseCase extends UseCase<List<dynamic>, NoParams>{

  final INFTRepository _iNFTRepository;

  GetListTokenUseCase(this._iNFTRepository);

  @override
  Future<Either<Failure, List<dynamic>>> call(params) {
    return _iNFTRepository.getMapTokenAddresses();
  }
}