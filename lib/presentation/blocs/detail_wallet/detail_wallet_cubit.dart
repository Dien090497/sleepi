

import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/detail_wallet/detail_wallet_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/get_balance_for_tokens_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/current_wallet_usecase.dart';

class DetailWalletCubit extends Cubit<DetailWalletState> {
  DetailWalletCubit() : super(const DetailWalletState.initial());
  final _currentWalletUC = getIt<CurrentWalletUseCase>();

  final _getBalanceForTokensUseCase = getIt<GetBalanceForTokensUseCase>();
  final List<TokenEntity> tokenList = [];

  loadCurrentWallet() async {
    emit(const DetailWalletState.loading());
    final result = await _currentWalletUC.call(NoParams());
    result.fold((l) {
      emit(const DetailWalletState.empty());
      log('WalletCubit on failed   ${l is FailureMessage ? l.msg : '$l'} ');
    }, (r) async {
      log('WalletCubit on success ');
      ParamsBalanceOfToken params = ParamsBalanceOfToken(addressContract: [
        '0x2bB8Bc1C29F34f3795661452Bf806cB5D65DF8DC',
        '0x41Dd35f9e440ADecB9A04fA839D0be2b19722Ade',
        '0xD9D01A9F7C810EC035C0e42cB9E80Ef44D7f8692',
        // Mock address for test in test net
        '0xdB051670fc5610Ffe2ec8A4471086AAa9c5529c1',
        '0xdB051670fc5610Ffe2ec8A4471086AAa9c5529c1',
        '0xdB051670fc5610Ffe2ec8A4471086AAa9c5529c1',
        '0xdB051670fc5610Ffe2ec8A4471086AAa9c5529c1',
      ], walletInfoEntity: r);
      final result = await _getBalanceForTokensUseCase.call(params);
      result.fold((l) {
        emit(const DetailWalletState.error(message: 'Error when get balance token'));
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
        for (int i=0; i< values.length; i++) {
          TokenEntity tokenEntity = TokenEntity(
            address: params.addressContract[i],
            displayName: keyList[i],
            name: keyList[i],
            symbol: keyList[i],
            icon: icons[i],
            balance: values[i],);
          tokenList.add(tokenEntity);
        }
        emit(DetailWalletState.success(walletInfoEntity: r, tokenList: tokenList));
      });
    });


    // result.fold((l) {
    //   emit(const DetailWalletState.empty());
    // }, (r) {
    //   var balance = r.nativeCurrency.balance / pow(10, 18);
    //   emit(DetailWalletState.success(walletInfoEntity: r, balance: balance));
    // });
  }
}
