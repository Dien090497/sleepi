import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/ens/ens.dart';
import 'package:slee_fi/models/explorers/explorers.dart';
import 'package:slee_fi/models/native_currency/native_currency.dart';

part 'network.g.dart';

@JsonSerializable()
class Network {
  final String name;
  final String? title;
  final String chain;
  final String? icon;
  final String? network;
  final List<String> rpc;
  final List<String> faucets;
  final NativeCurrency nativeCurrency;
  final String infoURL;
  final String shortName;
  final int chainId;
  final int networkId;
  final int? slip44;
  final Ens? ens;
  final List<Explorers>? explorers;
  final String routerAddress;

  Network({
    required this.name,
    this.title,
    required this.chain,
    this.icon,
    this.network,
    required this.rpc,
    required this.faucets,
    required this.nativeCurrency,
    required this.infoURL,
    required this.shortName,
    required this.chainId,
    required this.networkId,
    required this.slip44,
    this.ens,
    this.explorers,
    required this.routerAddress,
  });

  factory Network.fromJson(Map<String, dynamic> json) =>
      _$NetworkFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}
