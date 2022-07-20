import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_schema.g.dart';

@JsonSerializable()
class MarketSchema {
  int? page;
  int? limit;
  int categoryId;
  String? sortPrice;
  List<String>? type;
  double minLevel;
  double maxLevel;
  double minBedMint;
  double maxBedMint;
  List<String>? classNft;
  List<String>? quality;

  MarketSchema({
    this.page,
    this.limit,
    this.minBedMint = 0,
    this.maxBedMint = 7,
    this.maxLevel = 30,
    this.minLevel = 0,
    required this.categoryId,
    this.sortPrice,
    this.type,
    this.classNft,
    this.quality,
  });

  MarketSchema copyWith({
    int? page,
    int? limit,
    int? categoryId,
    String? sortPrice,
    List<String>? type,
    List<String>? classNft,
    List<String>? quality,
    double? minLevel,
    double? maxLevel,
    double? minBedMint,
    double? maxBedMint,
  }) =>
      MarketSchema(
          page: page ?? this.page,
          limit: limit ?? this.limit,
          categoryId: categoryId ?? this.categoryId,
          sortPrice: sortPrice ?? this.sortPrice,
          type: type ?? this.type,
          classNft: classNft ?? this.classNft,
          quality: quality ?? this.quality,
          maxLevel: maxLevel ?? this.maxLevel,
          minLevel: minLevel ?? this.minLevel,
          minBedMint: minBedMint ?? this.minBedMint,
          maxBedMint: maxBedMint ?? this.maxBedMint);

  factory MarketSchema.fromJson(Map<String, dynamic> json) =>
      _$MarketSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$MarketSchemaToJson(this);
}
