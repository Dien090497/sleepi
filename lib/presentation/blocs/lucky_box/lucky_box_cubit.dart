import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/lucky_box/lucky_box_entity.dart';
import 'package:slee_fi/presentation/blocs/lucky_box/lucky_box_state.dart';
import 'package:slee_fi/schema/speed_up_lucky_box_schema/speed_up_lucky_box_schema.dart';
import 'package:slee_fi/usecase/fetch_lucky_box_usecase.dart';
import 'package:slee_fi/usecase/open_lucky_box_usecase.dart';
import 'package:slee_fi/usecase/speed_up_lucky_box_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class LuckyBoxCubit extends Cubit<LuckyBoxState> {
  LuckyBoxCubit() : super(const LuckyBoxState.loaded());

  final _fetchLuckyBoxUC = getIt<FetchLuckyBoxUseCase>();
  final _speedUpLuckyBoxUC = getIt<SpeedUpLuckyBoxUseCase>();
  final _openLuckyBoxUC = getIt<OpenLuckyBoxUseCase>();

  void openLuckyBox(LuckyBoxEntity entity) async {
    var result = await _openLuckyBoxUC.call(entity.id);
    result.fold((l) => null, (r) {
      var list = state.luckyBoxes;
      list.removeWhere((element) => element.id == entity.id);
      emit(state.copyWith(luckyBoxes: list));
    });
  }

  void fetchLuckyBox() async {
    var result = await _fetchLuckyBoxUC.call(NoParams());
    result.fold((l) {}, (r) {
      emit(state.copyWith(luckyBoxes: r.map((e) => e.toEntity()).toList()));
    });
  }

  void speedUpLuckyBox(int entityId) async {
    var result = await _speedUpLuckyBoxUC.call(SpeedUpLuckyBoxSchema(entityId));

    result.fold((l) => null, (r) {
      final luckyBoxes = state.luckyBoxes;
      luckyBoxes.removeWhere((element) => element.id == entityId);
      emit(state.copyWith(luckyBoxes: luckyBoxes));
    });
  }
}
