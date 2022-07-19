import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetPointOfOwnerUseCase extends UseCase<double, int> {
  final INFTRepository _inftRepository;

  GetPointOfOwnerUseCase(this._inftRepository);

  @override
  Future<Either<Failure, double>> call(int params) async {
    final result = await _inftRepository.pointOf(params);
    return result.fold(Left.new, (r) => Right(r.point));
  }
}
