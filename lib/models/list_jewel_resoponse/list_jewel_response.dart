import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/jewel_model/jewel_model.dart';

part 'list_jewel_response.g.dart';

@JsonSerializable()
class ListJewelResponse {
  final List<JewelModel> list;
  final int count;

  ListJewelResponse(this.list, this.count);

  factory ListJewelResponse.fromJson(Map<String, dynamic> json) =>
      _$ListJewelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListJewelResponseToJson(this);
}
