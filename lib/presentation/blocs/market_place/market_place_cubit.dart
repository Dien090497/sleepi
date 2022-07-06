import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/usecase/get_market_place_usecase.dart';
import 'market_place_state.dart';

class MarketPlaceCubit extends Cubit<MarketPlaceState> {
  MarketPlaceCubit() : super(const MarketPlaceState.initial());

  final MarketPlaceUseCase _marketPlaceUseCase = getIt<MarketPlaceUseCase>();

  init(int idCategory) {
    emit(const MarketPlaceState.loading());
    getMarketPlace(idCategory);
  }
  refresh(int idCategory){
    getMarketPlace(idCategory);
  }

  Future<void> getMarketPlace(int idCategory) async {
    final result = await _marketPlaceUseCase.call(idCategory);
    result.fold((l) {
      emit(MarketPlaceState.fail(l is FailureMessage ? l.msg : '$l'));
    }, (success) {
      debugPrint("success : ${success.list[1].special}");
      emit(MarketPlaceState.success(success));
    });
  }
}
