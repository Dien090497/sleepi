import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/nft_family/nft_family_model.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetNftFamilyUseCase extends UseCase<NftFamilyModel, ParamsFamily> {
  final INFTRepository _inftRepository;

  GetNftFamilyUseCase(this._inftRepository);

  @override
  Future<Either<Failure, NftFamilyModel>> call(ParamsFamily params) {
    /// bedId
    return _inftRepository.fetchFamily(params: params);
  }
}

class ParamsFamily {
  final num bedId;

  ParamsFamily({required this.bedId});
}
