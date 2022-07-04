import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/global_wallet/global_wallet_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/get_balance_for_tokens_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/current_wallet_usecase.dart';

class GlobalWalletCubit extends Cubit<GlobalWalletState> {
  GlobalWalletCubit() : super(const GlobalWalletState.initial());
  final _getBalanceForTokensUseCase = getIt<GetBalanceForTokensUseCase>();
  final _currentWalletUC = getIt<CurrentWalletUseCase>();

  final List<TokenEntity> tokenList = [];
  late ParamsBalanceOfToken params;

  changeNetworkId(WalletInfoEntity walletInfo) async {
    'WalletCubit on success '.log;
    if (walletInfo.chainID == 43113) {
      //TODO: Mock address for test net
      params = ParamsBalanceOfToken(addressContract: [
        '0x2bB8Bc1C29F34f3795661452Bf806cB5D65DF8DC',
        '0x41Dd35f9e440ADecB9A04fA839D0be2b19722Ade',
        '0xD9D01A9F7C810EC035C0e42cB9E80Ef44D7f8692',
      ], walletInfoEntity: walletInfo);
    } else {
      //TODO: Mock address for Main net
      params = ParamsBalanceOfToken(addressContract: [
        '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
        '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
        '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
      ], walletInfoEntity: walletInfo);
    }
    final balanceUC = await _getBalanceForTokensUseCase.call(params);
    balanceUC.fold((l) {
      // emit(const GlobalWalletState.error(
      //     message: 'Error when get balance token'));
    }, (values) {
      List keyList = ["SLFT", "SLGT", "AVAX"];
      List icons = [Ics.icSlft, Ics.icSlgt, Ics.icSolana];
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
      emit(GlobalWalletState.loaded(
          walletInfoEntity: walletInfo, tokenList: tokenList));
    });
  }

  init() async {
    emit(const GlobalWalletState.loading());
    final result = await _currentWalletUC.call(NoParams());
    result.fold((l) {
      emit(const GlobalWalletState.empty());
      'WalletCubit on failed   ${l is FailureMessage ? l.msg : '$l'} '.log;
    }, (r) => changeNetworkId(r));
  }
}
