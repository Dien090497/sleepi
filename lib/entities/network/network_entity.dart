import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/ens/ens_entity.dart';
import 'package:slee_fi/entities/explorers/explorers_entity.dart';
import 'package:slee_fi/entities/native_currency/native_currency_entity.dart';

part 'network_entity.freezed.dart';

@freezed
class NetworkEntity with _$NetworkEntity {
  const factory NetworkEntity({
    required int chainId,
    required String name,
    required String? title,
    required String chain,
    required String? icon,
    required String? network,
    required List<String> rpc,
    required List<String> faucets,
    required NativeCurrencyEntity nativeCurrency,
    required String infoURL,
    required String shortName,
    required int networkId,
    required int? slip44,
    required EnsEntity? ens,
    required List<ExplorersEntity>? explorers,
    required String routerAddress,
  }) = _NetworkEntity;
}
