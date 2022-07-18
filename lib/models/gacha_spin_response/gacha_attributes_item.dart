import 'package:json_annotation/json_annotation.dart';

part 'gacha_attributes_item.g.dart';
@JsonSerializable()
class GachaAttributesItem{
  final double level;
  final double efficiency;
  final double luck;
  final double bonus;
  final double special;
  final double resilience;

  GachaAttributesItem({
    required this.level,
    required this.efficiency,
    required this.luck,
    required this.bonus,
    required this.special,
    required this.resilience,
  });
  factory GachaAttributesItem.fromJson(Map<String, dynamic> json) => _$GachaAttributesItemFromJson(json);

  Map<String, dynamic> toJson() => _$GachaAttributesItemToJson(this);
}
