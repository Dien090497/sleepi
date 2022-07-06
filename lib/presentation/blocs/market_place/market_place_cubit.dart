import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/market/market_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/usecase/get_market_place_usecase.dart';
import 'market_place_state.dart';

class MarketPlaceCubit extends Cubit<MarketPlaceState> {
  MarketPlaceCubit() : super(const MarketPlaceState.initial());
  late MarketEntity params =
      const MarketEntity(categoryId: 1, sortPrice: "LowPrice");
  final MarketPlaceUseCase _marketPlaceUseCase = getIt<MarketPlaceUseCase>();

  init(int idCategory) {
    params = params.copyWith(categoryId: idCategory, sortPrice: "LowPrice");
    log("params : ${params.toString()}");
    emit(const MarketPlaceState.loading());
    getMarketPlace(params);
  }

  refresh() {
    log("params : ${params.toString()}");
    getMarketPlace(params);
  }

  Future<void> getMarketPlace(MarketEntity params) async {
    final result = await _marketPlaceUseCase.call(params);
    result.fold((l) {
      log("fail : ${l is FailureMessage ? l.msg : '$l'}");
      emit(MarketPlaceState.fail(l is FailureMessage ? l.msg : '$l'));
    }, (success) {
      log("result : ${success.toString()}");
      emit(MarketPlaceState.success(success));
    });
  }

  Future<void> selectPrice(int price) async {
    params = params.copyWith(sortPrice: price == 0 ? "LowPrice" : "HighPrice");
    log("params :$price ${params.toString()}");
    getMarketPlace(params);
  }

  Future<void> filter({String? type, String? classBed, String? quality, int? level}) async {
    params = params.copyWith(type: type, classNft: classBed, quality: quality, level: level);
    log("params : ${params.toString()}");
    getMarketPlace(params);
  }
}
