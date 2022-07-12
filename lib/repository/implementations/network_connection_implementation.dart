import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/network_connection_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/network_connection_repository.dart';

@Injectable(as: INetworkConnectionRepository)
class NetworkConnectionImplementation extends INetworkConnectionRepository {
  final NetworkConnectionDataSource _connectionDataSource;

  NetworkConnectionImplementation(this._connectionDataSource);

  @override
  Future<Either<Failure, ConnectivityResult>> checkConnection() async {
    try {
      return Right(await _connectionDataSource.checkConnectivity());
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Either<Failure, Stream<ConnectivityResult>> get onConnectionChanged {
    try {
      return Right(_connectionDataSource.onConnectivityChanged);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
