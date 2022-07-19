import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/tracking_result_chart_days_entity/tracking_result_chart_days_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/fetch_data_chart_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchDataDaysChartUseCase extends UseCase<TrackingResultChartDaysEntity, ParamsGetDataChart> {
  final IUserRepository _iUserRepository;

  FetchDataDaysChartUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, TrackingResultChartDaysEntity>> call(params) {
    return _iUserRepository.fetchDataDaysChart(params);
  }
}
