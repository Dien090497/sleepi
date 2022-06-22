import 'package:dartz/dartz.dart';
import 'package:slee_fi/common/utils/appsflyer_custom.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/usecase/usecase.dart';

class RunAppInitUseCase extends UseCase<bool, NoParams> {
  final Web3DataSource _web3DataSource;
  final IsarDataSource _isarDataSource;
  final GetStorageDataSource _getStorageDataSource;
  final AppFlyerCustom _appFlyerCustom;

  RunAppInitUseCase(this._web3DataSource, this._isarDataSource,
      this._getStorageDataSource, this._appFlyerCustom);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    _appFlyerCustom.init();
    await _isarDataSource.init();
    int? chainId = _getStorageDataSource.getCurrentChainId();
    if (chainId == null) {
      chainId = 43114;
      _getStorageDataSource.setCurrentChainId(chainId);
    }
    final network = await _isarDataSource.getNetworkAt(chainId);
    assert(network != null, "Network must not be null");
    await _web3DataSource.init(network!);
    return const Right(true);
  }
}
