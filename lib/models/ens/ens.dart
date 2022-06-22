import 'package:json_annotation/json_annotation.dart';

part 'ens.g.dart';

@JsonSerializable()
class Ens {
  final String registry;

  Ens(this.registry);

  factory Ens.fromJson(Map<String, dynamic> json) => _$EnsFromJson(json);

  Map<String, dynamic> toJson() => _$EnsToJson(this);
}
