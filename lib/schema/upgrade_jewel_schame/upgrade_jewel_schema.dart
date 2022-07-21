import 'package:freezed_annotation/freezed_annotation.dart';

part 'upgrade_jewel_schema.g.dart';

@JsonSerializable()
class UpgradeJewelSchema {
  final List<String> nftIds;
  final int upgradeType;

  UpgradeJewelSchema(this.nftIds, this.upgradeType);

  factory UpgradeJewelSchema.fromJson(Map<String, dynamic> json) =>
      _$UpgradeJewelSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeJewelSchemaToJson(this);
}
