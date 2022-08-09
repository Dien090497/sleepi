import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/minting/nft_attribute_minting.dart';
import 'package:slee_fi/models/minting/percent_minting.dart';

import 'broken_rate.dart';

part 'minting_model.g.dart';

@JsonSerializable()
class MintingModel {

  MintingModel({
    required this.status,
    required this.nftAttribute,
    required this.msg,
  });

  final bool status;
  final NftAttributeMinting? nftAttribute;
  final String msg;

  factory MintingModel.fromJson(Map<String, dynamic> json) => _$MintingModelFromJson(json);

  Map<String, dynamic> toJson() => _$MintingModelToJson(this);
}
