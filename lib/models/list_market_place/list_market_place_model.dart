import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';

part 'list_market_place_model.g.dart';

@JsonSerializable()
class ListMarketPlaceModel {
  final List<MarketPlaceModel> list;
  final int count;

  ListMarketPlaceModel(this.list, this.count);

  factory ListMarketPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$ListMarketPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListMarketPlaceModelToJson(this);
}
