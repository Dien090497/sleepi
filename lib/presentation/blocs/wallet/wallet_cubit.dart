import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/get_balance_for_tokens_usecase.dart';
import 'package:slee_fi/usecase/get_history_transaction_usecase.dart';
import 'package:slee_fi/usecase/get_nft_addresses_usecase.dart';
import 'package:slee_fi/usecase/get_nfts_balance_usecase.dart';
import 'package:slee_fi/usecase/get_token_addresses_usecase.dart';
import 'package:slee_fi/usecase/has_wallet_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/current_wallet_usecase.dart';

import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(const WalletState.initial());

  final _currentWalletUC = getIt<CurrentWalletUseCase>();
  final _getHistoryTransactionUC = getIt<GetHistoryTransactionUseCase>();
  final _getBalanceForTokensUseCase = getIt<GetBalanceForTokensUseCase>();
  final _getNFTsBalanceUC = getIt<GetNFTsBalanceUseCase>();
  final _hasWalletUC = getIt<HasWalletUseCase>();
  final _getNftAddressesUC = getIt<GetNftAddressesUseCase>();
  final _getTokenAddressesUC = getIt<GetTokenAddressesUseCase>();

  Future<void> checkWallet() async {
    final currentState = state;
    if (currentState is! WalletStateLoaded) {
      final hasWalletRes = await _hasWalletUC.call(NoParams());
      final hasWallet = hasWalletRes.getOrElse(() => false);
      if (hasWallet) {
        emit(const WalletState.notOpen());
      } else {
        emit(const WalletState.notExisted());
      }
    }
  }

  Future<void> getWallet() async {
    emit(const WalletState.loading());
    final walletCall = await _currentWalletUC.call(NoParams());
    walletCall.fold(
      (l) {
        emit(WalletState.error('$l'));
      },
      (r) => loadCurrentWallet(r),
    );
  }

  Future<void> refresh() async {
    final currentState = state;
    if (currentState is WalletStateLoaded) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final walletCall = await _currentWalletUC.call(NoParams());
      walletCall.fold(
        (l) => emit(currentState.copyWith(isLoading: false)),
        (r) => loadCurrentWallet(r),
      );
    } else if (currentState is! WalletStateLoading) {
      emit(const WalletState.loading());
      final walletCall = await _currentWalletUC.call(NoParams());
      walletCall.fold(
        (l) => emit(WalletState.error('$l')),
        (r) => loadCurrentWallet(r),
      );
    }
  }

  void importWallet(WalletInfoEntity walletInfoEntity) {
    final currentState = state;
    if (currentState is WalletStateLoaded) {
      emit(currentState.copyWith(walletInfoEntity: walletInfoEntity));
    } else {
      loadCurrentWallet(walletInfoEntity);
    }
  }

  void loadCurrentWallet(WalletInfoEntity wallet) async {
    final currentState = state;
    final nftAddresses =
        (await _getNftAddressesUC.call(NoParams())).getOrElse(() => []);
    final tokenAddresses =
        (await _getTokenAddressesUC.call(NoParams())).getOrElse(() => []);
    final ParamsBalanceOfToken params = ParamsBalanceOfToken(
        walletInfoEntity: wallet, addressContract: tokenAddresses);
    final GetNFTsParams nfTsParams =
        GetNFTsParams(wallet.address, nftAddresses);
    final results = await Future.wait([
      _getBalanceForTokensUseCase.call(params),
      _getNFTsBalanceUC.call(nfTsParams),
    ]);
    final Either<Failure, List<double>> tokenBalanceRes = cast(results.first);
    final Either<Failure, List<BigInt>> nftBalanceRes = cast(results.last);
    final List keyList = [
      "SLFT",
      "SLGT",
      "AVAX",
      "USDC",
    ];
    final List nftNames = [
      LocaleKeys.bed.tr(),
      LocaleKeys.jewels.tr(),
      LocaleKeys.bedbox.tr(),
      LocaleKeys.item.tr(),
    ];
    final List icons = [
      Ics.icSlft,
      Ics.icSlgt,
      Ics.icAvax,
      Ics.icUsdc,
    ];
    final List nftIcons = [
      Ics.bed,
      Ics.jewel,
      Ics.icBedBoxes,
      Ics.item,
    ];
    final tokenList = <TokenEntity>[];
    final values = tokenBalanceRes.getOrElse(() => []);
    final nfts = nftBalanceRes.getOrElse(() => []);
    for (int i = 0; i < values.length; i++) {
      final tokenEntity = TokenEntity(
        address: tokenAddresses[i],
        displayName: keyList[i],
        name: keyList[i],
        symbol: keyList[i],
        icon: icons[i],
        balance: values[i],
      );
      tokenList.add(tokenEntity);
    }
    for (int i = 0; i < nfts.length; i++) {
      final tokenEntity = TokenEntity(
        address: nftAddresses[i],
        displayName: nftNames[i],
        name: nftNames[i],
        symbol: nftNames[i],
        icon: nftIcons[i],
        balance: nfts[i].toDouble(),
      );
      tokenList.add(tokenEntity);
    }
    if (currentState is WalletStateLoaded) {
      emit(currentState.copyWith(
        walletInfoEntity: wallet,
        tokenList: tokenList,
        isLoading: false,
      ));
    } else {
      emit(WalletState.loaded(
        walletInfoEntity: wallet,
        tokenList: tokenList,
      ));
    }
  }

  Future<void> getHistoryTransaction(HistoryTransactionParams params) async {
    emit(const WalletState.loadingHistory());
    final result = await _getHistoryTransactionUC.call(params);

    result.fold(
      (l) {
        emit(WalletState.error('$l'));
      },
      (history) {
        emit(WalletState.getHistorySuccess(history));
      },
    );
  }
}
