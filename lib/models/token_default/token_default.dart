import 'package:json_annotation/json_annotation.dart';

part 'token_default.g.dart';

@JsonSerializable()
class TokenDefault {
  final String slft;
  final String slgt;
  final String wavax;
  final String bed;
  final String jewels;
  final String bedBoxes;
  final String items;


  TokenDefault({required this.slft, required this.slgt, required this.wavax, required this.bed, required this.jewels,
      required this.bedBoxes, required this.items});

  factory TokenDefault.fromJson(Map<String, dynamic> json) =>
      _$TokenDefaultFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDefaultToJson(this);
}
