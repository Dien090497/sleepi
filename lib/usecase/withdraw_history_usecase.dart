import 'package:dartz/dartz.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/withdraw_history_response/withdraw_history_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class WithdrawHistoryUseCase
    extends UseCase<WithdrawHistoryResponse, WithdrawParam> {
  final IUserRepository _iUserRepository;

  WithdrawHistoryUseCase(this._iUserRepository);

  @override
  Future<Either<Failure, WithdrawHistoryResponse>> call(params) {
    return _iUserRepository.withdrawHistory(params);
  }
}

class WithdrawParam {
  final AttributeWithdraw attributeWithdraw;
  final int page;
  final int limit;

  WithdrawParam(
      {required this.attributeWithdraw,
      required this.page,
      required this.limit});
}
