import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';
@Injectable(as: ISleepTrackingRepository)
class SleepTrackingImplementation extends ISleepTrackingRepository{
  final AuthDataSource _authDataSource;

  SleepTrackingImplementation(this._authDataSource);

  @override
  Future<Either<Failure, dynamic>> postDataHealth(DataHealthSchema schema) async {
    try{
      final result = await _authDataSource.postHealthData(schema);
      return Right(result);
    }catch(e){
      return Left(FailureMessage('$e'));
    }
  }
}