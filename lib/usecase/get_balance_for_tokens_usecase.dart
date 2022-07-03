import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetBalanceForTokensUseCase extends UseCase<List<double>, ParamsBalanceOfToken> {
  final IWalletRepository _walletRepository;

  GetBalanceForTokensUseCase(this._walletRepository);


  @override
  Future<Either<Failure, List<double>>> call(ParamsBalanceOfToken params) {
    return _walletRepository.getBalanceOfTokens(params);
  }
}

class ParamsBalanceOfToken {
  WalletInfoEntity walletInfoEntity;
  List<String> addressContract;

  ParamsBalanceOfToken({required this.walletInfoEntity, required this.addressContract});
}
