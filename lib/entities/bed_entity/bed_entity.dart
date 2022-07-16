import 'package:freezed_annotation/freezed_annotation.dart';

part 'bed_entity.freezed.dart';

@freezed
class BedEntity with _$BedEntity {
  const factory BedEntity({
    required String name,
    required String nftClass,
    required int id,
    required int tokenId,
    required int level,
    required String image,
    required String type,
    required String contractAddress,
    required String? quality,
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
    int? nftId,
    double? insurancePercent,
    double? startTime,
    double? endTime,
  }) = _BedEntity;
}
