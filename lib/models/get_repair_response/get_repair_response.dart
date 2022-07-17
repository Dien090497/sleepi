
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/get_repair_entity/get_repair_entity.dart';

part 'get_repair_response.g.dart';

@JsonSerializable()
class GetRepairResponse {
  final String? durability;
  final String? cost;

  GetRepairResponse({this.durability, this.cost});

  factory GetRepairResponse.fromJson(Map<String, dynamic> json) => _$GetRepairResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetRepairResponseToJson(this);

  GetRepairtEntity toEntity() => GetRepairtEntity(
        cost: cost,
        durability: durability,
      );
}
