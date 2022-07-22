import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

part 'upgrade_jewel_schema.g.dart';

@JsonSerializable()
class UpgradeSchema {
  final List<String> nftIds;
  final CategoryType upgradeType;

  UpgradeSchema(this.nftIds, this.upgradeType);

  factory UpgradeSchema.fromJson(Map<String, dynamic> json) =>
      _$UpgradeSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeSchemaToJson(this);
}
