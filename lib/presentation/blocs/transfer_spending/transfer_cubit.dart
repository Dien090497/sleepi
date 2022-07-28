import 'package:decimal/decimal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_state.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/usecase/approve_usecase.dart';
import 'package:slee_fi/usecase/estimate_gas_withdraw.dart';
import 'package:slee_fi/usecase/is_token_approved_enough_usecase.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/to_spending_usecase.dart';
import 'package:slee_fi/usecase/transfer_token_to_main_wallet_usecase.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit(
      TokenEntity currentToken, TokenEntity backupToken, bool isToSpending)
      : super(TransferState.loaded(
          isToSpending: isToSpending,
          currentToken: currentToken,
          backupToken: backupToken,
        ));

  final _toSpendingUseCase = getIt<ToSpendingUseCase>();
  final _approveUseCase = getIt<ApproveUseCase>();
  final _transferToMainWalletUC = getIt<TransferTokenToMainWalletUseCase>();
  final _isTokenApprovedEnoughUC = getIt<IsTokenApprovedEnoughUseCase>();

  Future<void> getFee() async {
    final currentState = state;
    if (currentState is TransferLoaded) {
      emit(currentState.copyWith(fee: null, isLoading: true));
      final String? fee;

      if (!currentState.isToSpending) {
        final feeRes = await getIt<EstimateGasWithdrawUseCase>().call(
            EstimateGasWithdrawParam(
                type: 'token',
                contractAddress: currentState.currentToken.address));
        fee = feeRes.foldRight(null, (r, previous) => r);
      } else {
        final feeRes = await getIt<SendToExternalUseCase>()
            .calculatorFee(SendToExternalParams(
          contractAddressTo: '',
          valueInEther: 0,
          tokenSymbol: currentState.currentToken.symbol,
        ));
        fee = feeRes.foldRight(null, (r, previous) => r);
      }
      emit(currentState.copyWith(fee: fee, isLoading: false));
    }
  }

  void enterAmount(String value) {
    final currentState = state;
    if (currentState is TransferLoaded) {
      final havingError =
          currentState.errorMsg != null || currentState.typeError != null;
      final newState = havingError
          ? currentState.copyWith(errorMsg: null, typeError: null)
          : currentState;
      if (havingError) {
        emit(newState);
      }
      final amount = double.tryParse(value.replaceAll(',', '.'));
      if (amount == null) {
        emit(newState.copyWith(
            errorMsg: LocaleKeys.this_field_is_required,
            typeError: 'invalid_amount'));
      } else {
        if (amount <= 0) {
          emit(newState.copyWith(
              errorMsg: LocaleKeys.amount_input_can_not_be_zero,
              typeError: 'amount_zero'));
        } else if (newState.currentToken.symbol.toLowerCase() == 'avax') {
          /// Case transfer AVAX
          final fee = newState.fee;
          if (fee == null) {
            emit(newState.copyWith(
                errorMsg: LocaleKeys.amount_input_can_not_be_zero,
                typeError: 'amount_zero'));
          } else {
            final balance = newState.currentToken.balance;
            if (amount >
                (currentState.isToSpending
                    ? balance
                    : (Decimal.parse('$balance') - Decimal.parse(fee))
                        .toDouble())) {
              emit(newState.copyWith(
                  errorMsg: LocaleKeys.insufficient_balance,
                  typeError: 'invalid_amount'));
            } else {
              emit(newState.copyWith(amount: amount));
            }
          }
        } else {
          /// Case không phải transfer AVAX
          if (amount > newState.currentToken.balance) {
            emit(newState.copyWith(
                errorMsg: LocaleKeys.insufficient_balance,
                typeError: 'invalid_amount'));
          } else {
            emit(newState.copyWith(amount: amount));
          }
        }
      }
    }
  }

  Future<void> checkAllowance({
    required String ownerAddress,
  }) async {
    final currentState = state;
    if (currentState is TransferLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final isToSpending = currentState.isToSpending;
      final contractAddress = currentState.currentToken.address;
      if (isToSpending) {
        /// Check allowance amount
        final allowanceRes =
            await _isTokenApprovedEnoughUC.call(IsTokenApprovedParams(
          ownerAddress: ownerAddress,
          tokenAddress: contractAddress,
          amount: currentState.amount!,
        ));
        allowanceRes.fold(
          (l) {
            emit(currentState.copyWith(isLoading: false, errorMsg: '$l'));
          },
          (isEnough) {
            emit(currentState.copyWith(isAllowance: isEnough));
            emit(currentState.copyWith(isLoading: false, isAllowance: null));
          },
        );
      } else {
        /// To External
        emit(currentState.copyWith(isAllowance: true));
        emit(currentState.copyWith(isLoading: false, isAllowance: null));
      }
    }
  }

  Future<String> approve() async {
    final currentState = state;
    if (currentState is TransferLoaded) {
      emit(currentState.copyWith(isLoading: true));
      final result =
          await _approveUseCase.call(currentState.currentToken.address);
      return result.fold(
        (l) {
          emit(currentState.copyWith(isLoading: false));
          return '$l';
        },
        (result) {
          emit(currentState.copyWith(isLoading: false));
          return 'done';
        },
      );
    }
    return '';
  }

  Future<void> transfer({
    required int userId,
  }) async {
    final currentState = state;
    if (currentState is TransferLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final token = currentState.currentToken;
      if (currentState.isToSpending) {
        final result = await _toSpendingUseCase.call(ToSpendingParams(
            type: token.symbol,
            amount: currentState.amount!,
            addressContract: token.address,
            userId: userId));
        result.fold(
          (l) {
            emit(currentState.copyWith(isLoading: false, errorMsg: '$l'));
          },
          (result) {
            emit(const TransferState.success());
          },
        );
      } else {
        final result = await _transferToMainWalletUC.call(WhitDrawTokenSchema(
            type: token.symbol,
            amount: '${currentState.amount}',
            tokenAddress: token.address));
        result.fold(
          (l) {
            emit(currentState.copyWith(isLoading: false, errorMsg: '$l'));
          },
          (r) {
            emit(const TransferState.success());
          },
        );
      }
    }
  }

  void switchWallet() async {
    final currentState = state;
    if (currentState is TransferLoaded) {
      emit(currentState.copyWith(
        isToSpending: !currentState.isToSpending,
        currentToken: currentState.backupToken,
        backupToken: currentState.currentToken,
        amount: null,
      ));
      getFee();
    }
  }
}
