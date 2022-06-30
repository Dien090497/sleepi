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

  loadCurrentWallet() async {
    'current wallet loadding '.log;
    await Future.delayed(const Duration(milliseconds: 500));
    emit(const DetailWalletState.loading());
    final result = await _currentWalletUC.call(NoParams());
    result.fold((l) {
      emit(const DetailWalletState.empty());
      log('WalletCubit on failed   ${l is FailureMessage ? l.msg : '$l'} ');
    }, (r) async {
      log('WalletCubit on success ');
      ParamsBalanceOfToken params = ParamsBalanceOfToken(addressContract: [
        '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
        '0x0802d66f029c46E042b74d543fC43B6705ccb4ba',
        '0x264c1383EA520f73dd837F915ef3a732e204a493',
        // Mock address for test in test net
        '0x5541D83EFaD1f281571B343977648B75d95cdAC2',
        '0xb27c8941a7Df8958A1778c0259f76D1F8B711C35',
        '0x90fBE9dfe76F6EF971c7A297641dfa397099a13e',
        '0x6e7f5C0b9f4432716bDd0a77a3601291b9D9e985',
      ], walletInfoEntity: r);
      final result = await _getBalanceForTokensUseCase.call(params);
      result.fold((l) {
        emit(const DetailWalletState.error(
            message: 'Error when get balance token'));
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
