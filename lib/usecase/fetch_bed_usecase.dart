import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchBedUseCase extends UseCase<List<BedEntity>, FetchBedParam> {
  final IUserRepository _iUserRepository;

  FetchBedUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, List<BedEntity>>> call(params) {
    return _iUserRepository.fetchListBed(params);
  }
}

enum CategoryType {
  bed(1),
  jewel(2),
  item(3);

  final int type;

  const CategoryType(this.type);

  @override
  String toString() => type.toString();

  int toJson() => type;
}

class FetchBedParam {
  final int page;
  final int limit;
  final CategoryType categoryId;

  /// [bedType]   default is  [bedType] = '',  bedbox  if [bedType] = bedbox**/
  final String bedType;

  FetchBedParam(this.page, this.limit, this.categoryId, {this.bedType = ''});
}
