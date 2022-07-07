// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionHistoryModel _$TransactionHistoryModelFromJson(
        Map<String, dynamic> json) =>
    TransactionHistoryModel(
      timeStamp: json['timeStamp'] as String,
      blockNumber: json['blockNumber'] as String,
      to: json['to'] as String,
      from: json['from'] as String,
      gasPrice: json['gasPrice'] as String,
      value: json['value'] as String,
      blockHash: json['blockHash'] as String,
      gas: json['gas'] as String,
      transactionIndex: json['transactionIndex'] as String,
      hash: json['hash'] as String,
      nonce: json['nonce'] as String,
      confirmations: json['confirmations'] as String,
      contractAddress: json['contractAddress'] as String,
      cumulativeGasUsed: json['cumulativeGasUsed'] as String,
      gasUsed: json['gasUsed'] as String,
      input: json['input'] as String,
      txReceiptStatus: json['txreceipt_status'] as String?,
      isError: json['isError'] as String?,
      tokenDecimal: json['tokenDecimal'] as String?,
      tokenName: json['tokenName'] as String?,
      tokenSymbol: json['tokenSymbol'] as String?,
    );

Map<String, dynamic> _$TransactionHistoryModelToJson(
        TransactionHistoryModel instance) =>
    <String, dynamic>{
      'blockNumber': instance.blockNumber,
      'timeStamp': instance.timeStamp,
      'hash': instance.hash,
      'nonce': instance.nonce,
      'blockHash': instance.blockHash,
      'transactionIndex': instance.transactionIndex,
      'from': instance.from,
      'to': instance.to,
      'value': instance.value,
      'gas': instance.gas,
      'gasPrice': instance.gasPrice,
      'isError': instance.isError,
      'txreceipt_status': instance.txReceiptStatus,
      'input': instance.input,
      'contractAddress': instance.contractAddress,
      'cumulativeGasUsed': instance.cumulativeGasUsed,
      'gasUsed': instance.gasUsed,
      'confirmations': instance.confirmations,
      'tokenName': instance.tokenName,
      'tokenSymbol': instance.tokenSymbol,
      'tokenDecimal': instance.tokenDecimal,
    };
