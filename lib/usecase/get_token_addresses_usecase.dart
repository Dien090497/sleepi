import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetTokenAddressesUseCase extends UseCase<List<String>, NoParams> {
  final INFTRepository _inftRepository;

  GetTokenAddressesUseCase(this._inftRepository);

  @override
  Future<Either<Failure, List<String>>> call(NoParams params) {
    return _inftRepository.getTokenAddresses();
  }
}
