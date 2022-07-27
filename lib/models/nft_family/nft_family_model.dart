import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/nft_family/nft_family.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';

part 'nft_family_model.g.dart';

@JsonSerializable()
class NftFamilyModel {

  final List<BedModel> queryParent;
  final List<BedModel> queryChildren;

  NftFamilyModel({required this.queryParent, required this.queryChildren});


  factory NftFamilyModel.fromJson(Map<String, dynamic> json) =>
      _$NftFamilyModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftFamilyModelToJson(this);

}
