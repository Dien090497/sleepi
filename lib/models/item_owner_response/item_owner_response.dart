import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';

part 'item_owner_response.g.dart';

@JsonSerializable()
class ItemOwnerResponse {
  final List<BedModel> list;
  final int count;

  ItemOwnerResponse(this.list, this.count);

  factory ItemOwnerResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemOwnerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemOwnerResponseToJson(this);
}
