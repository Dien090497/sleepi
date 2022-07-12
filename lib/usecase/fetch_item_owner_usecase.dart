import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/item_entity/item_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/param_filler_item_fetch/filter_item_chema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchItemOwnerUseCase extends UseCase<List<ItemEntity>, FilterItemSchema> {
  final IUserRepository _iUserRepository;

  FetchItemOwnerUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, List<ItemEntity>>> call(params) {
    return _iUserRepository.fetchItemOwner(params);
  }
}
