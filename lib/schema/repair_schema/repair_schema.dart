import 'package:freezed_annotation/freezed_annotation.dart';

part 'repair_schema.g.dart';

@JsonSerializable()
class RepairSchema {
  final int bedId;
  @JsonKey(name: 'token_address')
  final String tokenAddress;
  final double cost;


  RepairSchema({required this.bedId, required this.tokenAddress, required this.cost});

  factory RepairSchema.fromJson(Map<String, dynamic> json) =>
      _$RepairSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$RepairSchemaToJson(this);
}
