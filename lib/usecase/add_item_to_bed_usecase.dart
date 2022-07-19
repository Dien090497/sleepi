import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/response_model/response_model.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class AddItemToBedUseCase extends UseCase<ResponseModel, AddItemToBedParam> {
  final IUserRepository _iUserRepository;

  AddItemToBedUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, ResponseModel>> call(params) {
    return _iUserRepository.addItemToBed(params);
  }
}

class AddItemToBedParam {
  final int bedId;
  final int itemId;

  AddItemToBedParam(this.bedId, this.itemId);
}
