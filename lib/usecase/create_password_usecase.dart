import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/create_password_reponse/create_password_response.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/schema/create_password_schema/create_password_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CreatePasswordUseCase extends UseCase<CreatePasswordResponse, CreatePasswordSchema> {
  final IAuthRepository _iAuthRepository;

  CreatePasswordUseCase(this._iAuthRepository);

  @override
  Future<Either<FailureMessage, CreatePasswordResponse>> call(params) {
    return _iAuthRepository.createPassword(params);
  }
}
