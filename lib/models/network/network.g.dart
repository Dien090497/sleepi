// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Network _$NetworkFromJson(Map<String, dynamic> json) => Network(
      name: json['name'] as String,
      title: json['title'] as String?,
      chain: json['chain'] as String,
      icon: json['icon'] as String?,
      network: json['network'] as String?,
      rpc: (json['rpc'] as List<dynamic>).map((e) => e as String).toList(),
      faucets:
          (json['faucets'] as List<dynamic>).map((e) => e as String).toList(),
      nativeCurrency: NativeCurrency.fromJson(
          json['nativeCurrency'] as Map<String, dynamic>),
      infoURL: json['infoURL'] as String,
      shortName: json['shortName'] as String,
      chainId: json['chainId'] as int,
      networkId: json['networkId'] as int,
      slip44: json['slip44'] as int?,
      ens: json['ens'] == null
          ? null
          : Ens.fromJson(json['ens'] as Map<String, dynamic>),
      explorers: (json['explorers'] as List<dynamic>?)
          ?.map((e) => Explorers.fromJson(e as Map<String, dynamic>))
          .toList(),
      routerAddress: json['routerAddress'] as String,
    );

Map<String, dynamic> _$NetworkToJson(Network instance) => <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'chain': instance.chain,
      'icon': instance.icon,
      'network': instance.network,
      'rpc': instance.rpc,
      'faucets': instance.faucets,
      'nativeCurrency': instance.nativeCurrency.toJson(),
      'infoURL': instance.infoURL,
      'shortName': instance.shortName,
      'chainId': instance.chainId,
      'networkId': instance.networkId,
      'slip44': instance.slip44,
      'ens': instance.ens?.toJson(),
      'explorers': instance.explorers?.map((e) => e.toJson()).toList(),
      'routerAddress': instance.routerAddress,
    };
