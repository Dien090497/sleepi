import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/schema/update_point/update_point_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class UpdateAttributeUseCase extends UseCase<String, UpdatePointSchema> {
  final INFTRepository _inftRepository;

  UpdateAttributeUseCase(this._inftRepository);

  @override
  Future<Either<Failure, String>> call(UpdatePointSchema params) {
    return _inftRepository.updatePoint(params);
  }
}
