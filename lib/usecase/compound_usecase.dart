import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CompoundUseCase extends UseCase<dynamic, NoParams> {
  final ISpendingRepository _iSpendingRepository;

  CompoundUseCase(this._iSpendingRepository);

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return _iSpendingRepository.compound();
  }
}
