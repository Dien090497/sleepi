import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/models/jewel_model/jewel_model.dart';

part 'list_jewel_response.g.dart';

@JsonSerializable()
class ListJewelResponse {
  final List<JewelModel> list;
  final int count;

  ListJewelResponse(this.list, this.count);

  factory ListJewelResponse.fromJson(Map<String, dynamic> json) {
    return _$ListJewelResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListJewelResponseToJson(this);
}

@JsonSerializable()
class ListBedResponse {
  final List<BedModel> list;
  final int count;

  ListBedResponse(this.list, this.count);

  factory ListBedResponse.fromJson(Map<String, dynamic> json) {
    return _$ListBedResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListBedResponseToJson(this);
}
