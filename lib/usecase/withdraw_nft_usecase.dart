import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/schema/with_draw_nft_schema/with_draw_nft_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class WithdrawNFTUseCase extends UseCase<dynamic, WithDrawNFTSchema> {
  final INFTRepository _repository;

  WithdrawNFTUseCase(this._repository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _repository.withDrawNFTtoMainWallet(params: params);
  }
}
