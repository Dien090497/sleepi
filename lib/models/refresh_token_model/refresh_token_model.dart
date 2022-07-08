import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_model.g.dart';

@JsonSerializable()
class RefreshTokenModel {
  final _Data data;

  RefreshTokenModel(this.data);

  factory RefreshTokenModel.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenModelToJson(this);
}

@JsonSerializable()
class _Data {
  final String accessToken;
  final String refreshToken;

  _Data(this.accessToken, this.refreshToken);

  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
