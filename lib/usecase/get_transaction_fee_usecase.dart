
import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetTransactionFeeUseCase extends UseCase<String, NoParams> {
  final INFTRepository _iNftRepository;

  GetTransactionFeeUseCase(this._iNftRepository);

  @override
  Future<Either<Failure, String>> call(params) {
    return _iNftRepository.getTransactionFee();
  }
}