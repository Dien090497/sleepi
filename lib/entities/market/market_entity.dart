import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_entity.freezed.dart';


@freezed
class MarketEntity with _$MarketEntity {
  const factory MarketEntity(
      { int? page,
      int? limit,
      required int categoryId,
      String? sortPrice,
      List<String>? type,
      int? level,
      int? bedMint,
      List<String>? classNft,
      List<String>? quality,}) = _MarketEntity;
}