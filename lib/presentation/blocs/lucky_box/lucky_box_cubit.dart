import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/lucky_box/lucky_box_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
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

  Future<String> openLuckyBox(LuckyBoxEntity entity) async {
    var result = await _openLuckyBoxUC.call(entity.id);
    return result.fold(
      (l) => l.msg,
      (r) {
        final List<LuckyBoxEntity> list = List.from(state.luckyBoxes);
        list.removeWhere((element) => element.id == entity.id);
        emit(state.copyWith(luckyBoxes: list));
        return r.gift;
      },
    );
  }

  void fetchLuckyBox() async {
    var result = await _fetchLuckyBoxUC.call(NoParams());
    result.fold((l) {
      emit(state.copyWith(luckyBoxes: []));
    }, (r) {

      emit(state.copyWith(luckyBoxes: r.map((e) {
        return  e.toEntity();
      }).toList()));
    });
  }

  Future<String> speedUpLuckyBox(int index) async {
    var result = await _speedUpLuckyBoxUC
        .call(SpeedUpLuckyBoxSchema(state.luckyBoxes[index].id));

    return result.fold((l) => l.msg, (r) {
      final List<LuckyBoxEntity> luckyBoxes = List.from(state.luckyBoxes);
      final entity = luckyBoxes.removeAt(index);
      final data = entity.copyWith(isOpen: 0);
      luckyBoxes.insert(index, data);
      emit(state.copyWith(luckyBoxes: luckyBoxes));
      return LocaleKeys.speed_up_success.tr();
    });
  }
}
