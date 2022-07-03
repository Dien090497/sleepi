import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
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
  late ParamsBalanceOfToken params;

  loadCurrentWallet() async {
    'current wallet loading '.log;
    await Future.delayed(const Duration(milliseconds: 500));
    emit(const DetailWalletState.loading());
    final result = await _currentWalletUC.call(NoParams());
    result.fold((l) {
      emit(const DetailWalletState.empty());
      log('WalletCubit on failed   ${l is FailureMessage ? l.msg : '$l'} ');
    }, (r) async {
      log('WalletCubit on success ');
      if (r.chainID == 43113) {
        //TODO: Mock address for test net
        params = ParamsBalanceOfToken(addressContract: [
          '0x2bB8Bc1C29F34f3795661452Bf806cB5D65DF8DC',
          '0x41Dd35f9e440ADecB9A04fA839D0be2b19722Ade',
          '0xd00ae08403B9bbb9124bB305C09058E32C39A48c',
          '0xdB051670fc5610Ffe2ec8A4471086AAa9c5529c1',
          '0xdB051670fc5610Ffe2ec8A4471086AAa9c5529c1',
          '0xdB051670fc5610Ffe2ec8A4471086AAa9c5529c1',
          '0xdB051670fc5610Ffe2ec8A4471086AAa9c5529c1',
        ], walletInfoEntity: r);
      } else {
        //TODO: Mock address for Main net
        params = ParamsBalanceOfToken(addressContract: [
          '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
          '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
          '0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7',
          '0xA90Cded6dad06dF521f22643B2cA98c068CEe866',
          '0xA90Cded6dad06dF521f22643B2cA98c068CEe866',
          '0xA90Cded6dad06dF521f22643B2cA98c068CEe866',
          '0xA90Cded6dad06dF521f22643B2cA98c068CEe866',
        ], walletInfoEntity: r);
      }
      final result = await _getBalanceForTokensUseCase.call(params);
      result.fold((l) {
        emit(const DetailWalletState.error(
            message: 'Error when get balance token'));
      }, (values) {
        List keyList = [
          "slft",
          "slgt",
          "wavax",
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
        emit(DetailWalletState.success(
            walletInfoEntity: r, tokenList: tokenList));
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
