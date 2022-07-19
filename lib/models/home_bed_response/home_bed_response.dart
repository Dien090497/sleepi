import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/bed_model_home/bed_model_home.dart';

part 'home_bed_response.g.dart';

@JsonSerializable()
class HomeBedResponse {
  final List<BedModelHome> list;
  final int count;

  HomeBedResponse(this.list, this.count);

  factory HomeBedResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeBedResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeBedResponseToJson(this);
}
