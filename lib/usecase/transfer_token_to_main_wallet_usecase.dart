import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/swap_token_to_wallet_response/swap_token_to_wallet_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class TransferTokenToMainWalletUseCase
    extends UseCase<SwapTokenToWalletResponse, WhitDrawTokenSchema> {
  final IUserRepository _iUserRepository;

  TransferTokenToMainWalletUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, SwapTokenToWalletResponse>> call(params) {
    return _iUserRepository.transferTokenToMainWallet(params);
  }
}
