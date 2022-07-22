import 'package:json_annotation/json_annotation.dart';

import 'config_bed.dart';
import 'config_items.dart';
import 'config_jewels.dart';
import 'config_slft.dart';

part 'probability_config.g.dart';

@JsonSerializable()
class ProbabilityConfig{
  @JsonKey(name: 'Bed')
  final ConfigBed bed;
  final ConfigSlft slft;
  @JsonKey(name: 'Items')
  final ConfigItems items;
  @JsonKey(name: 'Jewels')
  final ConfigJewels jewels;

  ProbabilityConfig({
    required this.bed,
    required this.slft,
    required this.items,
    required this.jewels,
  });
  factory ProbabilityConfig.fromJson(Map<String, dynamic> json) => _$ProbabilityConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ProbabilityConfigToJson(this);
}
