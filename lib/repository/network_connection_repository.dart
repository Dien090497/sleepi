import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';

abstract class INetworkConnectionRepository {
  Future<Either<Failure, ConnectivityResult>> checkConnection();

  Either<Failure, Stream<ConnectivityResult>> get onConnectionChanged;
}
