import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/param_filler_item_fetch/filter_item_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchItemOwnerUseCase extends UseCase<List<BedEntity>, FilterItemSchema> {
  final IUserRepository _iUserRepository;

  FetchItemOwnerUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, List<BedEntity>>> call(params) {
    return _iUserRepository.fetchItemOwner(params);
  }
}
