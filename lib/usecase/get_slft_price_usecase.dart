
import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/get_repair_entity/get_repair_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetSlftPriceUseCase extends UseCase<String, NoParams> {
  final IUserRepository _iUserRepository;

  GetSlftPriceUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, String>> call(params) {
    return _iUserRepository.getSlftPrice();
  }
}

