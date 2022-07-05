import 'package:json_annotation/json_annotation.dart';

part 'send_email_response.g.dart';

@JsonSerializable()
class SendEmailResponse {
  final Content data;
  final Object meta;

  SendEmailResponse(this.data, this.meta);

  factory SendEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailResponseToJson(this);
}

@JsonSerializable()
class Content {
  final String message;

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  Content(this.message);

  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
