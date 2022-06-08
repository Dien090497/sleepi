import 'package:isar/isar.dart';
import 'package:slee_fi/common/extensions/object_ext.dart';
import 'package:slee_fi/entities/network/network_entity.dart';
import 'package:slee_fi/models/isar_models/ens_isar/ens_isar_model.dart';
import 'package:slee_fi/models/isar_models/explorers_isar/explorers_isar_model.dart';
import 'package:slee_fi/models/isar_models/native_currency_isar/native_currency_isar_model.dart';
import 'package:slee_fi/models/network/network.dart';

part 'network_isar_model.g.dart';

@Collection(accessor: 'networks')
class NetworkIsarModel {
  @Id()
  late int chainId;

  String? title;

  String? icon;

  String? network;

  int? slip44;

  late String name;

  late String chain;

  late List<String> rpc;

  late List<String> faucets;

  late String infoURL;

  late String shortName;

  late int networkId;

  final nativeCurrency = IsarLink<NativeCurrencyIsarModel>();

  final ens = IsarLink<EnsIsarModel>();

  final explorers = IsarLinks<ExplorersIsarModel>();

  NetworkIsarModel({
    required this.chainId,
    required this.name,
    this.title,
    required this.chain,
    this.icon,
    this.network,
    required this.rpc,
    required this.faucets,
    required this.infoURL,
    required this.shortName,
    required this.networkId,
    this.slip44,
  });

  NetworkEntity toEntity() => NetworkEntity(
        chainId: chainId,
        name: name,
        title: title,
        chain: chain,
        icon: icon,
        network: network,
        rpc: rpc,
        faucets: faucets,
        nativeCurrency: nativeCurrency.value!.toEntity(balance: 0),
        //
        infoURL: infoURL,
        shortName: shortName,
        networkId: networkId,
        slip44: slip44,
        ens: ens.value?.toEntity(),
        explorers: explorers.map((e) => e.toEntity()).toList(),
      );

  factory NetworkIsarModel.fromNetwork(Network e) {
    final model = NetworkIsarModel(
      chainId: e.chainId,
      name: e.name,
      chain: e.chain,
      rpc: e.rpc,
      faucets: e.faucets,
      infoURL: e.infoURL,
      shortName: e.shortName,
      networkId: e.networkId,
      network: e.network,
      icon: e.icon,
      slip44: e.slip44,
      title: e.title,
    );
    model
      ..ens.value = EnsIsarModel.fromEns(e.ens)
      ..nativeCurrency.value = NativeCurrencyIsarModel.fromNativeCurrency(
        e.nativeCurrency,
        icon: e.cryptoIcon,
        balance: 0,
      )
      ..explorers.addAll(e.explorers != null
          ? e.explorers!.map((e) => ExplorersIsarModel.fromExplorers(e))
          : []);
    return model;
  }

  factory NetworkIsarModel.fromEntity(NetworkEntity e) {
    final model = NetworkIsarModel(
      chainId: e.chainId,
      name: e.name,
      chain: e.chain,
      rpc: e.rpc,
      faucets: e.faucets,
      infoURL: e.infoURL,
      shortName: e.shortName,
      networkId: e.networkId,
      title: e.title,
      slip44: e.slip44,
      icon: e.icon,
      network: e.network,
    );
    model
      ..nativeCurrency.value =
          NativeCurrencyIsarModel.fromEntity(e.nativeCurrency)
      ..ens.value = EnsIsarModel.fromEnsEntity(e.ens)
      ..explorers.addAll(
        e.explorers != null
            ? e.explorers!.map((ex) => ExplorersIsarModel.fromEntity(ex))
            : [],
      );
    return model;
  }
}
