import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';

part 'market_place_state.freezed.dart';

@freezed
class MarketPlaceState with _$MarketPlaceState {
  const factory MarketPlaceState.initial() = MarketPlaceStateInit;

  const factory MarketPlaceState.loading() = MarketPlaceStateLoading;

  const factory MarketPlaceState.loaded(List<MarketPlaceModel> list) =
      MarketPlaceStateLoaded;

  const factory MarketPlaceState.buySuccess() = MarketPlaceStateBuySuccess;

  const factory MarketPlaceState.buyFail(String msg) =
      MarketPlaceStateBuyFailed;
}
