import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/schema/market/market_schema.dart';
import 'package:slee_fi/usecase/buy_nft_usecase.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/get_market_place_usecase.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'market_place_state.dart';

class MarketPlaceCubit extends Cubit<MarketPlaceState> {
  MarketPlaceCubit() : super(const MarketPlaceState.initial());
  late int page = 1;
  late int limit = 10;
  late bool loadMore = false;
  late bool error = false;
  late MarketSchema params = MarketSchema(
      page: page,
      limit: limit,
      categoryId: 1,
      sortPrice: "LowPrice",
      type: [],
      classNft: [],
      quality: []);
  final MarketPlaceUseCase _marketPlaceUseCase = getIt<MarketPlaceUseCase>();
  final BuyNFTUseCase _buyNFTUseCase = getIt<BuyNFTUseCase>();

  init(CategoryType categoryType) async {
    page = 1;
    params = params.copyWith(
        page: page,
        maxLevel: categoryType == CategoryType.bed ? 30 : 5,
        limit: limit,
        categoryId: categoryType.index,
        sortPrice: "LowPrice");
    log("params : ${params.toJson()}");
    emit(const MarketPlaceState.loading());
    getMarketPlace(params);
  }

  refresh() {
    page = 1;
    loadMore = false;
    params = params.copyWith(page: page);
    log("params : ${params.toJson()}");
    getMarketPlace(params);
  }

  clearFilter() {
    page = 1;
    params = params.copyWith(page: page, type: [], classNft: [], quality: []);
    getMarketPlace(params);
  }

  Future<void> getMarketPlace(MarketSchema param) async {
    final result = await _marketPlaceUseCase.call(param);
    result.fold((l) {
      log("fail : ${'$l'}");
      error = true;
      loadMore = false;
      emit(MarketPlaceState.fail('$l'));
    }, (success) {
      error = false;
      log("result : ${success.list.length}");
      if (success.list.length == limit) {
        page++;
        params = params.copyWith(page: page);
        loadMore = true;
      } else {
        loadMore = false;
      }
      emit(MarketPlaceState.loaded(success));
    });
  }

  Future<void> loadMoreMarketPlace() async {
    log("params : ${params.toJson()}");
    final result = await _marketPlaceUseCase.call(params);
    result.fold((l) {
      error = true;
      loadMore = false;
      log("fail : ${'$l'}");
      emit(MarketPlaceState.fail('$l'));
    }, (success) {
      error = false;
      log("result : ${success.toString()}");
      if (success.list.length == limit) {
        page++;
        params = params.copyWith(page: page);
        loadMore = true;
      } else {
        loadMore = false;
      }
      emit(MarketPlaceState.loadedMore(success));
    });
  }

  Future<void> selectPrice(int price) async {
    page = 1;
    params = params.copyWith(
        page: page,
        limit: limit,
        sortPrice: price == 0 ? "LowPrice" : "HighPrice");
    log("params :$price ${params.toJson()}");
    getMarketPlace(params);
  }

  Future<void> filter(Map<String, List<String>> listSelected,
      Map<String, SfRangeValues> listSlider) async {
    listSelected.forEach((key, value) {
      if (key == LocaleKeys.type.tr()) {
        params = params.copyWith(
          type: value,
        );
      }
      if (key == LocaleKeys.class_.tr()) {
        params = params.copyWith(
          classNft: value,
        );
      }
      if (key == LocaleKeys.quality.tr()) {
        params = params.copyWith(
          quality: value,
        );
      }
    });
    listSlider.forEach((key, value) {
      if (key == LocaleKeys.level.tr()) {
        params = params.copyWith(minLevel: value.start, maxLevel: value.end);
      }
      if (key == LocaleKeys.mint.tr()) {
        params =
            params.copyWith(minBedMint: value.start, maxBedMint: value.end);
      }
    });
    page = 1;
    params = params.copyWith(page: page, limit: limit);
    log("params : ${params.toJson()}");
    getMarketPlace(params);
  }

  Future<void> buyNFT(int nftId) async {
    final result = await _buyNFTUseCase.call(nftId);
    result.fold((l) {
      emit(MarketPlaceState.buyFail('$l'));
    }, (success) {
      if (success.status) {
        emit(const MarketPlaceState.buySuccess());
      } else {
        emit(MarketPlaceState.buyFail(success.message));
      }
    });
  }
}
