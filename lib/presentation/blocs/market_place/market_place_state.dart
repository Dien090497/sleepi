import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/list_market_place/list_market_place_model.dart';

part 'market_place_state.freezed.dart';

@freezed
class MarketPlaceState with _$MarketPlaceState {
  const factory MarketPlaceState.initial() = MarketPlaceStateInit;

  const factory MarketPlaceState.success(ListMarketPlaceModel list) = MarketPlaceStateSuccess;

  const factory MarketPlaceState.fail(String msg) = MarketPlaceStateFailed;

}
