import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/base_response.dart';

part 'send_email_response.g.dart';

@JsonSerializable()
class SendEmailResponse {
  final Data data;
  final dynamic meta;

  SendEmailResponse(this.data, this.meta);

  factory SendEmailResponse.fromJson(Map<String, dynamic> json) =>
      _$SendEmailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SendEmailResponseToJson(this);
}
