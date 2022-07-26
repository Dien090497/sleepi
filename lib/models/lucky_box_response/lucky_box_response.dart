
import 'package:freezed_annotation/freezed_annotation.dart';

part 'lucky_box_response.g.dart';
@JsonSerializable()
class OpenLuckyBoxResponse {

  final String status;
  final String gift;

  OpenLuckyBoxResponse(this.status, this.gift);

  factory OpenLuckyBoxResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenLuckyBoxResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OpenLuckyBoxResponseToJson(this);

}