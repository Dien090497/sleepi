import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/minting/info_minting_model.dart';
import 'package:slee_fi/repository/mint_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetMintingUseCase extends UseCase<dynamic, GetMintingParams> {
  final MintRepository mintRepository;

  GetMintingUseCase(this.mintRepository);

  @override
  Future<Either<FailureMessage, InfoMintingModel>> call(GetMintingParams params) {
    return mintRepository.getMint(params.bedIdParent1, params.bedIdParent2);
  }
}

class GetMintingParams {
  final int bedIdParent1;
  final int bedIdParent2;

  GetMintingParams(this.bedIdParent1, this.bedIdParent2);
}
