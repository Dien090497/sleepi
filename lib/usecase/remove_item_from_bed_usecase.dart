import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/response_model/response_model.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/add_item_to_bed_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class RemoveItemFromBedUseCase
    extends UseCase<ResponseModel, AddItemToBedParam> {
  final IUserRepository _iUserRepository;

  RemoveItemFromBedUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, ResponseModel>> call(params) {
    return _iUserRepository.removeItemInBed(params);
  }
}
