import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/user/user_info_model.dart';

part 'market_place_model.g.dart';

@JsonSerializable()
class MarketPlaceModel {
  final int count;
  final List data;

  MarketPlaceModel(this.count, this.data);

  factory MarketPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$MarketPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketPlaceModelToJson(this);
}
