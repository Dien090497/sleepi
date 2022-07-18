import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/response_model/response_model.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/add_jewel_schema/add_jewel_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class RemoveJewelUseCase extends UseCase<ResponseModel, AddJewelSchema> {
  final IUserRepository _iUserRepository;

  RemoveJewelUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, ResponseModel>> call(params) {
    return _iUserRepository.removeJewel(params);
  }
}
