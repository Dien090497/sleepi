import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/mint_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetMintingUseCase extends UseCase<dynamic, GetMintingParams> {
  final MintRepository mintRepository;

  GetMintingUseCase(this.mintRepository);

  @override
  Future<Either<Failure, dynamic>> call(GetMintingParams params) {
    return mintRepository.getMint(params.bedIdParent1, params.bedIdParent2, params.isInsurance);
  }
}

class GetMintingParams {
  final int bedIdParent1;
  final int bedIdParent2;
  final double isInsurance;

  GetMintingParams(this.bedIdParent1, this.bedIdParent2, this.isInsurance);
}
