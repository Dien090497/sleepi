import 'package:json_annotation/json_annotation.dart';

part 'global_config_response.g.dart';

@JsonSerializable()
class GlobalConfigResponse {
  final String contract;
  final bool isEnableActiveCode;

  @JsonKey(name: 'message_sign')
  final String messageSign;

  @JsonKey(name: 'tokenSupport')
  final List<_Token> tokens;

  final _NftAddress nftAddress;

  GlobalConfigResponse(
    this.tokens,
    this.nftAddress, {
    required this.contract,
    required this.isEnableActiveCode,
    required this.messageSign,
  });

  factory GlobalConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalConfigResponseToJson(this);
}

@JsonSerializable()
class _Token {
  final String symbol;
  final String address;

  _Token(this.symbol, this.address);

  factory _Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}

@JsonSerializable()
class _NftAddress {
  @JsonKey(name: 'bed')
  final String bedAddress;
  @JsonKey(name: 'bedbox')
  final String bedBoxAddress;
  @JsonKey(name: 'jewel')
  final String jewelAddress;
  @JsonKey(name: 'item')
  final String itemAddress;

  _NftAddress(
      this.bedAddress, this.bedBoxAddress, this.jewelAddress, this.itemAddress);

  factory _NftAddress.fromJson(Map<String, dynamic> json) =>
      _$NftAddressFromJson(json);

  Map<String, dynamic> toJson() => _$NftAddressToJson(this);
}
