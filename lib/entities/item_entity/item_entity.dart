import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_entity.freezed.dart';

@freezed
class ItemEntity with _$ItemEntity {
  const factory ItemEntity(
      {required String name,
      required String image,
      required int id,
      required int tokenId,
      required String effect,
      required String? quality,
      required int level,
      required String type}) = _ItemEntity;

  // Red Candy: Put positive correction to Efficiency
  // Blue Candy: Put positive correction to LUCK
  // White Candy: Put positive correction to Special
  // Purple Candy: Put positive correction to Resilience
}
