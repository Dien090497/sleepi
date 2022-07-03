// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_spending_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferSpendingEntity _$TransferSpendingEntityFromJson(
        Map<String, dynamic> json) =>
    TransferSpendingEntity(
      type: $enumDecode(_$TokenToSpendingEnumMap, json['type']),
      txHash: json['txHash'] as String,
    );

Map<String, dynamic> _$TransferSpendingEntityToJson(
        TransferSpendingEntity instance) =>
    <String, dynamic>{
      'type': _$TokenToSpendingEnumMap[instance.type],
      'txHash': instance.txHash,
    };

const _$TokenToSpendingEnumMap = {
  TokenToSpending.approve: 'approve',
  TokenToSpending.spending: 'spending',
};
