import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/nft_data_model/nft_data_model.dart';

part 'list_nft_data_model.g.dart';

@JsonSerializable()
class ListNftDataModel {
  final List<NftDataModel> data;
  final _Meta meta;

  ListNftDataModel(this.data, this.meta);

  factory ListNftDataModel.fromJson(Map<String, dynamic> json) =>
      _$ListNftDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListNftDataModelToJson(this);
}

@JsonSerializable()
class _Meta {
  final int itemCount;
  final int totalItem;
  final int itemsPerPage;
  final int totalPages;
  final int currentPage;

  _Meta(this.itemCount, this.totalItem, this.itemsPerPage, this.totalPages,
      this.currentPage);

  factory _Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
