import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';
@injectable
class GetCurrentNetworkUseCase extends UseCase<NetworkIsarModel, NetWorkEnum?> {
  final IWalletRepository _iWalletRepository;

  GetCurrentNetworkUseCase(this._iWalletRepository);

  @override
  Future<Either<FailureMessage, NetworkIsarModel>> call(NetWorkEnum? params) =>
      _iWalletRepository.getCurrentNetWork(params);
}
