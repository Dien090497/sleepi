import 'package:bloc/bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/individual_point/individual_point_state.dart';
import 'package:slee_fi/schema/update_point/update_point_schema.dart';
import 'package:slee_fi/usecase/get_point_of_owner_usecase.dart';
import 'package:slee_fi/usecase/update_attribute_usecase.dart';

class IndividualPointCubit extends Cubit<IndividualPointState> {
  IndividualPointCubit(BedEntity bed, List<double> currentPoints)
      : super(IndividualPointState.initial(
          bed: bed,
          startAttributes: currentPoints,
          attributesChanged: currentPoints,
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
          emit(currentState.copyWith(isLoading: false, point: 0));
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
      /// nếu point null hoặc <= 0 thì không có action
      if ((currentState.point ?? -1) <= 0) return;

      /// Tăng startAttribute lên 1 và giảm point đi 1
      final currentPoint = currentState.attributesChanged[i];
      final newChangedAttribute =
          List<double>.from(currentState.attributesChanged);
      newChangedAttribute[i] = currentPoint + 1;
      emit(currentState.copyWith(
        attributesChanged: newChangedAttribute,
        point: currentState.point! - 1,
      ));
    }
  }

  void decrease(int i) {
    final currentState = state;
    if (currentState is IndividualPointInitial) {
      if (currentState.point == null) return;
      /// Giảm startAttribute đi 1 và tăng point lên 1
      final startPoint = currentState.startAttributes[i];
      final currentPoint = currentState.attributesChanged[i];
      if (currentPoint <= startPoint) return;
      final newChangedAttribute =
          List<double>.from(currentState.attributesChanged);
      newChangedAttribute[i] = currentPoint - 1;
      emit(currentState.copyWith(
        attributesChanged: newChangedAttribute,
        point: currentState.point! + 1,
      ));
    }
  }

  void updateAttribute() async {
    final currentState = state;
    if (currentState is IndividualPointInitial) {
      if (currentState.isLoading) return;
      emit(currentState.copyWith(isLoading: true));
      final distributedAttributes = List.generate(
        currentState.startAttributes.length,
        (i) =>
            currentState.attributesChanged[i] - currentState.startAttributes[i],
      );
      final updateRes = await _updateAttributeUC.call(UpdatePointSchema(
        bedId: currentState.bed.nftId,
        efficiency: distributedAttributes[0],
        luck: distributedAttributes[1],
        bonus: distributedAttributes[2],
        special: distributedAttributes[3],
        resilience: distributedAttributes[4],
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
