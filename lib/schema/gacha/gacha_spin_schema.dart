import 'package:freezed_annotation/freezed_annotation.dart';

part 'gacha_spin_schema.g.dart';

@JsonSerializable()
class GachaSpinSchema{
  final int probability;

  GachaSpinSchema({
    required this.probability,
  });

  factory GachaSpinSchema.fromJson(Map<String, dynamic> json) =>
      _$GachaSpinSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$GachaSpinSchemaToJson(this);

}
