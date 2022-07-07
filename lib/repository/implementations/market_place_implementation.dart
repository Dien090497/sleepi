import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/list_market_place/list_market_place_model.dart';
import 'package:slee_fi/repository/market_place_repository.dart';
import 'package:slee_fi/schema/market/market_schema.dart';

@Injectable(as: IMarketPlaceRepository)
class TransactionImplementation extends IMarketPlaceRepository {
  final AuthDataSource _authDataSource;

  TransactionImplementation(this._authDataSource);

  @override
  Future<Either<Failure, ListMarketPlaceModel>> getListMarketPlace(
      MarketSchema params) async {
    try {
      var result = await _authDataSource.getMarketPlace(params);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}