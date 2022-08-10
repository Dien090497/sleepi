import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/minting/minting_model.dart';
import 'package:slee_fi/repository/mint_repository.dart';
import 'package:slee_fi/schema/minting/minting_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class MintingUseCase extends UseCase<dynamic, MintingSchema> {
  final MintRepository mintRepository;

  MintingUseCase(this.mintRepository);

  @override
  Future<Either<FailureMessage, MintingModel>> call(MintingSchema params) {
    return mintRepository.mint(params);
  }
}
