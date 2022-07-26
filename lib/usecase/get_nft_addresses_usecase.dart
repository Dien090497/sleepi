import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetNftAddressesUseCase extends UseCase<List<String>, NoParams> {
  final INFTRepository _inftRepository;

  GetNftAddressesUseCase(this._inftRepository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) {
    return _inftRepository.getNftAddresses();
  }
}
