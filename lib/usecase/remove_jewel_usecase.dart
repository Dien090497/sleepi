import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/add_jewel_schema/add_jewel_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class RemoveJewelUseCase extends UseCase<dynamic, AddJewelSchema> {
  final IUserRepository _iUserRepository;

  RemoveJewelUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _iUserRepository.removeJewel(params);
  }
}
