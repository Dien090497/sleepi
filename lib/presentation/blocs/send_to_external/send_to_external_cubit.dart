import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ethereum_addresses/ethereum_addresses.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';
import 'package:slee_fi/presentation/screens/send_to_external/send_to_external_screen.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/send_token_to_external.dart';

class SendToExternalCubit extends Cubit<SendToExternalState> {
  SendToExternalCubit() : super(const SendToExternalState.initial());

  final _sendToExternalUC = getIt<SendToExternalUseCase>();
  final _sendTokenToExternalUseCase = getIt<SendTokenToExternalUseCase>();

  void init({bool? isLoadBalance}) {
    emit(SendToExternalState.initial(isLoadBalance: isLoadBalance));
  }

  Future<void> sendToExternal(
      String contractAddressTo, double valueInEther, String tokenSymbol) async {
    emit(const SendToExternalState.loading());
    final result = await _sendToExternalUC.call(SendToExternalParams(
        contractAddressTo: contractAddressTo,
        valueInEther: valueInEther,
        tokenSymbol: tokenSymbol));

    result.fold((l) {
      emit(SendToExternalState.fail('$l'));
    }, (success) {
      emit(SendToExternalState.success(success));
    });
  }

  Future<void> getTokenBalance(
      {required String contractAddress, String? tokenSymbol}) async {
    emit(const SendToExternalState.loading());
    final params = SendToExternalParams(
        contractAddressTo: contractAddress, tokenSymbol: tokenSymbol);
    final result = await _sendToExternalUC.getTokenBalance(params);
    result.fold(
      (l) {
        emit(SendToExternalState.fail('$l'));
      },
      (balance) async {
        const paramBalanceAvax =
            SendToExternalParams(contractAddressTo: '', tokenSymbol: 'AVAX');
        final resultBalanceAvax =
            await _sendToExternalUC.getTokenBalance(paramBalanceAvax);
        resultBalanceAvax.fold((l) {
          emit(SendToExternalState.fail('$l'));
        }, (feeAvax) async {
          final feeRes = await getIt<SendToExternalUseCase>()
              .calculatorFee(const SendToExternalParams(
            contractAddressTo: '',
            valueInEther: 0,
          ));
          feeRes.fold((l) {
            emit(SendToExternalState.fail('$l'));
          }, (fee) {
            emit(SendToExternalState.getBalance(
                balance: balance, fee: double.parse(fee), feeAvax: feeAvax));
          });
        });
      },
    );
  }

  Future<void> validator({
    required String contractAddressTo,
    required double balanceCurrent,
    required double amount,
    required double fee,
    required balanceAvax,
  }) async {
    emit(const SendToExternalState.loading());
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
    emit(SendToExternalState.checkedValidator(fee: fee));
  }

  Future<void> sendTokenExternal(String toAddress, double valueInEther,
      SendToExternalArguments? arg) async {
    emit(const SendToExternalState.loading());
    final params = SendTokenExternalParams(
        valueInEther: valueInEther,
        tokenEntity: arg?.tokenEntity,
        toAddress: toAddress);
    final result = await _sendTokenToExternalUseCase.call(params);
    result.fold((l) {
      emit(SendToExternalState.fail('$l'));
    }, (success) {
      emit(SendToExternalState.success(success));
    });
  }

  Future<void> validateFee(
      {required double fee, required double balanceAvax}) async {
    if (balanceAvax < fee) {
      emit(const SendToExternalState.fail(LocaleKeys.not_enough_to_pay_the_fee,
          isShowPopUp: true));
      return;
    } else {
      emit(const SendToExternalState.validatorSuccess());
    }
  }
}
