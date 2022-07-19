
import 'package:freezed_annotation/freezed_annotation.dart';

part 'minting_schema.g.dart';
@JsonSerializable()
class MintingSchema {
  MintingSchema({
    required this.bedIdParent1,
    required this.bedIdParent2,
    required this.isInsurance,
  });

  final int bedIdParent1;
  final int bedIdParent2;
  final bool isInsurance;


  factory MintingSchema.fromJson(Map<String, dynamic> json) =>
      _$MintingSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$MintingSchemaToJson(this);
}