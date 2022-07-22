import 'package:json_annotation/json_annotation.dart';

part 'config_items.g.dart';

@JsonSerializable()
class ConfigItems{
  @JsonKey(name : 'level_1')
  final int? level1;
  @JsonKey(name : 'level_2')
  final double? level2;
  @JsonKey(name : 'level_3')
  final double? level3;
  @JsonKey(name : 'level_4')
  final double? level4;

  ConfigItems({
    required this.level1,
    required this.level2,
    required this.level3,
    required this.level4,
  });
  factory ConfigItems.fromJson(Map<String, dynamic> json) => _$ConfigItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigItemsToJson(this);
}
