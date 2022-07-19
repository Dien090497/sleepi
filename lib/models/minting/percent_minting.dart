import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'percent_minting.g.dart';

@JsonSerializable()
class PercentMinting {
  PercentMinting({
    required this.value,
    required this.percent,
  });

  final String value;
  final int percent;

  factory PercentMinting.fromJson(Map<String, dynamic> json) => _$PercentMintingFromJson(json);

  Map<String, dynamic> toJson() => _$PercentMintingToJson(this);
}