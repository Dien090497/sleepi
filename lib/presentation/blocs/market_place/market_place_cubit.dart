import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/usecase/get_market_place_usecase.dart';
import 'market_place_state.dart';


class MarketPlaceCubit extends Cubit<MarketPlaceState> {
  MarketPlaceCubit() : super(const MarketPlaceState.initial());

  final MarketPlaceUseCase _marketPlaceUseCase = getIt<MarketPlaceUseCase>();

  init() {
    emit(const MarketPlaceState.initial());
  }

  getMarketPlace() async {
    final result = await _marketPlaceUseCase.call(1);
    debugPrint("RESULT : $result");

    result.fold((l) {
      emit(MarketPlaceState.fail(l is FailureMessage ? l.msg : '$l'));
    }, (success)  {
      emit(const MarketPlaceState.success());
    });
  }
}
