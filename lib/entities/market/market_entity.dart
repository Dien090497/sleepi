import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_entity.freezed.dart';

@freezed
class MarketEntity with _$MarketEntity {
  const factory MarketEntity(
      {required int categoryId,
      String? sortPrice,
      String? type,
      int? level,
      String? classNft,
      String? quality}) = _MarketEntity;
}
