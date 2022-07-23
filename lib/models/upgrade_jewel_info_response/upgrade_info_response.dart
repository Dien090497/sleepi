import 'package:json_annotation/json_annotation.dart';

part 'upgrade_info_response.g.dart';

@JsonSerializable()
class UpgradeInfoResponse {
  final int level;
  final int slft;
  final int? slgt;
  final int percent;

  UpgradeInfoResponse(this.level, this.slft, this.slgt, this.percent);

  factory UpgradeInfoResponse.fromJson(Map<String, dynamic> json) {
    return
      _$UpgradeInfoResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UpgradeInfoResponseToJson(this);
}
