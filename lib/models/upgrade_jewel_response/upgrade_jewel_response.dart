import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';

part 'upgrade_jewel_response.g.dart';

@JsonSerializable()
class UpgradeJewelResponse {
  final bool status;
  final BedModel? nftAttribute;
  final String? msg;

  UpgradeJewelResponse(this.status, this.nftAttribute, this.msg);

  factory UpgradeJewelResponse.fromJson(Map<String, dynamic> data) {
    return _$UpgradeJewelResponseFromJson(data);
  }

  Map<String, dynamic> toJson() => _$UpgradeJewelResponseToJson(this);
}
