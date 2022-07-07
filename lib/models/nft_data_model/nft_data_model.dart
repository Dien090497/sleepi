import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/models/nft_attribute_model/nft_attribute_model.dart';

part 'nft_data_model.g.dart';

@JsonSerializable()
class NftDataModel {
  final int id;
  final int categoryId;
  final int isLock;
  final String status;
  final NftAttributeModel attribute;

  NftDataModel(
      this.id, this.categoryId, this.isLock, this.status, this.attribute);

  factory NftDataModel.fromJson(Map<String, dynamic> json) =>
      _$NftDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftDataModelToJson(this);

  NFTEntity toEntity() => NFTEntity(
      id: id,
      categoryId: categoryId,
      isLock: isLock,
      status: status,
      attribute: attribute.toEntity());
}
