import 'package:json_annotation/json_annotation.dart';

part 'gacha_spin_response.g.dart';
@JsonSerializable()
class GachaSpinResponse{
  final String status;
  final List<dynamic> gift;

  GachaSpinResponse({
    required this.status,
    required this.gift,
  });
  factory GachaSpinResponse.fromJson(Map<String, dynamic> json) => _$GachaSpinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GachaSpinResponseToJson(this);
}
