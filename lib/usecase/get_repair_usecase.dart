
import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/nft_sell_response_entity/nft_sell_response_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/schema/nft_sell_schema/nft_sell_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetRepairUseCase extends UseCase<dynamic, num> {
  final INFTRepository _iNftRepository;

  GetRepairUseCase(this._iNftRepository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _iNftRepository.getRepair(bedId: params);
  }
}

