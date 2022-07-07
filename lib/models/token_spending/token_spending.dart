import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_spending.g.dart';

@JsonSerializable()
class TokenSpending {
  final int id;
  final String symbol;
  final String amount;
  final int userId;
  final String availableAmount;
  final String wallet;
  final String tokenAddress;

  TokenSpending(
    this.id,
    this.symbol,
    this.amount,
    this.userId,
    this.availableAmount,
    this.wallet,
    this.tokenAddress,
  );

  factory TokenSpending.fromJson(Map<String, dynamic> json) =>
      _$TokenSpendingFromJson(json);

  Map<String, dynamic> toJson() => _$TokenSpendingToJson(this);


}
