import 'package:json_annotation/json_annotation.dart';

part 'verify_response.g.dart';

@JsonSerializable()
class VerifyResponse {
  final bool status;
  final String message;

  const VerifyResponse({required this.status, required this.message});

  factory VerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyResponseToJson(this);
}
