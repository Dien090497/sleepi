import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'access_token_expire_model.g.dart';

@JsonSerializable()
class AccessTokenExpireModel {
  final _Error error;

  AccessTokenExpireModel(this.error);

  factory AccessTokenExpireModel.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenExpireModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenExpireModelToJson(this);
}

@JsonSerializable()
class _Error {
  final int? statusCode;
  final String? message;
  final String? errorName;
  final _Details? details;
  final String? path;
  final String? requestId;
  final String? timestamp;

  _Error(this.statusCode, this.message, this.errorName, this.details, this.path,
      this.requestId, this.timestamp);

  factory _Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable()
class _Details {
  final int? statusCode;
  final String? message;
  final String? error;

  _Details(this.statusCode, this.message, this.error);

  factory _Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}
