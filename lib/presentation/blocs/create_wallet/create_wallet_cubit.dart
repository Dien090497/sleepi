import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/create_wallet/create_wallet_state.dart';
import 'package:slee_fi/schema/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/verify_otp_usecase.dart';
import 'package:slee_fi/usecase/wallet/create_wallet_usecase.dart';

class CreateWalletCubit extends Cubit<CreateWalletState> {
  CreateWalletCubit() : super(const CreateWalletState.initial());

  String userEmail = '';

  final _createWalletUC = getIt<CreateWalletUseCase>();
  final _sendOtpUC = getIt<SendOTPMailUseCase>();
  final _verifyOtpUC = getIt<VerifyOTPUseCase>();

  void process(String otp) {
    if (otp.isEmpty || otp.length < 6) {
      emit(const CreateWalletState.error('Please input otp code.'));
    } else {
      _verifyOtp(otp);
    }
  }

  void createWallet() async {
    final currentState = state;
    if (currentState is createWalletStateInitial) {
      emit(currentState.copyWith(isLoading: true));
      final result = await _createWalletUC.call(NoParams());
      result.fold(
        (l) {
          emit(CreateWalletState.error('$l'));
          emit(currentState.copyWith(isLoading: false));
        },
        (success) {
          emit(CreateWalletState.done(success));
        },
      );
    }
  }

  void _verifyOtp(String otp) async {
    emit(const CreateWalletState.initial(isLoading: true));
    final result = await _verifyOtpUC
        .call(VerifyOTPSchema(int.parse(otp), userEmail, OTPType.addWallet));

    result.fold((l) {
      emit(CreateWalletState.error('$l'));
    }, (r) => createWallet());
  }

  void sendOtp() async {
    final result =
        await _sendOtpUC.call(SendOTPParam(userEmail, OTPType.addWallet));
    result.fold((l) {
      emit(CreateWalletState.error('$l'));
    }, (r) {});
  }
}
