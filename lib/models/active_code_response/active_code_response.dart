import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/active_code/active_code.dart';

part 'active_code_response.g.dart';

@JsonSerializable()
class ActiveCodeResponse {
  final List<ActiveCode> data;

  ActiveCodeResponse(this.data);

  factory ActiveCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ActiveCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveCodeResponseToJson(this);
}
