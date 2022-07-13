import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/tracking_result_chart/tracking_result_chart_data.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchDataChartUseCase extends UseCase<TrackingResultChartData, ParamsGetDataChart> {
  final IUserRepository _iUserRepository;

  FetchDataChartUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, TrackingResultChartData>> call(params) {
    return _iUserRepository.fetchDataChart(params);
  }
}

class ParamsGetDataChart {
  final String fdate;
  final String tdate;
  final String type;

  ParamsGetDataChart({required this.fdate, required this.tdate, required this.type});
}
