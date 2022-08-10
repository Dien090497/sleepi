import 'dart:math';

import 'package:decimal/decimal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_state.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/usecase/approve_usecase.dart';
import 'package:slee_fi/usecase/estimate_gas_deposit_usecase.dart';
import 'package:slee_fi/usecase/estimate_gas_withdraw.dart';
import 'package:slee_fi/usecase/is_token_approved_enough_usecase.dart';
import 'package:slee_fi/usecase/to_spending_usecase.dart';
import 'package:slee_fi/usecase/transfer_token_to_main_wallet_usecase.dart';
import 'package:web3dart/web3dart.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit(String address, bool isToSpending)
      : super(TransferState.initial(
            address: address, isToSpending: isToSpending));

  final _transferToMainWalletUC = getIt<TransferTokenToMainWalletUseCase>();
  final _toSpendingUseCase = getIt<ToSpendingUseCase>();
  final _isTokenApprovedEnoughUC = getIt<IsTokenApprovedEnoughUseCase>();
  final _approveUseCase = getIt<ApproveUseCase>();
  final _estGasDepositTokenUC = getIt<EstimateGasDepositUseCase>();
  final _estGasWithdraw = getIt<EstimateGasWithdrawUseCase>();

  void init({
    required List<TokenEntity> baseSpendingTokens,
    required List<TokenEntity> baseWalletTokens,
    required int userId,
    required String ownerAddress,
  }) async {
    final currentState = state;
    if (currentState is TransferInitial) {
      try {
        final spendingTokens = baseSpendingTokens.take(3).toList();
        final walletTokens = baseWalletTokens.take(3).toList();
        final addr = currentState.address;
        final spendingToken = spendingTokens
            .firstWhere((e) => e.address.toLowerCase() == addr.toLowerCase());
        final walletToken = walletTokens
            .firstWhere((e) => e.address.toLowerCase() == addr.toLowerCase());
        final isToSpending = currentState.isToSpending;

        /// nếu wallet -> spending thì currentToken sẽ lấy từ spendingState
        final currentToken = isToSpending ? walletToken : spendingToken;
        final nativeCurrency = isToSpending
            ? walletTokens
                .firstWhere((e) => e.address.toLowerCase() == Const.deadAddress)
            : spendingTokens.firstWhere(
                (e) => e.address.toLowerCase() == Const.deadAddress);

        /// nếu wallet -> spending thì backupToken sẽ lấy từ walletState
        final backupToken = isToSpending ? spendingToken : walletToken;
        emit(TransferLoaded(
          currentToken: currentToken,
          backupToken: backupToken,
          isToSpending: isToSpending,
          spendingTokens: baseSpendingTokens,
          walletTokens: baseWalletTokens,
          userId: userId,
          ownerAddress: ownerAddress,
          nativeCurrency: nativeCurrency,
        ));
        _getFee();
      } catch (e) {
        emit(TransferState.failed('$e'));
      }
    }
  }

  void refresh({
    required List<TokenEntity> baseSpendingTokens,
    required List<TokenEntity> baseWalletTokens,
  }) {
    final currentState = state;
    if (currentState is TransferLoaded) {
      final spendingTokens = baseSpendingTokens.take(3).toList();
      final walletTokens = baseWalletTokens.take(3).toList();
      final isToSpending = currentState.isToSpending;
      final temp = currentState.currentToken;
      final currentToken = isToSpending
          ? walletTokens.firstWhere(
              (e) => e.address.toLowerCase() == temp.address.toLowerCase())
          : spendingTokens.firstWhere(
              (e) => e.address.toLowerCase() == temp.address.toLowerCase());
      emit(currentState.copyWith(
        currentToken: currentToken,
        spendingTokens: spendingTokens,
        walletTokens: walletTokens,
      ));
    }
  }

  void setAmount(String value) {
    final currentState = state;
    if (currentState is TransferLoaded) {
      final amount = double.tryParse(value.replaceAll(',', '.'));
      if (amount == null) {
        /// TH xóa hết số
        emit(currentState.copyWith(errorMsg: null));
      } else {
        /// Khi nhập số mới validate
        final errorText = _validateAmount(
          amount: amount,
          isToSpending: currentState.isToSpending,
          fee: currentState.fee,
          balance: currentState.currentToken.balance,
          symbol: currentState.currentToken.symbol,
        );
        if (errorText != null) {
          emit(currentState.copyWith(errorMsg: errorText, amount: amount));
        } else {
          emit(currentState.copyWith(errorMsg: null, amount: amount));
        }
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
        final balDec = Decimal.parse('$balance');
        final feeDec = Decimal.parse(fee ?? '0');
        if (balDec <= feeDec) {
          return LocaleKeys.insufficient_balance;
        } else if (amount > (balDec - feeDec).toDouble()) {
          return LocaleKeys.insufficient_balance;
        } else {
          return null;
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

  Future<void> checkAllowance({required String valueStr}) async {
    _getFee();
    final currentState = state;
    if (currentState is TransferLoaded) {
      emit(currentState.copyWith(isLoading: true));
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
        emit(currentState.copyWith(errorMsg: errorText, isLoading: false));
      } else {
        final contractAddress = currentState.currentToken.address;
        if (isToSpending) {
          /// Check allowance amount
          final allowanceRes =
              await _isTokenApprovedEnoughUC.call(IsTokenApprovedParams(
            ownerAddress: currentState.ownerAddress,
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
          /// To Wallet
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
          return '';
        },
        (result) {
          emit(currentState.copyWith(isLoading: false));
          return result;
        },
      );
    }
    return '';
  }

  Future<void> transfer({required int userId}) async {
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
            if ('$l'.contains('transferFrom failed')) {
              emit(currentState.copyWith(
                  isLoading: false, errorMsg: LocaleKeys.insufficient_balance));
            } else if ('$l'.contains('insufficient funds for transfer')) {
              emit(currentState.copyWith(
                  isLoading: false, errorMsg: LocaleKeys.insufficient_balance));
            } else {
              emit(const TransferState.failed(
                  LocaleKeys.not_enough_to_pay_the_fee));
              emit(currentState.copyWith(isLoading: false));
            }
          },
          (txHash) {
            emit(TransferState.success(txHash));
          },
        );
      } else {
        final result = await _transferToMainWalletUC.call(WhitDrawTokenSchema(
            type: 'token',
            amount: '${currentState.amount}',
            tokenAddress: token.address));
        result.fold(
          (l) {
            emit(TransferState.failed('$l'));
            emit(currentState.copyWith(isLoading: false));
          },
          (r) {
            emit(TransferState.success(r.txHash));
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
        fee: null,
      ));
      _getFee();
    }
  }

  void selectToken(TokenEntity token) {
    final currentState = state;
    if (currentState is TransferLoaded) {
      final isToSpending = currentState.isToSpending;
      final backupToken = isToSpending
          ? currentState.walletTokens.firstWhere(
              (e) => e.address.toLowerCase() == token.address.toLowerCase())
          : currentState.spendingTokens.firstWhere(
              (e) => e.address.toLowerCase() == token.address.toLowerCase());
      emit(currentState.copyWith(
        currentToken: token,
        backupToken: backupToken,
        amount: null,
        fee: null,
      ));
      _getFee();
    }
  }

  void _getFee() async {
    final currentState = state;
    if (currentState is TransferLoaded) {
      emit(currentState.copyWith(isLoading: true));
      final isToSpending = currentState.isToSpending;
      final currentToken = currentState.currentToken;
      final userId = currentState.userId;
      emit(currentState.copyWith(
        fee: isToSpending
            ? await _getFeeDepositToken(
                tokenAddress: currentToken.address, amount: 0, userId: userId)
            : await _getWithdrawFee(tokenAddress: currentToken.address),
        isLoading: false,
      ));
    }
  }

  Future<String?> _getFeeDepositToken({
    required String tokenAddress,
    required double amount,
    required int userId,
  }) async {
    final valueSend = amount <= 0.0
        ? BigInt.from(1)
        : (Decimal.parse(amount.toString()) * Decimal.parse('${pow(10, 18)}'))
            .toBigInt();
    final result = await _estGasDepositTokenUC.call(EstimateGasDepositParam(
      functionName: 'depositToken',
      data: [
        EthereumAddress.fromHex(tokenAddress),
        valueSend,
        BigInt.from(userId),
      ],
      tokenAddress: tokenAddress,
    ));
    return result.fold(
      (l) {
        return null;
      },
      (r) => '$r',
    );
  }

  Future<String?> _getWithdrawFee({required String tokenAddress}) async {
    final feeRes = await _estGasWithdraw.call(
        EstimateGasWithdrawParam(type: 'token', contractAddress: tokenAddress));
    return feeRes.fold((l) {
      return null;
    }, (r) => r);
  }
}
