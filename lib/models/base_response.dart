import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';
class BaseResponse<T>{

}
@JsonSerializable()
class Data{
  final String message;

  Data(this.message);
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}