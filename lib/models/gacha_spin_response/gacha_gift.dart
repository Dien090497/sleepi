import 'package:json_annotation/json_annotation.dart';

import 'gacha_attributes_item.dart';

part 'gacha_gift.g.dart';
@JsonSerializable()
class GachaGift{
  final String type;
  final GachaAttributesItem attributes;

  GachaGift({
    required this.type,
    required this.attributes,
  });
  factory GachaGift.fromJson(Map<String, dynamic> json) => _$GachaGiftFromJson(json);

  Map<String, dynamic> toJson() => _$GachaGiftToJson(this);
}
