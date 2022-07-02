import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/setting_active_code_response/setting_active_code_response.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SettingActiveCodeUseCase
    extends UseCase<SettingActiveCodeResponse, NoParams> {
  final IAuthRepository _authRepository;

  SettingActiveCodeUseCase(this._authRepository);

  @override
  Future<Either<FailureMessage, SettingActiveCodeResponse>> call(params) =>
      _authRepository.fetchSettingActiveCode();
}
