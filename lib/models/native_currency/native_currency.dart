import 'package:json_annotation/json_annotation.dart';

part 'native_currency.g.dart';

@JsonSerializable()
class NativeCurrency {
  final String name;
  final String symbol;
  final int decimals;

  NativeCurrency(this.name, this.symbol, this.decimals);

  factory NativeCurrency.fromJson(Map<String, dynamic> json) =>
      _$NativeCurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$NativeCurrencyToJson(this);
}
