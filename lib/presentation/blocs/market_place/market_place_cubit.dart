import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
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
  late bool isBuying = false;
  late MarketSchema params = MarketSchema(
      page: page,
      limit: limit,
      categoryId: 1,
      sortPrice: Const.sortCondition[0],
      type: [],
      classNft: [],
      quality: []);
  final MarketPlaceUseCase _marketPlaceUseCase = getIt<MarketPlaceUseCase>();
  final BuyNFTUseCase _buyNFTUseCase = getIt<BuyNFTUseCase>();
  CategoryType _categoryType = CategoryType.bed;

  void init(CategoryType categoryType) async {
    _categoryType = categoryType;
    page = 1;
    params = params.copyWith(
        page: page,
        maxLevel: categoryType == CategoryType.bed ? Const.bedLevelMax : 5,
        limit: limit,
        minLevel: categoryType == CategoryType.bed ? 0 : 1,
        categoryId: categoryType.type,
        sortPrice: Const.sortCondition[0]);
    emit(const MarketPlaceState.loading());
    getMarketPlace(params);
  }

  void refresh() {
    page = 1;
    loadMore = false;
    params = params.copyWith(page: page);
    emit(const MarketPlaceState.loading());
    getMarketPlace(params);
  }

  void clearFilter() {
    page = 1;
    params = params.copyWith(
      page: page,
      type: [],
      classNft: [],
      quality: [],
      maxLevel: _categoryType == CategoryType.bed ? Const.bedLevelMax : 5,
      minLevel: _categoryType == CategoryType.bed ? 0 : 1,
      minBedMint: 0,
      maxBedMint: 7,
    );
    getMarketPlace(params);
  }

  Future<void> getMarketPlace(MarketSchema param) async {
    final result = await _marketPlaceUseCase.call(param);
    result.fold((l) {
      error = true;
      loadMore = false;
      emit(const MarketPlaceState.loaded([]));
    }, (success) {
      error = false;
      if (success.list.length == limit) {
        page++;
        params = params.copyWith(page: page);
        loadMore = true;
      } else {
        loadMore = false;
      }
      emit(MarketPlaceState.loaded(success.list));
    });
  }

  Future<void> loadMoreMarketPlace() async {
    final result = await _marketPlaceUseCase.call(params);
    result.fold((l) {
      error = true;
      loadMore = false;
    }, (success) {
      error = false;
      if (success.list.length == limit) {
        page++;
        params = params.copyWith(page: page);
        loadMore = true;
      } else {
        loadMore = false;
      }
      final currentState = state;
      if (currentState is MarketPlaceStateLoaded) {
        final newList = List<MarketPlaceModel>.from(currentState.list)
          ..addAll(success.list);
        emit(currentState.copyWith(list: newList));
      }
    });
  }

  Future<void> selectPrice(int index) async {
    page = 1;
    params = params.copyWith(
        page: page, limit: limit, sortPrice: Const.sortCondition[index]);
    getMarketPlace(params);
  }

  Future<void> filter(Map<String, List<String>> listSelected,
      Map<String, SfRangeValues> listSlider) async {
    listSelected.forEach((key, value) {
      if (key == LocaleKeys.type.tr()) {
        params = params.copyWith(type: value);
      }
      if (key == LocaleKeys.class_.tr()) {
        params = params.copyWith(classNft: value);
      }
      if (key == LocaleKeys.quality.tr()) {
        params = params.copyWith(quality: value);
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
    getMarketPlace(params);
  }

  Future<String> buyNFT(int nftId) async {
    isBuying = true;
    final result = await _buyNFTUseCase.call(nftId);
    return result.fold((l) {
      isBuying = false;
      return '$l';
    }, (success) {
      isBuying = false;
      if (success.status) {
        return '';
      } else {
        return success.message;
      }
    });
  }
}
