// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftDataModel _$NftDataModelFromJson(Map<String, dynamic> json) => NftDataModel(
      json['id'] as int?,
      json['categoryId'] as int?,
      json['isLock'] as int?,
      json['status'] as String?,
      json['attribute'] == null
          ? null
          : NftAttributeModel.fromJson(
              json['attribute'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NftDataModelToJson(NftDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'isLock': instance.isLock,
      'status': instance.status,
      'attribute': instance.attribute?.toJson(),
    };
