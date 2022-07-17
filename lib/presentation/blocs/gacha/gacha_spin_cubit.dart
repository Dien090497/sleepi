import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/schema/gacha/gacha_spin_schema.dart';
import 'package:slee_fi/usecase/gacha_spin_usecase.dart';

import 'gacha_spin_state.dart';

class GachaSpinCubit extends Cubit<GachaSpinState> {
  GachaSpinCubit(): super(const GachaSpinState.initial());

  String contractAddressTo = '';
  double? fee;

  final _gachaSpinUC = getIt<GachaSpinUseCase>();

  void init() {
    emit(const GachaSpinState.initial());
  }

  Future<void> gachaSpin(GachaSpinSchema params) async {

    final result = await _gachaSpinUC.call(params);
    result.fold((l) {
      emit(GachaSpinState.fail('$l'));
    }, (success) {
      emit(GachaSpinState.success(success));
    });
  }
}
