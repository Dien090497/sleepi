import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/network_connection_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class OnConnectionChangedUseCase
    extends UseCaseSync<Stream<ConnectivityResult>, NoParams> {
  final INetworkConnectionRepository _connectionRepository;

  OnConnectionChangedUseCase(this._connectionRepository);

  @override
  Either<Failure, Stream<ConnectivityResult>> call(NoParams params) =>
      _connectionRepository.onConnectionChanged;
}
