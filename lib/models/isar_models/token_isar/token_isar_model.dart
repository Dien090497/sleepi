import 'package:dartz/dartz.dart';
import 'package:erc20/erc20.dart';
import 'package:isar/isar.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:web3dart/web3dart.dart';

part 'token_isar_model.g.dart';

@Collection(accessor: 'tokens')
class TokenIsarModel {
  int? id = Isar.autoIncrement;

  final int walletId;

  final int networkChainId;

  final String address;

  final String displayName;

  final String name;

  final String symbol;

  final String icon;

  final int balance;

  final List<String> txns;

  TokenIsarModel({
    this.id,
    required this.walletId,
    required this.networkChainId,
    required this.address,
    required this.name,
    required this.displayName,
    required this.icon,
    required this.symbol,
    required this.balance,
    this.txns = const <String>[],
  });

  static Future<TokenIsarModel> create({
    required WalletInfoEntity wallet,
    required int networkChainId,
    required String tokenAddress,
    required ERC20 erc20,
    required String? displayName,
    bool fetchBalance = true,
  }) async {
    final result = await Future.wait([
      erc20.name(),
      erc20.symbol(),
      if (fetchBalance)
        erc20.balanceOf(EthereumAddress.fromHex(wallet.address)),
    ]);
    final name = cast<String?>(result[0]) ?? '';
    final symbol = cast<String?>(result[1]) ?? '';
    final balance =
        fetchBalance ? cast<BigInt?>(result[2]) ?? BigInt.zero : BigInt.zero;
    final tokenModel = TokenIsarModel(
      networkChainId: networkChainId,
      walletId: wallet.id,
      address: tokenAddress,
      name: name,
      displayName: displayName ?? name,
      icon: symbol.cryptoIcon,
      symbol: symbol,
      balance: balance.toInt(),
    );
    return tokenModel;
  }

  TokenEntity toEntity({int? balance, String? displayName}) {
    return TokenEntity(
      id: id,
      address: address,
      name: name,
      icon: icon,
      symbol: symbol,
      balance: balance ?? this.balance,
      displayName: displayName ?? this.displayName,
      txns: txns,
    );
  }
}
