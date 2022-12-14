import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/nft_data_model/nft_data_model.dart';

part 'list_nft_data_model.g.dart';

@JsonSerializable()
class ListNftDataModel {
  final List<NftDataModel>? data;

  ListNftDataModel(this.data);

  factory ListNftDataModel.fromJson(Map<String, dynamic> json) =>
      _$ListNftDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListNftDataModelToJson(this);
}
