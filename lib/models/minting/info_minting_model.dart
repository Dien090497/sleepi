
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/minting/percent_minting.dart';

import 'broken_rate.dart';

part 'info_minting_model.g.dart';

@JsonSerializable()
class InfoMintingModel {

  InfoMintingModel({
    required this.fee,
    required this.percentMinting,
    required this.randomQuality,
    required this.brokenRate,
  });

  final int fee;
  final List<PercentMinting> percentMinting;
  final String randomQuality;
  final BrokenRate brokenRate;

  factory InfoMintingModel.fromJson(Map<String, dynamic> json) => _$InfoMintingModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoMintingModelToJson(this);
}
