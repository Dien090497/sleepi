import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/remote/market_place_datasource/market_place_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/repository/market_place_repository.dart';

@Injectable(as: IMarketPlaceRepository)
class TransactionImplementation extends IMarketPlaceRepository{
  final Web3DataSource _web3DataSource;
  final MarketPlaceDataSource _marketPlaceDataSource;
  final GetStorageDataSource _getStorageDataSource;
  final IsarDataSource _isarDataSource;

  TransactionImplementation(this._web3DataSource, this._getStorageDataSource, this._isarDataSource, this._marketPlaceDataSource);

  @override
  Future<Either<Failure, MarketPlaceModel>> getMarketPlace(int categoryId) async {
    try {
      var result = await _marketPlaceDataSource.getMarketPlace(categoryId);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }


}