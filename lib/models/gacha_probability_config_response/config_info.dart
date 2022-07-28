import 'package:json_annotation/json_annotation.dart';

part 'config_info.g.dart';

@JsonSerializable()
class ConfigInfo{
 final String? name;
 final double? value;

 ConfigInfo({
    required this.name,
    required this.value,
  });
  factory ConfigInfo.fromJson(Map<String, dynamic> json) => _$ConfigInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigInfoToJson(this);
}
