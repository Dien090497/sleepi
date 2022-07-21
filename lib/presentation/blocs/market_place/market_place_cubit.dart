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
        maxLevel: categoryType == CategoryType.bed ? 30 : 5,
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
      maxLevel: _categoryType == CategoryType.bed ? 30 : 5,
      minLevel: _categoryType == CategoryType.bed ? 0 : 1,
      minBedMint: 0,
      maxBedMint: 7,
    );
    getMarketPlace(params);
  }

  Future<void> getMarketPlace(MarketSchema param) async {
    emit(MarketPlaceState.loaded(
        _list.map((e) => MarketPlaceModel.fromJson(e)).toList()));
    return;
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

final _list = [
  {
    "id": 72,
    "nftId": 72,
    "nftName": "Beds genesis #00072",
    "parent1": null,
    "parent2": null,
    "contractAddress": "0x75A78Ca9e9B43c8ae1dB1844238937E340f5C46a",
    "tokenId": 72,
    "owner": "0x1bab8030249382a887f967fcaa7fe0be7b390728",
    "type": "bed",
    "nftType": "bed",
    "jewelType": null,
    "itemType": null,
    "classNft": "Flexible",
    "quality": "common",
    "image": "https://nft-dev.sleefi.com/v1/nft/bed/pod/00072.png",
    "time": 1,
    "level": 1,
    "levelUpTime": null,
    "bedMint": 0,
    "isMint": 0,
    "isBurn": 0,
    "efficiency": "9.00",
    "durability": "100.00",
    "luck": "15.00",
    "bonus": "1.00",
    "special": "3.00",
    "resilience": "6.00",
    "createdAt": "2022-07-18T04:28:28.361Z",
    "updatedAt": "2022-07-18T04:28:28.361Z",
    "category_id": 1,
    "is_lock": 1,
    "status": "DEFAULT",
    "price": "1",
    "transaction_fee": "6",
    "symbol": "AVAX",
    "insurancePercent": 3,
    "startTime": 3,
    "endTime": 12
  },
  {
    "id": 74,
    "nftId": 74,
    "nftName": "Beds genesis #00074",
    "parent1": null,
    "parent2": null,
    "contractAddress": "0x75A78Ca9e9B43c8ae1dB1844238937E340f5C46a",
    "tokenId": 74,
    "owner": "0x1bab8030249382a887f967fcaa7fe0be7b390728",
    "type": "bed",
    "nftType": "bed",
    "jewelType": null,
    "itemType": null,
    "classNft": "Middle",
    "quality": "common",
    "image": "https://nft-dev.sleefi.com/v1/nft/bed/pod/00074.png",
    "time": 1,
    "level": 1,
    "levelUpTime": null,
    "bedMint": 0,
    "isMint": 0,
    "isBurn": 0,
    "efficiency": "7.00",
    "durability": "100.00",
    "luck": "4.00",
    "bonus": "1.00",
    "special": "12.00",
    "resilience": "4.00",
    "createdAt": "2022-07-18T04:28:28.361Z",
    "updatedAt": "2022-07-18T04:28:28.361Z",
    "category_id": 1,
    "is_lock": 1,
    "status": "DEFAULT",
    "price": "1",
    "transaction_fee": "6",
    "symbol": "AVAX",
    "insurancePercent": 3,
    "startTime": 4.5,
    "endTime": 7
  },
  {
    "id": 76,
    "nftId": 76,
    "nftName": "Beds genesis #00076",
    "parent1": null,
    "parent2": null,
    "contractAddress": "0x75A78Ca9e9B43c8ae1dB1844238937E340f5C46a",
    "tokenId": 76,
    "owner": "0x1bab8030249382a887f967fcaa7fe0be7b390728",
    "type": "bed",
    "nftType": "bed",
    "jewelType": null,
    "itemType": null,
    "classNft": "Flexible",
    "quality": "uncommon",
    "image": "https://nft-dev.sleefi.com/v1/nft/bed/pod/00076.png",
    "time": 1,
    "level": 1,
    "levelUpTime": null,
    "bedMint": 0,
    "isMint": 0,
    "isBurn": 0,
    "efficiency": "17.00",
    "durability": "100.00",
    "luck": "10.00",
    "bonus": "11.00",
    "special": "15.00",
    "resilience": "13.00",
    "createdAt": "2022-07-18T04:28:28.361Z",
    "updatedAt": "2022-07-18T04:28:28.361Z",
    "category_id": 1,
    "is_lock": 1,
    "status": "DEFAULT",
    "price": "1",
    "transaction_fee": "6",
    "symbol": "AVAX",
    "insurancePercent": 4,
    "startTime": 3,
    "endTime": 12
  }
];
