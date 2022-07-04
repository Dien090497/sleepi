import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/get_balance_for_tokens_usecase.dart';
import 'package:slee_fi/usecase/get_nfts_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/current_wallet_usecase.dart';
import 'package:slee_fi/usecase/wallet/first_open_wallet_session_usecase.dart';

import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(const WalletState.initial());

  final _firstOpenWalletUC = getIt<CheckFirstOpenWallet>();
  final _currentWalletUC = getIt<CurrentWalletUseCase>();

  final _getBalanceForTokensUseCase = getIt<GetBalanceForTokensUseCase>();
  final _getNFTsUC = getIt<GetNFTsUseCase>();

  Future<void> init() async {
    emit(const WalletState.loading());
    final openWallet = await _firstOpenWalletUC.call(NoParams());
    final walletCall = await _currentWalletUC.call(NoParams());
    walletCall.fold(
      (l) => emit(WalletState.loaded(
        walletInfoEntity: null,
        firstOpenWallet: openWallet.getOrElse(() => false),
        tokenList: [],
      )),
      (r) => loadCurrentWallet(r),
    );
  }

  void importWallet(WalletInfoEntity walletInfoEntity) {
    final currentState = state;
    if (currentState is WalletStateLoaded) {
      emit(currentState.copyWith(walletInfoEntity: walletInfoEntity));
    } else {
      loadCurrentWallet(walletInfoEntity);
    }
  }

  void loadCurrentWallet(WalletInfoEntity? wallet) async {
    final currentState = state;
    final openWallet = await _firstOpenWalletUC.call(NoParams());

    if (wallet != null) {
      final ParamsBalanceOfToken params;
      final GetNFTsParams nfTsParams;
      if (wallet.chainID == 43113) {
        //TODO: Mock address for test net
        params = ParamsBalanceOfToken(
            addressContract: Const.listTokenAddressTestNet,
            walletInfoEntity: wallet);
        nfTsParams = GetNFTsParams(
          wallet.address,
          Const.listNFTAddressTestNet,
        );
      } else {
        //TODO: Mock address for Main net
        params = ParamsBalanceOfToken(
            addressContract: Const.listTokenAddressesMainNet,
            walletInfoEntity: wallet);
        nfTsParams = GetNFTsParams(
          wallet.address,
          Const.listNFTAddressesMainNet,
        );
      }
      final results = await Future.wait([
        _getBalanceForTokensUseCase.call(params),
        _getNFTsUC.call(nfTsParams),
      ]);
      final Either<Failure, List<double>> tokenBalanceRes = cast(results.first);
      final Either<Failure, List<NFTEntity>> nftBalanceRes = cast(results.last);
      List keyList = [
        "SLFT",
        "SLGT",
        "AVAX",
        LocaleKeys.beds.tr(),
        LocaleKeys.jewels.tr(),
        LocaleKeys.bed_box.tr(),
        LocaleKeys.item.tr(),
      ];
      List icons = [
        Ics.icSlft,
        Ics.icSlgt,
        Ics.icAvax,
        Ics.icBeds,
        Ics.icJewels,
        Ics.icBedBoxes,
        Imgs.icItems
      ];
      final tokenList = <TokenEntity>[];
      final values = tokenBalanceRes.getOrElse(() => []);
      final nfts = nftBalanceRes.getOrElse(() => []);
      for (int i = 0; i < values.length; i++) {
        final tokenEntity = TokenEntity(
          address: params.addressContract[i],
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
          address: nfTsParams.addresses[i],
          displayName: keyList[i],
          name: keyList[i],
          symbol: keyList[i],
          icon: icons[i],
          balance: nfts[i].balance.toDouble(),
        );
        tokenList.add(tokenEntity);
      }
      if (currentState is WalletStateLoaded) {
        emit(currentState.copyWith(
          walletInfoEntity: wallet,
          firstOpenWallet: openWallet.getOrElse(() => false),
          tokenList: tokenList,
        ));
      } else {
        emit(WalletState.loaded(
          walletInfoEntity: wallet,
          firstOpenWallet: openWallet.getOrElse(() => false),
          tokenList: tokenList,
        ));
      }
    } else {
      emit(WalletState.loaded(
        walletInfoEntity: null,
        firstOpenWallet: openWallet.getOrElse(() => false),
        tokenList: [],
      ));
    }
  }
}
