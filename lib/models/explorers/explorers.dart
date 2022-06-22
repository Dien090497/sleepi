import 'package:freezed_annotation/freezed_annotation.dart';

part 'explorers.g.dart';

@JsonSerializable()
class Explorers {
  String name;
  String url;
  String standard;

  Explorers(this.name, this.url, this.standard);

  factory Explorers.fromJson(Map<String, dynamic> json) =>
      _$ExplorersFromJson(json);

  Map<String, dynamic> toJson() => _$ExplorersToJson(this);
}
