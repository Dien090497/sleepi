import 'package:json_annotation/json_annotation.dart';

import 'config_bed.dart';
import 'config_items.dart';
import 'config_jewels.dart';
import 'config_slft.dart';

part 'probability_config.g.dart';

@JsonSerializable()
class ProbabilityConfig{
  final ConfigBed bed;
  final ConfigSlft slft;
  final ConfigItems items;
  final ConfigJewels jewels;
  final int times;

  ProbabilityConfig({
    required this.bed,
    required this.slft,
    required this.items,
    required this.jewels,
    required this.times,
  });
  factory ProbabilityConfig.fromJson(Map<String, dynamic> json) => _$ProbabilityConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ProbabilityConfigToJson(this);
}
