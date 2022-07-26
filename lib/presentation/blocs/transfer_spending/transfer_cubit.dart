import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_state.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/usecase/approve_usecase.dart';
import 'package:slee_fi/usecase/is_token_approved_enough_usecase.dart';
import 'package:slee_fi/usecase/to_spending_usecase.dart';
import 'package:slee_fi/usecase/transfer_token_to_main_wallet_usecase.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit(bool isToSpending)
      : super(TransferState.loaded(isToSpending: isToSpending));

  final _toSpendingUseCase = getIt<ToSpendingUseCase>();
  final _approveUseCase = getIt<ApproveUseCase>();
  final _transferToMainWalletUC = getIt<TransferTokenToMainWalletUseCase>();
  final _isTokenApprovedEnoughUC = getIt<IsTokenApprovedEnoughUseCase>();

  Future<void> checkAllowance({
    required String amountStr,
    required String contractAddress,
    required String ownerAddress,
    required double balance,
  }) async {
    final currentState = state;
    if (currentState is TransferLoaded) {
      if (amountStr.isEmpty) {
        emit(currentState.copyWith(
            errorMsg: LocaleKeys.this_field_is_required,
            typeError: 'invalid_amount'));
        return;
      }
      final amount = double.parse(amountStr.replaceAll(',', '.'));
      if (amount <= 0) {
        emit(currentState.copyWith(
            errorMsg: LocaleKeys.amount_input_can_not_be_zero,
            typeError: 'amount_zero'));
        return;
      } else {
        if (currentState.isLoading) return;
        emit(currentState.copyWith(
            isLoading: true, errorMsg: null, typeError: null));
        final isToSpending = currentState.isToSpending;
        if (isToSpending) {
          if (amount > balance) {
            emit(currentState.copyWith(
                errorMsg: LocaleKeys.insufficient_balance,
                typeError: 'invalid_amount'));
            return;
          }

          /// Check allowance amount
          final allowanceRes = await _isTokenApprovedEnoughUC.call(
              IsTokenApprovedParams(
                  ownerAddress: ownerAddress,
                  tokenAddress: contractAddress,
                  amount: amount));
          allowanceRes.fold(
            (l) {
              emit(currentState.copyWith(
                  isLoading: false, errorMsg: 'Cannot Transfer'));
            },
            (isEnough) {
              emit(currentState.copyWith(needApprove: !isEnough));
              emit(currentState.copyWith(
                  isLoading: false,
                  needApprove: null,
                  errorMsg: null,
                  typeError: null));
            },
          );
        } else {
          /// To External
          emit(currentState.copyWith(needApprove: false));
          emit(currentState.copyWith(
              isLoading: false,
              needApprove: null,
              errorMsg: null,
              typeError: null));
        }
      }
    }
  }

  void removeError() {
    final currentState = state;
    if (currentState is TransferLoaded && currentState.errorMsg != null) {
      emit(currentState.copyWith(errorMsg: null, typeError: null));
    }
  }

  Future<String> approve({
    required double amount,
    required String addressContract,
  }) async {
    final currentState = state;
    if (currentState is TransferLoaded) {
      if (currentState.isLoading) return '';
      emit(currentState.copyWith(isLoading: true));
      final result = await _approveUseCase.call(addressContract);
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
    required double amount,
    required double balance,
    required String symbol,
    required String contractAddress,
    required int userId,
  }) async {
    final currentState = state;
    if (currentState is TransferLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      if (currentState.isToSpending) {
        final result = await _toSpendingUseCase.call(ToSpendingParams(
            type: symbol,
            amount: amount,
            addressContract: contractAddress,
            userId: userId));
        result.fold(
          (l) {
            emit(currentState.copyWith(
                isLoading: false, errorMsg: 'Cannot Transfer'));
          },
          (result) {
            emit(const TransferState.success());
          },
        );
      } else {
        final result = await _transferToMainWalletUC.call(WhitDrawTokenSchema(
            type: symbol, amount: '$amount', tokenAddress: contractAddress));
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

  void switchWallet() {
    final currentState = state;
    if (currentState is TransferLoaded) {
      emit(currentState.copyWith(isToSpending: !currentState.isToSpending));
    }
  }
}
