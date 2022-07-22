import 'package:json_annotation/json_annotation.dart';

part 'config_bed.g.dart';

@JsonSerializable()
class ConfigBed{
  @JsonKey(name: 'Common')
 final double? common;
  @JsonKey(name: 'Epic_Bed')
 final int? epicBed;
  @JsonKey(name: 'Uncommon')
 final double? uncommon;
  @JsonKey(name: 'Legendaly_Bed')
 final int? legendaryBed;

  ConfigBed({
    required this.common,
    required this.epicBed,
    required this.uncommon,
    required this.legendaryBed,
  });
  factory ConfigBed.fromJson(Map<String, dynamic> json) => _$ConfigBedFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigBedToJson(this);
}
