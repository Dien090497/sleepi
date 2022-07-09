import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/swap_token_to_wallet_response/swap_token_to_wallet_response.dart';

part 'withdraw_history_response.g.dart';

@JsonSerializable()
class WithdrawHistoryResponse {
  final List<SwapTokenToWalletResponse> data;
  final int page;
  final int totalItem;

  WithdrawHistoryResponse(this.data, this.page, this.totalItem);

  factory WithdrawHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$WithdrawHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawHistoryResponseToJson(this);
}
