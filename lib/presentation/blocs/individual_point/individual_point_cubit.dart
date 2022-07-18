import 'package:bloc/bloc.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/individual_point/individual_point_state.dart';

class IndividualPointCubit extends Cubit<IndividualPointState> {
  IndividualPointCubit()
      : super(const IndividualPointState.initial(
          point: 4,
          startAttributes: [7, 13, 12, 9, 9],
          attributesChanged: [7, 13, 12, 9, 9],
          attributesNames: [
            LocaleKeys.efficiency,
            LocaleKeys.luck,
            LocaleKeys.bonus,
            LocaleKeys.special,
            LocaleKeys.resilience,
          ],
        ));

  void increase(int i) {
    final currentState = state;
    if (currentState is IndividualPointInitial && currentState.point > 0) {
      final attributeChanged = currentState.attributesChanged[i];
      final newList = List<double>.from(currentState.attributesChanged);
      newList[i] = attributeChanged + 1;
      emit(currentState.copyWith(
        attributesChanged: newList,
        point: currentState.point - 1,
      ));
    }
  }

  void decrease(int i) {
    final currentState = state;
    if (currentState is IndividualPointInitial) {
      final startAttribute = currentState.startAttributes[i];
      final attributeChanged = currentState.attributesChanged[i];
      if (attributeChanged != startAttribute) {
        final newList = List<double>.from(currentState.attributesChanged);
        newList[i] = attributeChanged - 1;
        emit(currentState.copyWith(
          attributesChanged: newList,
          point: currentState.point + 1,
        ));
      }
    }
  }
}
