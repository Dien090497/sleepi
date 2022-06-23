import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SendToExternalUseCase extends UseCase<SendToExternalEntity, NoParams> {
  final ITransactionRepository _iTransactionRepository;

  SendToExternalUseCase(this._iTransactionRepository);

  @override
  Future<Either<Failure, SendToExternalEntity>> call(NoParams params) {
    return _iTransactionRepository.sendToExternal();
  }
}
