import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';

abstract class ISleepTrackingRepository {
  Future<Either<Failure, String>> estimateTracking({
    required int bedId,
    required int? itemId,
    required bool isEnableInsurance,
  });
}
