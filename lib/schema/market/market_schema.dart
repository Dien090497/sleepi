

import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_schema.g.dart';

@JsonSerializable()
class MarketSchema{

  int? page;
  int? limit;
  int categoryId;
  String? sortPrice;
  List<String>? type;
  int? level;
  int? bedMint;
  List<String>? classNft;
  List<String>? quality;

  MarketSchema({
    this.page,
    this.limit,
    required this.categoryId,
    this.sortPrice,
    this.type,
    this.level,
    this.bedMint,
    this.classNft,
    this.quality,
  });

  MarketSchema copyWith({
    int? page,
    int? limit,
    int? categoryId,
    String? sortPrice,
    List<String>? type,
    int? level,
    int? bedMint,
    List<String>? classNft,
    List<String>? quality,
  }) =>
      MarketSchema(
        page: page ?? this.page,
        limit: limit ?? this.limit,
        categoryId: categoryId ?? this.categoryId,
        sortPrice: sortPrice ?? this.sortPrice,
        type: type ?? this.type,
        level: level ?? this.level,
        bedMint: bedMint ?? this.bedMint,
        classNft: classNft ?? this.classNft,
        quality: quality ?? this.quality,
      );

  factory MarketSchema.fromJson(Map<String, dynamic> json) =>
      _$MarketSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$MarketSchemaToJson(this);
  
}
