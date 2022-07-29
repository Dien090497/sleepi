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

  void removeError() {
    final currentState = state;
    if (currentState is TransferLoaded && currentState.errorMsg != null) {
      emit(currentState.copyWith(errorMsg: null));
    }
  }

  void enterAmount(String value) {
    final currentState = state;
    if (currentState is TransferLoaded) {
      final amount = double.tryParse(value.replaceAll(',', '.'));
      final errorText = _validateAmount(
        amount: amount,
        isToSpending: currentState.isToSpending,
        fee: currentState.fee,
        balance: currentState.currentToken.balance,
        symbol: currentState.currentToken.symbol,
      );
      if (errorText != null) {
        emit(currentState.copyWith(errorMsg: errorText));
      } else {
        emit(currentState.copyWith(errorMsg: null, amount: amount));
      }
    }
  }

  String? _validateAmount({
    required double? amount,
    required String symbol,
    required String? fee,
    required double balance,
    required bool isToSpending,
  }) {
    if (amount == null) {
      return LocaleKeys.this_field_is_required;
    }
    if (amount <= 0) {
      return LocaleKeys.amount_input_can_not_be_zero;
    } else {
      if (symbol.toLowerCase() == 'avax') {
        /// Case transfer AVAX
        if (fee == null) {
          return LocaleKeys.amount_input_can_not_be_zero;
        } else {
          if (amount >
              (Decimal.parse('$balance') - Decimal.parse(fee)).toDouble()) {
            return LocaleKeys.insufficient_balance;
          } else {
            return null;
          }
        }
      } else {
        /// Case không phải transfer AVAX
        if (amount > balance) {
          return LocaleKeys.insufficient_balance;
        } else {
          return null;
        }
      }
    }
  }

  Future<void> checkAllowance({
    required String ownerAddress,
    required String valueStr,
  }) async {
    final currentState = state;
    if (currentState is TransferLoaded) {
      final amount = double.tryParse(valueStr.replaceAll(',', '.'));
      final isToSpending = currentState.isToSpending;
      final errorText = _validateAmount(
        amount: amount,
        isToSpending: isToSpending,
        fee: currentState.fee,
        balance: currentState.currentToken.balance,
        symbol: currentState.currentToken.symbol,
      );
      if (errorText != null) {
        emit(currentState.copyWith(errorMsg: errorText));
      } else {
        emit(currentState.copyWith(isLoading: true));

        final contractAddress = currentState.currentToken.address;
        if (isToSpending) {
          /// Check allowance amount
          final allowanceRes =
              await _isTokenApprovedEnoughUC.call(IsTokenApprovedParams(
            ownerAddress: ownerAddress,
            tokenAddress: contractAddress,
            amount: amount!,
          ));
          allowanceRes.fold(
            (l) {
              emit(currentState.copyWith(isLoading: false, errorMsg: '$l'));
            },
            (isEnough) {
              emit(
                  currentState.copyWith(isAllowance: isEnough, amount: amount));
              emit(currentState.copyWith(
                  isLoading: false, isAllowance: null, amount: amount));
            },
          );
        } else {
          /// To External
          emit(currentState.copyWith(isAllowance: true, amount: amount));
          emit(currentState.copyWith(
              isLoading: false, isAllowance: null, amount: amount));
        }
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
