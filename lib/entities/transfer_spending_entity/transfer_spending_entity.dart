import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/common/enum/enum.dart';

part 'transfer_spending_entity.g.dart';

@JsonSerializable()
class TransferSpendingEntity {
  final TokenToSpending type;
  final String txHash;

  TransferSpendingEntity({required this.type, required this.txHash});
}