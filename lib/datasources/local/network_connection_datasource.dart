import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectionDataSource {
  final Connectivity _connectivity;

  NetworkConnectionDataSource(this._connectivity);

  Future<ConnectivityResult> checkConnectivity() =>
      _connectivity.checkConnectivity();

  Stream<ConnectivityResult> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;
}
