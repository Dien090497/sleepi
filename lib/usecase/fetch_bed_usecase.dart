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

enum CategoryType {
  item(3),
  bed(1),
  jewel(2);

  final int type;

  const CategoryType(this.type);
}

class FetchBedParam {
  final int page;
  final int limit;
  final CategoryType categoryId;
  final AttributeNFT attributeNFT;

  /// [bedType]   default is  [bedType] = '',  bedbox  if [bedType] = bedbox**/
  final String bedType;

  FetchBedParam(this.page, this.limit, this.categoryId, this.attributeNFT,
      {this.bedType = ''});
}
