import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/detail_wallet/detail_wallet_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/get_balance_for_tokens_usecase.dart';
import 'package:slee_fi/usecase/get_nfts_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:slee_fi/usecase/wallet/current_wallet_usecase.dart';

class DetailWalletCubit extends Cubit<DetailWalletState> {
  DetailWalletCubit() : super(const DetailWalletState.initial());
  final _currentWalletUC = getIt<CurrentWalletUseCase>();

  final _getBalanceForTokensUseCase = getIt<GetBalanceForTokensUseCase>();
  final _getNFTsUC = getIt<GetNFTsUseCase>();

  Future<void> loadCurrentWallet() async {
    'current wallet loading '.log;
    await Future.delayed(const Duration(milliseconds: 500));
    emit(const DetailWalletState.loading());
    final currentWalletRes = await _currentWalletUC.call(NoParams());
    currentWalletRes.fold((l) {
      emit(const DetailWalletState.empty());
    }, (r) async {
      emit(DetailWalletState.success(walletInfoEntity: r));
    });
    await _getTokensAndNFTsBalance();
    // result.fold((l) {
    //   emit(const DetailWalletState.empty());
    // }, (r) {
    //   var balance = r.nativeCurrency.balance / pow(10, 18);
    //   emit(DetailWalletState.success(walletInfoEntity: r, balance: balance));
    // });
  }

  Future<void> _getTokensAndNFTsBalance() async {
    final currentState = state;
    if (currentState is DetailWalletStateSuccess) {
      final r = currentState.walletInfoEntity;
      final ParamsBalanceOfToken tokenAddresses;
      final GetNFTsParams nfTsParams;
      if (r.chainID == 43113) {
        //TODO: Mock address for test net
        tokenAddresses = ParamsBalanceOfToken(addressContract: [
          '0x2bB8Bc1C29F34f3795661452Bf806cB5D65DF8DC',
          '0x41Dd35f9e440ADecB9A04fA839D0be2b19722Ade',
          '0xd00ae08403B9bbb9124bB305C09058E32C39A48c',
        ], walletInfoEntity: r);
        nfTsParams = GetNFTsParams(
          r.address,
          [
            '0x29285b806CF63b5C595BAf6FfAb27b6b70d2E01F',
            '0x198a7b705B833eB24f6A27F1ee96b385A49B8a4b',
            '0x21AD1AE2f45e72cC92E1f3B74c184F8De2e2DBa6',
            '',
          ],
        );
      } else {
        //TODO: Mock address for Main net
        tokenAddresses = ParamsBalanceOfToken(addressContract: [
          '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
          '0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E',
          '0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7',
        ], walletInfoEntity: r);
        nfTsParams = GetNFTsParams(r.address, [
          '0xA90Cded6dad06dF521f22643B2cA98c068CEe866',
          '',
          '',
          '',
        ]);
      }
      final results = await Future.wait([
        _getBalanceForTokensUseCase.call(tokenAddresses),
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
      for (int i = 0; i < values.length; i++) {
        TokenEntity tokenEntity = TokenEntity(
          address: tokenAddresses.addressContract[i],
          displayName: keyList[i],
          name: keyList[i],
          symbol: keyList[i],
          icon: icons[i],
          balance: values[i],
        );
        tokenList.add(tokenEntity);
      }
      emit(currentState.copyWith(
        tokenList: tokenList,
        nftList: nftBalanceRes.getOrElse(() => []),
      ));

      tokenBalanceRes.fold((l) {
        emit(const DetailWalletState.error(
            message: 'Error when get balance token'));
      }, (values) {});
    }
  }
}
