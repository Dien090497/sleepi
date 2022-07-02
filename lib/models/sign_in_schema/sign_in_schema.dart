
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_schema.g.dart';

@JsonSerializable()
class SignInSchema{
  final String email;
  final String password;

  SignInSchema(this.email, this.password);

  factory SignInSchema.fromJson(Map<String, dynamic> json) =>
      _$SignInSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SignInSchemaToJson(this);
}