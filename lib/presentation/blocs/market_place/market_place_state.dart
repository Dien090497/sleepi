import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_place_state.freezed.dart';

@freezed
class MarketPlaceState with _$MarketPlaceState {
  const factory MarketPlaceState.initial() = MarketPlaceStateInit;

  const factory MarketPlaceState.success() = MarketPlaceStateSuccess;

  const factory MarketPlaceState.fail(String msg) = MarketPlaceStateFailed;

}
