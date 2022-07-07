import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/common/extensions/string_x.dart';

part 'swap_token_to_wallet_response.g.dart';

@JsonSerializable()
class SwapTokenToWalletResponse {
  final String type;
  final String tokenAddress;
  final String amount;
  final String mainWallet;
  final String status;
  final int userId;
  final String createdAt;
  final String updatedAt;
  final int id;

  SwapTokenToWalletResponse(
      this.type,
      this.tokenAddress,
      this.amount,
      this.mainWallet,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.id);

  factory SwapTokenToWalletResponse.fromJson(Map<String, dynamic> json) {
    'json in is   $json'.log;
    return _$SwapTokenToWalletResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SwapTokenToWalletResponseToJson(this);
}
