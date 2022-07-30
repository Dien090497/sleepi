import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ethereum_addresses/ethereum_addresses.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';
import 'package:slee_fi/presentation/screens/send_to_external/send_to_external_screen.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/send_token_to_external.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SendToExternalCubit extends Cubit<SendToExternalState> {
  SendToExternalCubit() : super(const SendToExternalState.initial());

  final _sendToExternalUC = getIt<SendToExternalUseCase>();
  final _sendTokenToExternalUseCase = getIt<SendTokenToExternalUseCase>();

  void init() {
    emit(const SendToExternalState.initial());
  }

  Future<void> sendToExternal(
      String contractAddressTo, double valueInEther, String tokenSymbol) async {
    final result = await _sendToExternalUC.call(SendToExternalParams(
        contractAddressTo: contractAddressTo,
        valueInEther: valueInEther,
        tokenSymbol: tokenSymbol
    ));
    result.fold((l) {
      emit(SendToExternalState.fail('$l'));
    }, (success) {
      // print(success);
      emit(const SendToExternalState.success());
    });
  }

  Future<void> getTokenBalance() async {
    final result = await _sendToExternalUC.getTokenBalance(NoParams());
    result.fold(
          (l) {
        emit(SendToExternalState.fail('$l'));
      },
          (success) {
        emit(SendToExternalState.getBalance(success));
      },
    );
  }

  Future<void> validator(
      {required String contractAddressTo, required double balanceCurrent, required double amount}) async {
    if (contractAddressTo.isEmpty) {
      emit(SendToExternalState.errorToAddress(
          LocaleKeys.this_field_is_required.tr()));
      return;
    }
    if (isValidEthereumAddress(contractAddressTo) == false) {
      emit(SendToExternalState.errorToAddress(LocaleKeys.invalid_address.tr()));
      return;
    }
    if (amount == 0) {
      emit(SendToExternalState.errorValueInEther(
          LocaleKeys.amount_input_can_not_be_zero.tr()));
      return;
    }
    if (amount > balanceCurrent) {
      emit(SendToExternalState.errorValueInEther(
          LocaleKeys.insufficient_balance.tr()));
      return;
    }
    if (amount < 0) {
      emit(SendToExternalState.errorValueInEther(
          LocaleKeys.this_field_is_required.tr()));
      return;
    }
    emit(const SendToExternalState.validatorSuccess());
    emit(const SendToExternalState.checkedValidator());
  }

  Future<void> sendTokenExternal(String toAddress, double valueInEther,
      SendToExternalArguments? arg) async {

    final params = SendTokenExternalParams(
        valueInEther: valueInEther,
        tokenEntity: arg?.tokenEntity,
        toAddress: toAddress);
    final result = await _sendTokenToExternalUseCase.call(params);
    result.fold((l) {
      emit(SendToExternalState.fail('$l'));
    }, (success) {
      emit(const SendToExternalState.success());
    });
  }
}
