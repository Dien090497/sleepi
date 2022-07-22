import 'package:json_annotation/json_annotation.dart';
import 'history_data.dart';

part 'gacha_history_response.g.dart';

@JsonSerializable()
class GachaHistoryResponse {
  final String? status;
  final HistoryData? data;

  GachaHistoryResponse({this.status, this.data});

  factory GachaHistoryResponse.fromJson(Map<String, dynamic> json) => _$GachaHistoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GachaHistoryResponseToJson(this);

}
