import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';

part 'fetch_bed_response.g.dart';

@JsonSerializable()
class OwnerNFTResponse {
  final List<BedModel> list;
  final int count;

  OwnerNFTResponse(this.list, this.count);

  factory OwnerNFTResponse.fromJson(Map<String, dynamic> json) =>
      _$OwnerNFTResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerNFTResponseToJson(this);
}
