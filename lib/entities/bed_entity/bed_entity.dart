import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';

part 'bed_entity.freezed.dart';

@freezed
class BedEntity with _$BedEntity {
  const factory BedEntity({
    required int id,
    required int nftId,
    required String name,
    required String nftClass,
    required int tokenId,
    required int level,
    required String image,
    required String type,
    required String contractAddress,
    required String? quality,
    required String owner,
    required String status,
    required double durability,
    required int isLock,
    required int bedMint,
    required double efficiency,
    required double luck,
    required double bonus,
    required double special,
    required double resilience,
    required int time,
    required int isMint,
    required int? socket,
    required double? insurancePercent,
    required double? startTime,
    required double? endTime,
    required String? jewelType,
    required List<JewelEntity> jewels,
  }) = _BedEntity;
}
