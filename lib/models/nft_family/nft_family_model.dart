import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/nft_family/nft_family.dart';

part 'nft_family_model.g.dart';

@JsonSerializable()
class NftFamilyModel {
  final List<_Data> parent;
  final List<_Data> children;

  NftFamilyModel(this.parent, this.children);

  factory NftFamilyModel.fromJson(Map<String, dynamic> json) =>
      _$NftFamilyModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftFamilyModelToJson(this);

  NftFamilyEntity toEntity() => NftFamilyEntity(
        parent: parent.map((e) => e.toEntity()).toList(),
        children: children.map((e) => e.toEntity()).toList(),
      );
}

@JsonSerializable()
class _Data {
  final int id;
  final String image;
  final String type;

  _Data(this.id, this.image, this.type);

  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  FamilyDataEntity toEntity() =>
      FamilyDataEntity(id: id, image: image, type: type);
}