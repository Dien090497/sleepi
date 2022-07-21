import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';

part 'upgrade_jewel_response.g.dart';

@JsonSerializable()
class UpgradeJewelResponse {
  final bool status;
  final String msg;
  final BedModel nftAttribute;

  UpgradeJewelResponse(this.status, this.msg, this.nftAttribute);
  factory UpgradeJewelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpgradeJewelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpgradeJewelResponseToJson(this);
}
