import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';

abstract class ISleepTrackingRepository{
  Future<Either<Failure, dynamic>> postDataHealth(DataHealthSchema schema);
}