import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/get_balance_for_tokens_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/current_wallet_usecase.dart';
import 'package:slee_fi/usecase/wallet/first_open_wallet_session_usecase.dart';

import 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(const WalletState.initial());

  final _firstOpenWalletUC = getIt<CheckFirstOpenWallet>();
  final _currentWalletUC = getIt<CurrentWalletUseCase>();
  var firstOpenWallet = true;

  final _getBalanceForTokensUseCase = getIt<GetBalanceForTokensUseCase>();
  final List<TokenEntity> tokenList = [];
  late ParamsBalanceOfToken params;

  init() async {
    emit(const WalletState.loading());
    var openWallet = await _firstOpenWalletUC.call(NoParams());
    final walletCall = await _currentWalletUC.call(NoParams());
    openWallet.foldRight(bool, (r, previous) => firstOpenWallet = r);
    walletCall.fold(
        (l) => emit(WalletState.loaded(
            walletInfoEntity: null,
            firstOpenWallet: firstOpenWallet,
            tokenList: tokenList)),
        (r) => loadCurrentWallet(r));
  }

  importWallet(WalletInfoEntity walletInfoEntity) {
    final currentState = state;
    if (currentState is WalletStateLoaded) {
      emit(currentState.copyWith(walletInfoEntity: walletInfoEntity));
    } else {
      loadCurrentWallet(walletInfoEntity);
    }
  }

  loadCurrentWallet(WalletInfoEntity wallet) async {
    if (wallet.chainID == 43113) {
      //TODO: Mock address for test net
      params = ParamsBalanceOfToken(
          addressContract: Const.listContractAddressTestNet,
          walletInfoEntity: wallet);
    } else {
      //TODO: Mock address for Main net
      params = ParamsBalanceOfToken(
          addressContract: Const.listContractAddressMainNet,
          walletInfoEntity: wallet);
    }
    final result = await _getBalanceForTokensUseCase.call(params);
    result.fold((l) {
      emit(const WalletState.error(message: 'Error when get balance token'));
    }, (values) {
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
      for (int i = 0; i < values.length; i++) {
        TokenEntity tokenEntity = TokenEntity(
          address: params.addressContract[i],
          displayName: keyList[i],
          name: keyList[i],
          symbol: keyList[i],
          icon: icons[i],
          balance: values[i],
        );
        tokenList.add(tokenEntity);
      }
      emit(WalletState.loaded(
          walletInfoEntity: wallet,
          firstOpenWallet: firstOpenWallet,
          tokenList: tokenList));
    });
  }
}
