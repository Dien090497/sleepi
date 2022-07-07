import 'package:json_annotation/json_annotation.dart';

part 'transaction_history_model.g.dart';

@JsonSerializable()
class TransactionHistoryModel {
  final String blockNumber;
  final String timeStamp;
  final String hash;
  final String nonce;
  final String blockHash;
  final String transactionIndex;
  final String from;
  final String to;
  final String value;
  final String gas;
  final String gasPrice;
  final String? isError;
  @JsonKey(name: 'txreceipt_status')
  final String? txReceiptStatus;
  final String input;
  final String contractAddress;
  final String cumulativeGasUsed;
  final String gasUsed;
  final String confirmations;
  final String? tokenName;
  final String? tokenSymbol;
  final String? tokenDecimal;

  TransactionHistoryModel({
    required this.timeStamp,
    required this.blockNumber,
    required this.to,
    required this.from,
    required this.gasPrice,
    required this.value,
    required this.blockHash,
    required this.gas,
    required this.transactionIndex,
    required this.hash,
    required this.nonce,
    required this.confirmations,
    required this.contractAddress,
    required this.cumulativeGasUsed,
    required this.gasUsed,
    required this.input,
    required this.txReceiptStatus,
    required this.isError,
    this.tokenDecimal,
    this.tokenName,
    this.tokenSymbol
  });

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionHistoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionHistoryModelToJson(this);
}
