import 'package:dartz/dartz.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/send_email_response/send_email_response.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SendOTPMailUseCase extends UseCase<SendEmailResponse, SendOTPParam> {
  final IAuthRepository _authImplementation;

  SendOTPMailUseCase(this._authImplementation);


  @override
  Future<Either<Failure, SendEmailResponse>> call(SendOTPParam params) =>
      _authImplementation.sendOTPEmail(params);
}

class SendOTPParam {
  final String email;
  final OTPType otpType;

  SendOTPParam(this.email, this.otpType);
}
