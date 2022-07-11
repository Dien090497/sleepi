import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/list_market_place/list_market_place_model.dart';

part 'market_place_state.freezed.dart';

@freezed
class MarketPlaceState with _$MarketPlaceState {
  const factory MarketPlaceState.initial() = MarketPlaceStateInit;

  const factory MarketPlaceState.loading() = MarketPlaceStateLoading;

  const factory MarketPlaceState.loadingMore() = MarketPlaceStateLoadingMore;

  const factory MarketPlaceState.loaded(ListMarketPlaceModel list) = MarketPlaceStateLoaded;

  const factory MarketPlaceState.loadedMore(ListMarketPlaceModel list) = MarketPlaceStateLoadedMore;

  const factory MarketPlaceState.buySuccess() = MarketPlaceStateBuySuccess;

  const factory MarketPlaceState.fail(String msg) = MarketPlaceStateFailed;

  const factory MarketPlaceState.buyFail(String msg) = MarketPlaceStateBuyFailed;

}
