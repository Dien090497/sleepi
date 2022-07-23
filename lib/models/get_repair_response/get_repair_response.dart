
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/get_repair_entity/get_repair_entity.dart';

part 'get_repair_response.g.dart';

@JsonSerializable()
class GetRepairResponse {
  final GetRepairData data;

  GetRepairResponse({required this.data});

  factory GetRepairResponse.fromJson(Map<String, dynamic> json) => _$GetRepairResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRepairResponseToJson(this);

}

@JsonSerializable()
class GetRepairData {
  final int? level;
  final double? fee;

  GetRepairData({this.level, this.fee});

  factory GetRepairData.fromJson(Map<String, dynamic> json) => _$GetRepairDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetRepairDataToJson(this);

  GetRepairtEntity toEntity() => GetRepairtEntity(
    level: level.toString(),
    fee: fee,
  );
}
