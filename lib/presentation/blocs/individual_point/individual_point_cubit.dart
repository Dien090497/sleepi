import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/individual_point/individual_point_state.dart';
import 'package:slee_fi/schema/update_point/update_point_schema.dart';
import 'package:slee_fi/usecase/get_point_of_owner_usecase.dart';
import 'package:slee_fi/usecase/update_attribute_usecase.dart';

class IndividualPointCubit extends Cubit<IndividualPointState> {
  IndividualPointCubit(BedEntity bed)
      : super(IndividualPointState.initial(
          bed: bed,
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

  final _getPointOfOwnerUC = getIt<GetPointOfOwnerUseCase>();
  final _updateAttributeUC = getIt<UpdateAttributeUseCase>();

  void getPoint() async {
    final currentState = state;
    if (currentState is IndividualPointInitial) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final getPointRes = await _getPointOfOwnerUC.call(currentState.bed.nftId);
      getPointRes.fold(
        (l) {
          emit(IndividualPointState.error('$l'));
          emit(currentState.copyWith(isLoading: false));
        },
        (r) {
          emit(currentState.copyWith(point: r, isLoading: false));
        },
      );
    }
  }

  void increase(int i) {
    final currentState = state;
    if (currentState is IndividualPointInitial) {
      if ((currentState.point ?? -1) <= 0) return;
      final attributeChanged = currentState.attributesChanged[i];
      final newList = List<double>.from(currentState.attributesChanged);
      newList[i] = attributeChanged + 1;
      emit(currentState.copyWith(
        attributesChanged: newList,
        point: currentState.point! - 1,
      ));
    }
  }

  void decrease(int i) {
    final currentState = state;
    if (currentState is IndividualPointInitial) {
      if ((currentState.point ?? -1) <= 0) return;
      final startAttribute = currentState.startAttributes[i];
      final attributeChanged = currentState.attributesChanged[i];
      if (attributeChanged != startAttribute) {
        final newList = List<double>.from(currentState.attributesChanged);
        newList[i] = attributeChanged - 1;
        emit(currentState.copyWith(
          attributesChanged: newList,
          point: currentState.point! + 1,
        ));
      }
    }
  }

  void updateAttribute() async {
    final currentState = state;
    if (currentState is IndividualPointInitial) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final attributes = currentState.attributesChanged;
      final updateRes = await _updateAttributeUC.call(UpdatePointSchema(
        bedId: currentState.bed.nftId,
        efficiency: attributes[0],
        luck: attributes[1],
        bonus: attributes[2],
        special: attributes[3],
        resilience: attributes[4],
      ));
      updateRes.fold(
        (l) {
          emit(IndividualPointState.error('$l'));
          emit(currentState.copyWith(isLoading: false));
        },
        (r) {
          emit(currentState.copyWith(isLoading: false));
          emit(const IndividualPointState.done());
        },
      );
    }
  }
}
