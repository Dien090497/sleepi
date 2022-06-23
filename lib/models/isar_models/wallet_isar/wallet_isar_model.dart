import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';
import 'package:slee_fi/entities/native_currency/native_currency_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:web3dart/web3dart.dart';

part 'wallet_isar_model.g.dart';

@CopyWith()
@Collection(accessor: 'wallets')
class WalletIsarModel {
  int? id = Isar.autoIncrement;

  late final String mnemonic;

  late final String privateKey;

  late final String name;

  late final String address;

  late final String image;

  late final int? derivedIndex;

  @Index()
  late final bool isImported;

  // @Backlink(to: 'wallet')
  // final tokens = IsarLinks<TokenIsarModel>();

  late final List<int> nftIds;

  late final List<int> txnsIds;

  WalletIsarModel({
    required this.privateKey,
    required this.mnemonic,
    required this.name,
    required this.address,
    this.image = '',
    this.derivedIndex,
    this.isImported = false,
    this.nftIds = const <int>[],
    this.txnsIds = const <int>[],
  });

  WalletInfoEntity toEntity(
    Credentials credentials, {
    required String networkName,
    required NativeCurrencyEntity nativeCurrency,
    int? derivedIndex,
  }) {
    assert(id != null, "Id must be assigned");
    return WalletInfoEntity(
      networkName: networkName,
      id: id!,
      address: address,
      credentials: credentials,
      mnemonic: mnemonic,
      name: name,
      derivedIndex: derivedIndex ?? this.derivedIndex,
      isImported: isImported,
      image: image,
      nativeCurrency: nativeCurrency,
    );
  }
}
