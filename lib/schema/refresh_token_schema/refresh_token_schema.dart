
import 'package:json_annotation/json_annotation.dart';
part 'refresh_token_schema.g.dart';
@JsonSerializable()
class RefreshTokenSchema{
  final String  refreshToken;

  RefreshTokenSchema(this.refreshToken);

  factory RefreshTokenSchema.fromJson(Map<String, dynamic> json) => _$RefreshTokenSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenSchemaToJson(this);
}