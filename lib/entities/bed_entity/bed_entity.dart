import 'package:freezed_annotation/freezed_annotation.dart';

part 'bed_entity.freezed.dart';

@freezed
class BedEntity with _$BedEntity {
  const factory BedEntity({
    required String name,
    required int id,
    required int level,
    required String image,
    required String type,
    required String contractAddress,
    required String quality,
    required int durability,
    required int isLock,
    required int bedMint,
    required int efficiency,
    required int luck,
    required int bonus,
    required int special,
    required int resilience,
    required int time,
    required int isMint,
  }) = _BedEntity;
}
