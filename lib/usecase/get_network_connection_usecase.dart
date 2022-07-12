import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/network_connection_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetNetworkConnectionUseCase
    extends UseCase<ConnectivityResult, NoParams> {
  final INetworkConnectionRepository _connectionRepository;

  GetNetworkConnectionUseCase(this._connectionRepository);

  @override
  Future<Either<Failure, ConnectivityResult>> call(NoParams params) =>
      _connectionRepository.checkConnection();
}
