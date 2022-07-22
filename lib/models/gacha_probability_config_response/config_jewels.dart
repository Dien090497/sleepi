import 'package:json_annotation/json_annotation.dart';

part 'config_jewels.g.dart';

@JsonSerializable()
class ConfigJewels{
  @JsonKey(name : 'level_1')
  final int? level1;
  @JsonKey(name : 'level_2')
  final int? level2;
  @JsonKey(name : 'level_3')
  final int? level3;
  @JsonKey(name : 'level_4')
  final int? level4;

  ConfigJewels({
    required this.level1,
    required this.level2,
    required this.level3,
    required this.level4,
  });
  factory ConfigJewels.fromJson(Map<String, dynamic> json) => _$ConfigJewelsFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigJewelsToJson(this);
}
