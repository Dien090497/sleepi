import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'broken_rate.g.dart';

@JsonSerializable()
class BrokenRate {

  BrokenRate({
    required this.parent1,
    required this.parent2,
    required this.fee,
    required this.brokenRate,
  });

  final String parent1;
  final String parent2;
  final int fee;
  final int brokenRate;

  factory BrokenRate.fromJson(Map<String, dynamic> json) => _$BrokenRateFromJson(json);

  Map<String, dynamic> toJson() => _$BrokenRateToJson(this);
}