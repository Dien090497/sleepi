import 'package:dartz/dartz.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchBedUseCase extends UseCase<List<BedModel>, FetchBedParam> {
  final IUserRepository _iUserRepository;

  FetchBedUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, List<BedModel>>> call(params) {
    return _iUserRepository.fetchListBed(params);
  }
}

class FetchBedParam {
  final int page;
  final int limit;
  final int categoryId;
  final AttributeNFT attributeNFT;

  FetchBedParam(this.page, this.limit, this.categoryId, this.attributeNFT);
}
